#!/bin/bash
# OpenClaw Config Rollback Manager
# 智能备份 + TUI 交互

# 不在此设置 set -e，避免 TUI 错误导致退出
# set -e

CONFIG_DIR="${HOME}/.openclaw"
SNAPSHOT_DIR="${CONFIG_DIR}/.snapshots"
STATE_FILE="${SNAPSHOT_DIR}/.backup-state"
JSON_FILE="${CONFIG_DIR}/openclaw.json"
MAX_AUTO_SNAPSHOTS=20
MIN_MANUAL_INTERVAL=300  # 手动备份最小间隔（秒，5分钟）

# 检测 OpenClaw 安装路径
detect_openclaw() {
    if command -v openclaw &> /dev/null; then
        OPENCLAW_CMD="openclaw"
    elif [ -f "${HOME}/.local/bin/openclaw" ]; then
        OPENCLAW_CMD="${HOME}/.local/bin/openclaw"
    elif [ -f "/usr/local/bin/openclaw" ]; then
        OPENCLAW_CMD="/usr/local/bin/openclaw"
    else
        OPENCLAW_CMD=""
    fi
}

# 获取当前 hash
get_current_hash() {
    md5sum "$JSON_FILE" 2>/dev/null | awk '{print $1}'
}

# 获取上次备份的 hash
get_last_hash() {
    [ -f "$STATE_FILE" ] && tail -1 "$STATE_FILE" | tr -d '\n'
}

# 获取上次备份日期
get_last_date() {
    [ -f "$STATE_FILE" ] && head -1 "$STATE_FILE" | awk '{print $1}'
}

# 获取上次手动备份时间戳
get_last_manual_backup_time() {
    [ -f "$STATE_FILE" ] && sed -n '3p' "$STATE_FILE" 2>/dev/null | tr -d '\n'
}

# 检查是否允许创建手动备份（防止短时间内重复创建）
can_create_manual_backup() {
    local last_manual=$(get_last_manual_backup_time)
    if [ -z "$last_manual" ]; then
        return 0  # 允许
    fi
    local current_time=$(date +%s)
    local time_diff=$((current_time - last_manual))
    if [ "$time_diff" -lt "$MIN_MANUAL_INTERVAL" ]; then
        return 1  # 不允许，间隔太短
    fi
    return 0  # 允许
}

# 智能备份
smart_backup() {
    local trigger="$1"  # daily-first, pre-restart, manual
    local label="${2:-}"
    
    [ ! -f "$JSON_FILE" ] && return 1
    
    mkdir -p "$SNAPSHOT_DIR"
    
    local today=$(date +%Y%m%d)
    local current_hash=$(get_current_hash)
    local last_date=$(get_last_date)
    local last_hash=$(get_last_hash)
    
    # 检查是否需要备份
    local need_backup=false
    
    if [ "$trigger" = "manual" ]; then
        # 手动备份：总是执行
        need_backup=true
    elif [ "$trigger" = "daily-first" ]; then
        # 每天首次：检查日期
        if [ "$today" != "$last_date" ]; then
            need_backup=true
        fi
    elif [ "$trigger" = "pre-restart" ]; then
        # restart 前：检查 hash
        if [ "$current_hash" != "$last_hash" ]; then
            need_backup=true
        fi
    fi
    
    if [ "$need_backup" = true ]; then
        local timestamp=$(date +"%Y%m%d_%H%M%S")
        local filename
        
        if [ -n "$label" ]; then
            filename="${timestamp}_${label}.json"
        else
            filename="${timestamp}_${trigger}.json"
        fi
        
        cp "$JSON_FILE" "${SNAPSHOT_DIR}/${filename}"
        
        # 更新状态
        echo "$today" > "$STATE_FILE"
        echo "$current_hash" >> "$STATE_FILE"
        
        # 如果是手动备份，记录备份时间戳（用于防重复）
        if [ "$trigger" = "manual" ]; then
            echo "$(date +%s)" >> "$STATE_FILE"
        fi
        
        # 清理旧快照
        cleanup_old_snapshots
        
        echo "${filename}"
        return 0
    fi
    
    return 1
}

# 清理旧快照
cleanup_old_snapshots() {
    # 保留所有手动快照，只清理自动快照
    local auto_count=$(ls -1t "${SNAPSHOT_DIR}"/*.{daily-first,pre-restart}.json 2>/dev/null | wc -l)
    if [ "$auto_count" -gt "$MAX_AUTO_SNAPSHOTS" ]; then
        ls -1t "${SNAPSHOT_DIR}"/*.{daily-first,pre-restart}.json | tail -n +$((MAX_AUTO_SNAPSHOTS + 1)) | xargs rm -f 2>/dev/null || true
    fi
}

# 列出快照
list_snapshots() {
    ls -1t "${SNAPSHOT_DIR}"/*.json 2>/dev/null
}

# 获取快照数量
get_snapshot_count() {
    list_snapshots | wc -l
}

# 回滚
rollback_to() {
    local target="$1"
    
    # 备份当前状态
    local pre_rollback="pre-rollback-$(date +%Y%m%d_%H%M%S).json"
    cp "$JSON_FILE" "${SNAPSHOT_DIR}/${pre_rollback}"
    
    # 执行回滚
    cp "${SNAPSHOT_DIR}/${target}" "$JSON_FILE"
    
    # 更新状态
    local new_hash=$(get_current_hash)
    echo "$(date +%Y%m%d)" > "$STATE_FILE"
    echo "$new_hash" >> "$STATE_FILE"
    
    echo "${pre_rollback}"
}

# 删除快照
delete_snapshot() {
    local target="$1"
    rm -f "${SNAPSHOT_DIR}/${target}"
}

# 初始化
detect_openclaw

# 导出函数供 TUI 使用
export -f smart_backup list_snapshots get_snapshot_count rollback_to delete_snapshot can_create_manual_backup get_last_manual_backup_time
export CONFIG_DIR SNAPSHOT_DIR STATE_FILE JSON_FILE OPENCLAW_CMD MIN_MANUAL_INTERVAL
