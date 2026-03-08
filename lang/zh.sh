#!/bin/bash
# 简体中文语言包 for Clawback

LANG_CODE="zh"
LANG_NAME="简体中文"

# 翻译函数
t() {
    local key="$1"
    case "$key" in
        # 标题
        "title") echo "Clawback - OpenClaw 配置回滚" ;;
        "subtitle") echo "配置备份与一键回滚工具" ;;
        
        # 主菜单
        "menu_navigate") echo "使用 ↑↓ 选择，回车确认：" ;;
        "menu_create") echo "创建快照（带标签的手动备份）" ;;
        "menu_list") echo "快照管理与回滚" ;;
        "menu_rollback") echo "回滚到之前的快照" ;;
        "menu_delete") echo "删除快照" ;;
        "menu_restart") echo "备份并重启 OpenClaw" ;;
        "menu_language") echo "切换语言 [language]" ;;
        "menu_uninstall") echo "卸载 clawback" ;;
        "menu_exit") echo "退出 [ESC]" ;;
        
        # 信息展示
        "config_path") echo "配置路径" ;;
        "snapshots_count") echo "快照数量" ;;
        
        # 创建快照
        "create_title") echo "创建手动快照" ;;
        "create_label_prompt") echo "输入标签（例如：feishu-config-ok）：" ;;
        "create_success") echo "[✓] 快照已创建" ;;
        "create_failed") echo "[✗] 创建失败" ;;
        "create_too_frequent") echo "[i] 备份太频繁，请等待 5 分钟后再试" ;;
        
        # 列表
        "list_title") echo "快照列表" ;;
        "list_empty") echo "没有找到快照" ;;
        "list_navigate") echo "[V]查看 [ESC]返回 | [R]回滚 [D]删除 [C]对比" ;;
        
        # 详情
        "detail_title") echo "快照详情" ;;
        "detail_file") echo "文件" ;;
        "detail_size") echo "大小" ;;
        "detail_modified") echo "修改时间" ;;
        "detail_primary") echo "主模型" ;;
        "detail_fallback") echo "备用模型" ;;
        "detail_feishu") echo "飞书" ;;
        "detail_summary") echo "配置摘要" ;;
        
        # 操作
        "actions") echo "操作" ;;
        "actions_rollback") echo "[R] 回滚" ;;
        "actions_delete") echo "[D] 删除" ;;
        "actions_back") echo "[Q] 返回" ;;
        "action_rollback") echo "回滚" ;;
        "action_delete") echo "删除" ;;
        "action_compare") echo "对比" ;;
        "view_full") echo "查看完整配置" ;;
        "any_key") echo "任意键" ;;
        "back") echo "返回" ;;
        
        # 回滚
        "rollback_title") echo "确认回滚" ;;
        "rollback_target") echo "回滚目标" ;;
        "rollback_confirm") echo "确认回滚到此版本？" ;;
        "rollback_backup") echo "当前配置将自动备份" ;;
        "rollback_warning") echo "这将覆盖您当前的 openclaw.json" ;;
        "rollback_success") echo "[✓] 回滚成功" ;;
        "rollback_backup_saved") echo "当前配置已保存为" ;;
        "rollback_restart_hint") echo "运行 'openclaw gateway restart' 应用更改" ;;
        "rollback_empty") echo "没有可用的回滚快照" ;;
        "rollback_select") echo "选择要回滚的快照" ;;
        "rollback_navigate") echo "（Enter 确认，Q 取消）" ;;
        "rollback_restart") echo "运行 'openclaw gateway restart' 应用更改" ;;
        
        # 删除
        "delete_title") echo "确认删除" ;;
        "delete_target") echo "删除目标" ;;
        "delete_confirm") echo "确认删除此快照？" ;;
        "delete_success") echo "[✓] 已删除" ;;
        "delete_select") echo "选择要删除的快照" ;;
        "delete_hint") echo "（Enter 确认删除，Q 返回）" ;;
        
        # 重启
        "restart_title") echo "备份并重启" ;;
        "restart_backup") echo "[✓] 快照已创建" ;;
        "restart_backup_created") echo "快照已创建" ;;
        "restart_skip") echo "[i] 未检测到更改，跳过备份" ;;
        "restart_no_changes") echo "未检测到更改，跳过备份" ;;
        "restart_not_found") echo "[✗] 未找到 OpenClaw 命令" ;;
        "restart_starting") echo "正在重启 OpenClaw" ;;
        "restart_manual") echo "请手动重启：openclaw gateway restart" ;;
        
        # 卸载
        "uninstall_title") echo "卸载 Clawback" ;;
        "uninstall_desc") echo "从系统中移除 clawback" ;;
        "uninstall_option1") echo "[1] 仅删除程序（保留快照）" ;;
        "uninstall_option2") echo "[2] 完全删除（包括快照）" ;;
        "uninstall_option3") echo "[3] 取消" ;;
        "uninstall_keep") echo "[✓] 程序已删除，快照已保留" ;;
        "uninstall_full") echo "[✓] 完全删除" ;;
        "uninstall_location") echo "快照位置" ;;
        
        # 对比功能
        "compare_title") echo "回滚预览" ;;
        "compare_desc") echo "显示回滚到该备份版本后，配置将发生的变化" ;;
        "compare_not_found") echo "对比工具未找到" ;;
        "compare_preview_title") echo "对比预览" ;;
        "compare_no_change") echo "无差异" ;;
        "compare_legend") echo "图例: [+]新增 [-]删除 [~]变更" ;;
        "compare_module_no_change") echo "该模块无变化" ;;
        "compare_usage") echo "用法: 在快照详情页按 C 键查看对比" ;;
        
        # ESC 和导航
        "esc_cancel") echo "[ESC] 取消并返回" ;;
        "press_q_back") echo "按 Q 返回" ;;
        
        # 安装检测
        "install_detect_title") echo "OpenClaw 检测" ;;
        "install_detect_found") echo "已找到 OpenClaw" ;;
        "install_detect_not_found") echo "未找到 OpenClaw" ;;
        "install_detect_path") echo "位置" ;;
        "install_detect_version") echo "版本" ;;
        "install_detect_config") echo "配置" ;;
        "install_detect_reason") echo "可能原因" ;;
        "install_detect_suggest") echo "建议操作" ;;
        "install_detect_continue") echo "是否继续安装？" ;;
        
        # 通用
        "cancelled") echo "已取消" ;;
        "continue") echo "按回车键继续..." ;;
        "exit_goodbye") echo "再见！" ;;
        "label") echo "标签" ;;
        "select") echo "选择" ;;
        "confirm") echo "确认" ;;
        "config_not_found") echo "未找到 OpenClaw 配置" ;;
        
        # 默认：返回键名
        *) echo "$key" ;;
    esac
}

# 导出函数和变量
export -f t
export LANG_CODE LANG_NAME
