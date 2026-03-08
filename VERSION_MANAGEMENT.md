# Clawback 开发版本管理规范

**版本**: 1.0  
**日期**: 2026-03-08  
**适用**: clawback 及所有 TUI 工具开发

---

## 核心原则

### 1. 频繁提交原则
- **每次功能完成就提交**，不要等到最后
- **版本号每次修改都递增**，即使只改了一行
- **提交信息要具体**，说明做了什么

### 2. 自动保护原则
- 开发工具自动检查未提交修改
- 退出前强制确认是否提交
- 自动备份未提交的修改

### 3. 多通道同步原则
- 飞书/TUI/Web 所有通道共享代码
- 通过 git 作为唯一真相源
- 避免在单一通道长时间开发

---

## 开发工作流

### 标准开发流程

```bash
# 1. 开始开发前 - 检查状态
cd ~/.openclaw/workspace/clawback
git status
git log --oneline -3

# 2. 创建功能分支（可选，重大修改时）
git checkout -b feature/xxx

# 3. 修改代码...
# - 每次修改后测试
# - 版本号立即递增

# 4. 提交（频繁！）
git add -A
git commit -m "v0.9.xxx: 具体描述"

# 5. 推送到远程（如果有）
git push origin main

# 6. 合并分支（如果创建了）
git checkout main
git merge feature/xxx
git branch -d feature/xxx
```

### 版本号规则

```
格式: 0.9.xxx
- 主版本.次版本.修订号
- 每次提交 xxx + 1
- 不要跳跃（不要从 0.9.100 直接到 0.9.150）
```

---

## 防丢失机制

### 1. 自动提交脚本

创建 `~/.openclaw/bin/dev-commit.sh`:

```bash
#!/bin/bash
# 开发自动提交脚本

PROJECT_DIR="${1:-~/.openclaw/workspace/clawback}"
cd "$PROJECT_DIR" || exit 1

# 检查是否有未提交修改
if [ -n "$(git status --porcelain)" ]; then
    echo "检测到未提交修改:"
    git status --short
    echo ""
    read -p "是否提交? (y/n): " confirm
    if [ "$confirm" = "y" ]; then
        git add -A
        read -p "输入提交信息: " msg
        git commit -m "$(grep 'VERSION=' clawback | head -1 | cut -d'"' -f2): ${msg}"
        echo "✓ 已提交"
    fi
else
    echo "没有未提交修改"
fi
```

### 2. 退出检查钩子

创建 `~/.openclaw/bin/tui-exit-check.sh`:

```bash
#!/bin/bash
# TUI 退出时检查未提交修改

check_uncommitted() {
    local dirs=(
        "~/.openclaw/workspace/clawback"
        "~/.openclaw/workspace/skills/config-rollback"
    )
    
    for dir in "${dirs[@]}"; do
        eval dir="$dir"
        if [ -d "$dir/.git" ]; then
            cd "$dir" || continue
            if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
                echo "⚠️  $dir 有未提交修改!"
                git status --short
                return 1
            fi
        fi
    done
    return 0
}

# 在 TUI 退出前调用
if ! check_uncommitted; then
    echo ""
    echo "建议先提交修改再退出"
    read -p "是否继续退出? (y/n): " confirm
    [ "$confirm" != "y" ] && return 1
fi
```

### 3. 定时自动备份

创建 `~/.openclaw/cron/auto-backup.sh`:

```bash
#!/bin/bash
# 每30分钟自动备份未提交修改

BACKUP_DIR="${HOME}/.openclaw/.auto-backups/$(date +%Y%m%d)"
mkdir -p "$BACKUP_DIR"

# 备份 clawback
cd ~/.openclaw/workspace/clawback || exit 1
if [ -n "$(git status --porcelain 2>/dev/null)" ]; then
    backup_name="clawback-$(date +%H%M%S).tar.gz"
    tar -czf "${BACKUP_DIR}/${backup_name}" \
        --exclude='.git' \
        --exclude='node_modules' \
        .
    echo "$(date): 自动备份 ${backup_name}" >> "${BACKUP_DIR}/backup.log"i

# 清理旧备份（保留最近7天）
find ~/.openclaw/.auto-backups -name "*.tar.gz" -mtime +7 -delete 2>/dev/null
```

添加到 crontab:
```bash
*/30 * * * * ~/.openclaw/cron/auto-backup.sh
```

---

## 提交规范

### 提交信息格式

```
v0.9.xxx: 简短描述

- 详细变更1
- 详细变更2
- 详细变更3
```

### 示例

```bash
git commit -m "v0.9.171: 移除手动创建快照的5分钟限制

- 手动创建快照不再受 MIN_MANUAL_INTERVAL 限制
- 5分钟限制仅用于自动备份
- 用户手动创建快照应该有完全的控制权"
```

### 提交前检查清单

- [ ] 版本号已递增
- [ ] 代码可以正常运行
- [ ] 语言包已同步（如修改了界面文字）
- [ ] 提交信息具体明确

---

## 灾难恢复

### 如果代码再次丢失

```bash
# 1. 检查 git 历史
git log --all --oneline --graph

# 2. 检查自动备份
ls -lt ~/.openclaw/.auto-backups/*/clawback-*.tar.gz | head -5

# 3. 从备份恢复
tar -xzf ~/.openclaw/.auto-backups/20260308/clawback-101500.tar.gz -C ~/workspace/clawback-recovered

# 4. 或者从 git reflog 恢复
git reflog
git reset --hard HEAD@{n}
```

### 紧急备份位置

- **自动备份**: `~/.openclaw/.auto-backups/`
- **手动备份**: `~/.local/share/clawback.bak*/`
- **Git 本地**: `.git/` 目录

---

## 最佳实践总结

### ✅ 应该做的

1. **每次修改后立即提交**，不要等到功能全部完成
2. **使用有意义的提交信息**，说明做了什么
3. **频繁推送到远程**（如果有远程仓库）
4. **定期运行 `git status`** 检查状态
5. **重大修改前创建分支**，避免影响主分支
6. **使用版本标签**标记重要里程碑

### ❌ 不应该做的

1. 长时间不提交（超过1小时）
2. 一次性提交大量修改
3. 使用模糊的提交信息如 "update"、"fix"
4. 在多个地方同时修改不提交
5. 忽略未提交警告

---

## 工具配置

### Git 配置

```bash
# 设置用户信息
git config --global user.name "liufs"
git config --global user.email "liufs@local"

# 设置默认分支
git config --global init.defaultBranch main

# 设置别名
git config --global alias.st status
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.lg "log --oneline --graph --all"
```

### 快捷命令

添加到 `~/.bashrc`:

```bash
# 开发快捷命令
alias cdcl='cd ~/.openclaw/workspace/clawback'
alias cdcb='cd ~/.openclaw/workspace/skills/config-rollback'
alias gst='git status'
alias gci='git commit -a -m'
alias gpl='git pull'
alias gps='git push'
alias glg='git log --oneline --graph -10'
```

---

## 总结

**核心口诀**:
> 小步快跑，频繁提交，自动备份，多通道同步。

**关键检查点**:
1. 每次启动开发 → `git status`
2. 每次功能完成 → `git commit`
3. 每次退出 TUI → 检查未提交
4. 每天晚上 → `git push`（如果有远程）

**记住**: Git 是你的时间机器，但只有提交了的代码才能被恢复！
