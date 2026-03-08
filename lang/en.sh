#!/bin/bash
# English Language Pack for Clawback
# 英文语言包 - 可作为其他语言的翻译模板

LANG_CODE="en"
LANG_NAME="English"

# 翻译函数
t() {
    local key="$1"
    case "$key" in
        # 标题
        "title") echo "Clawback - OpenClaw Config Rollback" ;;
        "subtitle") echo "Configuration backup and one-click rollback" ;;
        
        # 主菜单
        "menu_navigate") echo "Use ↑↓ to navigate, Enter to select:" ;;
        "menu_create") echo "Manual create snapshot" ;;
        "menu_list") echo "Snapshot Management and Rollback" ;;
        "menu_rollback") echo "Rollback to previous snapshot" ;;
        "menu_delete") echo "Delete snapshot" ;;
        "menu_restart") echo "Backup and restart OpenClaw" ;;
        "menu_language") echo "Change Language[language]" ;;
        "menu_uninstall") echo "Uninstall clawback" ;;
        "menu_exit") echo "Exit [ESC]" ;;
        
        # 信息展示
        "config_path") echo "Config path" ;;
        "snapshots_count") echo "Snapshots stored" ;;
        
        # 创建快照
        "create_title") echo "Create Manual Snapshot" ;;
        "create_label_prompt") echo "Enter a label (e.g., feishu-config-ok):" ;;
        "create_success") echo "[✓] Snapshot created" ;;
        "create_failed") echo "[✗] Failed to create" ;;
        "create_too_frequent") echo "[i] Too frequent, please wait 5 minutes" ;;
        
        # 列表
        "list_title") echo "Snapshot List" ;;
        "list_empty") echo "No snapshots found" ;;
        "list_navigate") echo " [V]View mode ([Q]Exit view mode)" ;;
        "detail_navigate") echo " [R]Rollback [D]Delete [C]Compare [ESC]Back" ;;
        
        # 详情
        "detail_title") echo "Snapshot Details" ;;
        "detail_file") echo "File" ;;
        "detail_size") echo "Size" ;;
        "detail_modified") echo "Modified" ;;
        "detail_primary") echo "Primary Model" ;;
        "detail_fallback") echo "Fallback" ;;
        "detail_feishu") echo "Feishu" ;;
        "detail_summary") echo "Configuration Summary" ;;
        
        # 操作
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
        
        # 回滚
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
        
        # 删除
        "delete_title") echo "Confirm Delete" ;;
        "delete_target") echo "Delete target" ;;
        "delete_confirm") echo "Confirm deletion of this snapshot?" ;;
        "delete_success") echo "[✓] Deleted" ;;
        "delete_select") echo "Select snapshot to delete" ;;
        "delete_hint") echo "(Enter to confirm, Q to cancel)" ;;
        
        # 重启
        "restart_title") echo "Backup and Restart" ;;
        "restart_backup") echo "[✓] Snapshot created" ;;
        "restart_backup_created") echo "Snapshot created" ;;
        "restart_skip") echo "[i] No changes detected, backup skipped" ;;
        "restart_no_changes") echo "No changes detected, backup skipped" ;;
        "restart_not_found") echo "[✗] OpenClaw command not found" ;;
        "restart_starting") echo "Restarting OpenClaw" ;;
        "restart_manual") echo "Please restart manually: openclaw gateway restart" ;;
        
        # 卸载
        "uninstall_title") echo "Uninstall Clawback" ;;
        "uninstall_desc") echo "Remove clawback from system" ;;
        "uninstall_option1") echo "[1] Remove program only (keep snapshots)" ;;
        "uninstall_option2") echo "[2] Remove everything including snapshots" ;;
        "uninstall_option3") echo "[3] Cancel" ;;
        "uninstall_keep") echo "[✓] Program removed, snapshots preserved" ;;
        "uninstall_full") echo "[✓] Completely removed" ;;
        "uninstall_location") echo "Snapshots location" ;;
        
        # Compare
        "compare_title") echo "Rollback Preview" ;;
        "compare_desc") echo "Shows changes after rollback to this version" ;;
        "compare_not_found") echo "Compare tool not found" ;;
        "compare_preview_title") echo "Compare Preview" ;;
        "compare_no_change") echo "No changes" ;;
        "compare_legend") echo "Legend: [+]Added [-]Removed [~]Changed" ;;
        "compare_module_no_change") echo "No changes in this module" ;;
        "compare_usage") echo "Usage: Press C in snapshot details to compare" ;;
        
        # ESC and Navigation
        "esc_cancel") echo "[ESC] Cancel and return" ;;
        "press_q_back") echo "Press Q to go back" ;;
        
        # Install Detection
        "install_detect_title") echo "OpenClaw Detection" ;;
        "install_detect_found") echo "OpenClaw found" ;;
        "install_detect_not_found") echo "OpenClaw not found" ;;
        "install_detect_path") echo "Location" ;;
        "install_detect_version") echo "Version" ;;
        "install_detect_config") echo "Config" ;;
        "install_detect_reason") echo "Possible reasons" ;;
        "install_detect_suggest") echo "Suggestions" ;;
        "install_detect_continue") echo "Continue installation?" ;;
        
        # General
        "cancelled") echo "Cancelled" ;;
        "continue") echo "Press Enter to continue..." ;;
        "exit_goodbye") echo "Goodbye!" ;;
        "label") echo "Label" ;;
        "select") echo "Select" ;;
        "confirm") echo "Confirm" ;;
        "config_not_found") echo "OpenClaw config not found" ;;
        "copyright") echo "© 2026 Liufs <1936638@qq.com>" ;;
        "license") echo "MIT License" ;;
        
        # 默认：返回键名
        *) echo "$key" ;;
    esac
}

# 导出函数和变量
export -f t
export LANG_CODE LANG_NAME
