#!/bin/bash
# Copyright (c) 2026 Liufs <1936638@qq.com>
# Licensed under the MIT License


# 确定用户主目录（多重回退）
if [ -z "$HOME" ]; then
    # 尝试从 /etc/passwd 获取
    HOME=$(getent passwd "$(whoami)" | cut -d: -f6)
fi

if [ -z "$HOME" ]; then
    # 最后回退到当前目录
    HOME="$(pwd)"
    echo "Warning: HOME not set, using current directory: $HOME" >&2
fi

CONFIG_DIR="${CONFIG_DIR:-${HOME}/.openclaw}"
LOG_DIR="${CONFIG_DIR}/.clawback"
LOG_FILE="${LOG_DIR}/install.log"
MANIFEST_FILE="${LOG_DIR}/manifest.json"

# 初始化日志目录
init_logging() {
    mkdir -p "$LOG_DIR"
}

# 写日志
log() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    echo "[$timestamp] [$level] $message" >> "$LOG_FILE"
}

log_info() { log "INFO" "$1"; }
log_warn() { log "WARN" "$1"; }
log_error() { log "ERROR" "$1"; }

# 记录安装清单
record_install() {
    local file="$1"
    local dest="$2"
    local checksum=$(md5sum "$file" 2>/dev/null | awk '{print $1}')
    
    # 创建或更新 manifest
    if [ ! -f "$MANIFEST_FILE" ]; then
        echo '{"version": "1.0", "files": [], "installed_at": "'$(date -Iseconds)'"}' > "$MANIFEST_FILE"
    fi
    
    # 添加文件记录 (使用临时文件避免依赖 jq)
    local tmp_file=$(mktemp)
    cat "$MANIFEST_FILE" | sed 's/\]$//' > "$tmp_file"
    if [ "$(cat "$tmp_file" | wc -l)" -gt 1 ]; then
        echo "," >> "$tmp_file"
    fi
    echo '{"source": "'"$file"'", "dest": "'"$dest"'", "checksum": "'"$checksum"'", "time": "'$(date -Iseconds)'"}]' >> "$tmp_file"
    mv "$tmp_file" "$MANIFEST_FILE"
    
    log_info "Installed: $file -> $dest (checksum: $checksum)"
}

# 读取安装清单
get_manifest() {
    [ -f "$MANIFEST_FILE" ] && cat "$MANIFEST_FILE"
}

# 验证安装完整性
verify_install() {
    local errors=0
    
    if [ ! -f "$MANIFEST_FILE" ]; then
        echo "No installation manifest found"
        return 1
    fi
    
    # 解析 manifest 并验证每个文件
    # 简化版本：检查文件是否存在
    while IFS= read -r line; do
        if echo "$line" | grep -q '"dest"'; then
            local file=$(echo "$line" | grep -o '"dest": "[^"]*"' | cut -d'"' -f4)
            if [ -f "$file" ]; then
                echo "[✓] $file"
            else
                echo "[✗] $file (MISSING)"
                ((errors++))
            fi
        fi
    done < "$MANIFEST_FILE"
    
    return $errors
}

# 显示安装详情
show_install_details() {
    echo ""
    echo "  Installation Details"
    echo "  ────────────────────────────────────"
    echo ""
    
    if [ ! -f "$MANIFEST_FILE" ]; then
        echo "  No installation manifest found"
        return
    fi
    
    echo "  Manifest: $MANIFEST_FILE"
    echo "  Log: $LOG_FILE"
    echo ""
    
    # 显示安装时间
    local install_time=$(grep '"installed_at"' "$MANIFEST_FILE" | cut -d'"' -f4)
    if [ -n "$install_time" ]; then
        echo "  Installed at: $install_time"
        echo ""
    fi
    
    # 显示文件列表
    echo "  Installed files:"
    while IFS= read -r line; do
        if echo "$line" | grep -q '"dest"'; then
            local dest=$(echo "$line" | grep -o '"dest": "[^"]*"' | cut -d'"' -f4)
            local checksum=$(echo "$line" | grep -o '"checksum": "[^"]*"' | cut -d'"' -f4)
            local status="[✓]"
            [ ! -f "$dest" ] && status="[✗]"
            printf "    %s %-50s %s\n" "$status" "$dest" "${checksum:0:8}..."
        fi
    done < "$MANIFEST_FILE"
    
    echo ""
}

# 记录卸载操作
record_uninstall() {
    local mode="$1"  # keep or full
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    log_info "Uninstall started (mode: $mode)"
    
    # 创建卸载记录文件
    local uninstall_record="${LOG_DIR}/uninstall.record"
    echo "{\"uninstalled_at\": \"$timestamp\", \"mode\": \"$mode\", \"manifest\": \"$MANIFEST_FILE\"}" > "$uninstall_record"
    
    # 备份当前清单用于对比
    cp "$MANIFEST_FILE" "${LOG_DIR}/manifest.pre-uninstall.json"
}

# 对比卸载清单
compare_uninstall() {
    local removed=0
    local remaining=0
    
    echo ""
    echo "  Uninstall Verification"
    echo "  ────────────────────────────────────"
    echo ""
    
    while IFS= read -r line; do
        if echo "$line" | grep -q '"dest"'; then
            local dest=$(echo "$line" | grep -o '"dest": "[^"]*"' | cut -d'"' -f4)
            if [ -f "$dest" ] || [ -d "$dest" ]; then
                echo "    [✗] $dest (still exists)"
                ((remaining++))
            else
                echo "    [✓] $dest (removed)"
                ((removed++))
            fi
        fi
    done < "$MANIFEST_FILE"
    
    echo ""
    echo "  Summary: $removed removed, $remaining remaining"
    echo ""
    
    return $remaining
}

# 导出函数
export -f log log_info log_warn log_error
export -f record_install get_manifest verify_install show_install_details compare_uninstall record_uninstall
export LOG_DIR LOG_FILE MANIFEST_FILE
