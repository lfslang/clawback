#!/bin/bash
# Clawback 配置对比模块 - 修复版
# 基于回滚视角的差异对比

# 加载语言包（如果可用）
load_language_for_compare() {
    # 尝试从 clawback 获取语言设置
    local lang_file="${HOME}/.openclaw/.clawback-lang"
    if [ -f "$lang_file" ]; then
        local lang=$(cat "$lang_file" 2>/dev/null)
        if [ -n "$lang" ]; then
            # 尝试加载对应语言包
            local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
            local lang_path="${script_dir}/../lang/${lang}.sh"
            if [ -f "$lang_path" ]; then
                source "$lang_path" 2>/dev/null || true
            fi
        fi
    fi
}

# 加载语言包
load_language_for_compare

# 颜色定义（使用 tput 或 echo -e）
setup_colors() {
    if [ -n "$TERM" ] && command -v tput &> /dev/null; then
        ncolors=$(tput colors 2>/dev/null)
        if [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
            GREEN=$(tput setaf 2)
            RED=$(tput setaf 1)
            YELLOW=$(tput setaf 3)
            GRAY=$(tput setaf 8)
            RESET=$(tput sgr0)
            return
        fi
    fi
    # 回退到转义序列
    GREEN='\033[32m'
    RED='\033[31m'
    YELLOW='\033[33m'
    GRAY='\033[90m'
    RESET='\033[0m'
}

setup_colors

# 敏感字段列表
SENSITIVE_FIELDS="apiKey|appSecret|secret|token|password|key"

# 打码敏感信息
mask_sensitive() {
    local value="$1"
    if echo "$value" | grep -qiE "^sk-"; then
        echo "sk-***"
    elif echo "$value" | grep -qiE "($SENSITIVE_FIELDS)"; then
        echo "***"
    else
        echo "$value"
    fi
}

# 提取JSON字段值
extract_field_value() {
    local file="$1"
    local field="$2"
    grep -oP "\"$field\"\s*:\s*\"?\K[^,\"\}]+" "$file" 2>/dev/null | head -1
}

# 检查字段是否存在
field_exists() {
    local file="$1"
    local field="$2"
    grep -q "\"$field\"" "$file" 2>/dev/null
}

# 主对比函数
compare_modules() {
    local backup_file="$1"
    local current_file="$2"
    
    local modules="meta wizard models agents tools messages commands session hooks channels gateway skills plugins"
    
    echo ""
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║${YELLOW}           🔍 Clawback - $(t "compare_preview_title" 2>/dev/null || echo "回滚预览")                               ${RESET}║"
    echo "║                                                                ║"
    echo "║  $(t "compare_desc" 2>/dev/null || echo "说明：此界面显示回滚到该备份版本后，配置将发生的变化")            ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo ""
    
    local has_diff=false
    
    for module in $modules; do
        local in_backup=$(grep -c "\"$module\"" "$backup_file" 2>/dev/null || echo 0)
        local in_current=$(grep -c "\"$module\"" "$current_file" 2>/dev/null || echo 0)
        
        if [ "$in_backup" -gt 0 ] || [ "$in_current" -gt 0 ]; then
            local mod_backup=$(grep -A 20 "\"$module\"" "$backup_file" 2>/dev/null | head -15 | tr '\n' ' ')
            local mod_current=$(grep -A 20 "\"$module\"" "$current_file" 2>/dev/null | head -15 | tr '\n' ' ')
            
            if [ "$mod_backup" = "$mod_current" ]; then
                echo "${GRAY}📦 $module [✓ $(t "compare_module_no_change" 2>/dev/null || echo "无变化")]${RESET}"
            else
                has_diff=true
                echo "┌────────────────────────────────────────────────────────────────┐"
                echo "│${YELLOW}📦 $module${RESET}"
                echo "├────────────────────────────────────────────────────────────────┤"
                compare_module_fields "$backup_file" "$current_file" "$module"
                echo "└────────────────────────────────────────────────────────────────┘"
                echo ""
            fi
        fi
    done
    
    if [ "$has_diff" = false ]; then
        echo "  ✅ $(t "compare_no_change" 2>/dev/null || echo "两个配置完全相同，回滚不会产生任何变化")"
        echo ""
    fi
    
    echo "${GRAY}  $(t "compare_legend" 2>/dev/null || echo "图例: [+] 新增(绿)  [-] 删除(红)  [~] 变更(黄)  ✓ 无变化")${RESET}"
    echo ""
}

# 对比模块字段
compare_module_fields() {
    local backup_file="$1"
    local current_file="$2"
    local module="$3"
    
    local common_fields="enabled primary fallback apiKey baseUrl appId appSecret timeout model"
    
    for field in $common_fields; do
        local has_in_backup=0
        local has_in_current=0
        
        if field_exists "$backup_file" "$field"; then has_in_backup=1; fi
        if field_exists "$current_file" "$field"; then has_in_current=1; fi
        
        if [ $has_in_backup -eq 1 ] && [ $has_in_current -eq 0 ]; then
            local val=$(extract_field_value "$backup_file" "$field")
            val=$(mask_sensitive "$val")
            printf "│  ${GREEN}[+] %-15s: %s${RESET}\n" "$field" "$val"
            
        elif [ $has_in_backup -eq 0 ] && [ $has_in_current -eq 1 ]; then
            local val=$(extract_field_value "$current_file" "$field")
            val=$(mask_sensitive "$val")
            printf "│  ${RED}[-] %-15s: %s${RESET}\n" "$field" "$val"
            
        elif [ $has_in_backup -eq 1 ] && [ $has_in_current -eq 1 ]; then
            local val_backup=$(extract_field_value "$backup_file" "$field")
            local val_current=$(extract_field_value "$current_file" "$field")
            
            if [ "$val_backup" != "$val_current" ]; then
                val_backup=$(mask_sensitive "$val_backup")
                val_current=$(mask_sensitive "$val_current")
                printf "│  ${YELLOW}[~] %-15s: %s → %s${RESET}\n" "$field" "$val_current" "$val_backup"
            fi
        fi
    done
}

# 主程序
if [ $# -eq 2 ]; then
    compare_modules "$1" "$2"
else
    echo "$(t "compare_usage" 2>/dev/null || echo "用法: $0 <备份文件> <当前文件>")"
    exit 1
fi
