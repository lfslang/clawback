#!/bin/bash
# Clawback 语言包模板
# Language Pack Template for Clawback
#
# 使用说明 / Usage:
# 1. 复制此文件为 <语言代码>.sh (例如: ja.sh, fr.sh)
# 2. 翻译所有 echo 后面的字符串
# 3. 修改 LANG_CODE 和 LANG_NAME
# 4. 重启 clawback 即可使用
#
# 语言代码参考 / Language Code Reference:
# ja: 日本語 (Japanese)
# ko: 한국어 (Korean)
# fr: Français (French)
# de: Deutsch (German)
# es: Español (Spanish)
# pt: Português (Portuguese)
# it: Italiano (Italian)
# ru: Русский (Russian)
# ... 其他语言

# ========== 修改这里 / Edit Here ==========
LANG_CODE="example"      # 语言代码 (2-3位小写字母)
LANG_NAME="Example"      # 语言名称 (显示在语言菜单中)
# ==========================================

# 翻译函数 / Translation Function
t() {
    local key="$1"
    case "$key" in
        # ========== 标题 / Titles ==========
        "title") echo "Clawback - OpenClaw Config Rollback" ;;
        "subtitle") echo "Configuration backup and one-click rollback" ;;
        
        # ========== 主菜单 / Main Menu ==========
        "menu_navigate") echo "Use ↑↓ to navigate, Enter to select:" ;;
        "menu_create") echo "Create snapshot (manual backup with label)" ;;
        "menu_list") echo "Snapshot Management and Rollback" ;;
        "menu_rollback") echo "Rollback to previous snapshot" ;;
        "menu_delete") echo "Delete snapshot" ;;
        "menu_restart") echo "Backup and restart OpenClaw" ;;
        "menu_language") echo "Change Language" ;;
        "menu_uninstall") echo "Uninstall clawback" ;;
        "menu_exit") echo "Exit [ESC]" ;;
        
        # ========== 信息展示 / Info Display ==========
        "config_path") echo "Config path" ;;
        "snapshots_count") echo "Snapshots stored" ;;
        
        # ========== 创建快照 / Create Snapshot ==========
        "create_title") echo "Create Manual Snapshot" ;;
        "create_label_prompt") echo "Enter a label (e.g., feishu-config-ok):" ;;
        "create_success") echo "[✓] Snapshot created" ;;
        "create_failed") echo "[✗] Failed to create" ;;
        
        # ========== 列表 / List ==========
        "list_title") echo "Snapshot List" ;;
        "list_empty") echo "No snapshots found" ;;
        "list_navigate") echo "Actions: [R]Rollback [D]Delete [V]View [C]Compare [ESC]Back" ;;
        
        # ========== 详情 / Details ==========
        "detail_title") echo "Snapshot Details" ;;
        "detail_file") echo "File" ;;
        "detail_size") echo "Size" ;;
        "detail_modified") echo "Modified" ;;
        "detail_primary") echo "Primary Model" ;;
        "detail_fallback") echo "Fallback" ;;
        "detail_feishu") echo "Feishu" ;;
        "detail_summary") echo "Configuration Summary" ;;
        
        # ========== 操作 / Actions ==========
        "actions") echo "Actions" ;;
        "actions_rollback") echo "[R] Rollback" ;;
        "actions_delete") echo "[D] Delete" ;;
        "actions_back") echo "[Q] Back" ;;
        "action_rollback") echo "Rollback" ;;
        "action_delete") echo "Delete" ;;
        "action_compare") echo "Compare" ;;
        "view_full") echo "View Full Config" ;;
        "any_key") echo "Any key" ;;
        "back") echo "Back" ;;
        
        # ========== 回滚 / Rollback ==========
        "rollback_title") echo "Confirm Rollback" ;;
        "rollback_target") echo "Rollback target" ;;
        "rollback_confirm") echo "Confirm rollback to this version?" ;;
        "rollback_backup") echo "Current config will be automatically backed up" ;;
        "rollback_warning") echo "This will overwrite your current openclaw.json" ;;
        "rollback_success") echo "[✓] Rollback successful" ;;
        "rollback_backup_saved") echo "Current config saved as" ;;
        "rollback_restart_hint") echo "Run 'openclaw gateway restart' to apply changes" ;;
        "rollback_empty") echo "No snapshots available for rollback" ;;
        "rollback_select") echo "Select snapshot to rollback" ;;
        "rollback_navigate") echo "(Enter to confirm, Q to cancel)" ;;
        "rollback_restart") echo "Run 'openclaw gateway restart' to apply changes" ;;
        
        # ========== 删除 / Delete ==========
        "delete_title") echo "Confirm Delete" ;;
        "delete_target") echo "Delete target" ;;
        "delete_confirm") echo "Confirm deletion of this snapshot?" ;;
        "delete_success") echo "[✓] Deleted" ;;
        
        # ========== 重启 / Restart ==========
        "restart_title") echo "Backup and Restart" ;;
        "restart_backup") echo "[✓] Snapshot created" ;;
        "restart_backup_created") echo "Snapshot created" ;;
        "restart_skip") echo "[i] No changes detected, backup skipped" ;;
        "restart_no_changes") echo "No changes detected, backup skipped" ;;
        "restart_not_found") echo "[✗] OpenClaw command not found" ;;
        "restart_starting") echo "Restarting OpenClaw" ;;
        "restart_manual") echo "Please restart manually: openclaw gateway restart" ;;
        
        # ========== 卸载 / Uninstall ==========
        "uninstall_title") echo "Uninstall Clawback" ;;
        "uninstall_desc") echo "Remove clawback from system" ;;
        "uninstall_option1") echo "[1] Remove program only (keep snapshots)" ;;
        "uninstall_option2") echo "[2] Remove everything including snapshots" ;;
        "uninstall_option3") echo "[3] Cancel" ;;
        "uninstall_keep") echo "[✓] Program removed, snapshots preserved" ;;
        "uninstall_full") echo "[✓] Completely removed" ;;
        "uninstall_location") echo "Snapshots location" ;;
        
        # ========== 对比功能 / Compare Feature ==========
        "compare_title") echo "Rollback Preview" ;;
        "compare_desc") echo "Shows changes after rollback to this version" ;;
        "compare_not_found") echo "Compare tool not found" ;;
        
        # ========== 安装检测 / Installation Detection ==========
        "install_detect_title") echo "OpenClaw Detection" ;;
        "install_detect_found") echo "OpenClaw found" ;;
        "install_detect_not_found") echo "OpenClaw not found" ;;
        "install_detect_path") echo "Location" ;;
        "install_detect_version") echo "Version" ;;
        "install_detect_config") echo "Config" ;;
        "install_detect_reason") echo "Possible reasons" ;;
        "install_detect_suggest") echo "Suggestions" ;;
        "install_detect_continue") echo "Continue installation?" ;;
        
        # ========== 通用 / General ==========
        "cancelled") echo "Cancelled" ;;
        "continue") echo "Press Enter to continue..." ;;
        "exit_goodbye") echo "Goodbye!" ;;
        "label") echo "Label" ;;
        "select") echo "Select" ;;
        "confirm") echo "Confirm" ;;
        "config_not_found") echo "OpenClaw config not found" ;;
        
        # 默认：返回键名 / Default: return key name
        *) echo "$key" ;;
    esac
}

# 导出函数和变量 / Export function and variables
export -f t
export LANG_CODE LANG_NAME
