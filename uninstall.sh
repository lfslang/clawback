#!/bin/bash
# Clawback - Uninstaller with verification and logging

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 加载日志库
if [ -f "${SCRIPT_DIR}/lib/log.sh" ]; then
    source "${SCRIPT_DIR}/lib/log.sh"
    init_logging
elif [ -f "${HOME}/.local/share/clawback/lib/log.sh" ]; then
    source "${HOME}/.local/share/clawback/lib/log.sh"
    init_logging
else
    # 简化版本（多重回退确定 HOME）
    if [ -z "$HOME" ]; then
        HOME=$(getent passwd "$(whoami)" | cut -d: -f6 2>/dev/null)
    fi
    if [ -z "$HOME" ]; then
        HOME="$(pwd)"
    fi
    CONFIG_DIR="${HOME}/.openclaw"
    LOG_DIR="${CONFIG_DIR}/.clawback"
    LOG_FILE="${LOG_DIR}/install.log"
    MANIFEST_FILE="${LOG_DIR}/manifest.json"
fi

INSTALL_DIR="${HOME}/.local/share/clawback"
BIN_DIR="${HOME}/.local/bin"
SNAPSHOT_DIR="${HOME}/.openclaw/.snapshots"

echo ""
echo "  Clawback - Uninstallation"
echo "  ────────────────────────────────────"
echo ""

# 检查是否安装
if [ ! -d "$INSTALL_DIR" ] && [ ! -f "${BIN_DIR}/clawback" ]; then
    echo "  [i] Clawback is not installed."
    exit 0
fi

# 显示安装详情（如果有）
if [ -f "$MANIFEST_FILE" ]; then
    echo "  Installation manifest found."
    echo ""
    echo "  Files to be removed:"
    
    while IFS= read -r line; do
        if echo "$line" | grep -q '"dest"'; then
            local dest=$(echo "$line" | grep -o '"dest": "[^"]*"' | cut -d'"' -f4)
            [ -e "$dest" ] && echo "    - $dest"
        fi
    done < "$MANIFEST_FILE"
    
    echo ""
fi

# 询问是否保留快照
echo "  Options:"
echo "    [1] Remove program only (keep snapshots)"
echo "    [2] Remove everything including snapshots"
echo "    [3] Show installation details"
echo "    [4] Verify current installation"
echo "    [5] Cancel"
echo ""
echo -n "  Select [1-5]: "
read choice

case "$choice" in
    1)
        echo ""
        echo "  Recording uninstall (keep mode)..."
        record_uninstall "keep" 2>/dev/null || true
        
        echo "  Removing program files..."
        
        # 根据清单删除
        if [ -f "$MANIFEST_FILE" ]; then
            while IFS= read -r line; do
                if echo "$line" | grep -q '"dest"'; then
                    local dest=$(echo "$line" | grep -o '"dest": "[^"]*"' | cut -d'"' -f4)
                    if [ -e "$dest" ]; then
                        rm -rf "$dest"
                        echo "    [✓] Removed: $dest"
                    fi
                fi
            done < "$MANIFEST_FILE"
        else
            # 回退到默认删除
            rm -f "${BIN_DIR}/clawback"
            rm -rf "$INSTALL_DIR"
        fi
        
        echo ""
        echo "  [✓] Program removed."
        echo ""
        
        # 对比验证
        if [ -f "$MANIFEST_FILE" ]; then
            echo "  Verification:"
            compare_uninstall
        fi
        
        echo "  Snapshots preserved at:"
        echo "      $SNAPSHOT_DIR"
        echo ""
        echo "  To remove snapshots manually:"
        echo "      rm -rf $SNAPSHOT_DIR"
        
        log_info "Uninstall completed (keep mode)"
        ;;
    2)
        echo ""
        echo -n "  Confirm complete removal? [y/N]: "
        read confirm
        
        if [[ "$confirm" =~ ^[Yy]$ ]]; then
            echo ""
            echo "  Recording uninstall (full mode)..."
            record_uninstall "full" 2>/dev/null || true
            
            echo "  Removing all files..."
            
            # 删除程序
            rm -f "${BIN_DIR}/clawback"
            rm -rf "$INSTALL_DIR"
            
            # 删除快照
            rm -rf "$SNAPSHOT_DIR"
            
            # 删除日志（可选，保留审计记录）
            # rm -rf "${HOME}/.openclaw/.clawback"
            
            echo ""
            echo "  [✓] Completely removed."
            echo ""
            echo "  Note: Install logs preserved at ${LOG_DIR}"
            
            log_info "Uninstall completed (full mode)"
        else
            echo ""
            echo "  Cancelled."
        fi
        ;;
    3)
        echo ""
        show_install_details
        exit 0
        ;;
    4)
        echo ""
        echo "  Installation Verification"
        echo "  ────────────────────────────────────"
        echo ""
        if [ -f "$MANIFEST_FILE" ]; then
            local errors=0
            while IFS= read -r line; do
                if echo "$line" | grep -q '"dest"'; then
                    local dest=$(echo "$line" | grep -o '"dest": "[^"]*"' | cut -d'"' -f4)
                    if [ -e "$dest" ]; then
                        echo "    [✓] $dest"
                    else
                        echo "    [✗] $dest (MISSING)"
                        ((errors++))
                    fi
                fi
            done < "$MANIFEST_FILE"
            echo ""
            if [ $errors -eq 0 ]; then
                echo "  [✓] All files present."
            else
                echo "  [⚠] $errors files missing."
            fi
        else
            echo "  No manifest found."
        fi
        echo ""
        ;;
    *)
        echo ""
        echo "  Cancelled."
        exit 0
        ;;
esac

echo ""
