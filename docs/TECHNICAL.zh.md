# 技术文档

## 架构概述

Clawback 是一个基于 Bash 的 TUI（终端用户界面）应用程序，采用模块化设计。

## 目录结构

```
clawback/
├── clawback              # 主程序入口
├── install.sh            # 安装脚本
├── uninstall.sh          # 卸载脚本
├── lib/                  # 功能库
│   ├── core.sh          # 核心功能
│   ├── log.sh           # 日志记录
│   └── compare.sh       # 配置对比
└── lang/                # 语言包
    ├── en.sh            # English
    ├── zh.sh            # 简体中文
    ├── ja.sh            # 日本語
    ├── de.sh            # Deutsch
    ├── es.sh            # Español
    ├── fr.sh            # Français
    ├── ko.sh            # 한국어
    └── template.sh      # 模板
```

## 核心模块

### 主程序 (clawback)

- **TUI 界面** - 使用 ANSI 转义序列实现交互式菜单
- **事件循环** - 处理键盘输入（方向键、ESC、回车等）
- **语言加载** - 动态加载语言包

### lib/core.sh

核心功能库：

- `create_snapshot()` - 创建配置快照
- `list_snapshots()` - 列出所有快照
- `rollback_to()` - 回滚到指定快照
- `delete_snapshot()` - 删除快照
- `smart_backup()` - 智能备份

### lib/log.sh

日志和审计功能。

### lib/compare.sh

配置对比功能。

## 语言包系统

### 翻译函数

每个语言包定义 `t()` 函数。

### 语言加载

1. 先加载默认语言 (en)
2. 再加载用户选择的语言覆盖
3. 缺失的键使用默认语言

## 数据存储

### 快照存储

`~/.openclaw/.snapshots/`

命名格式: `YYYYMMDD_HHMMSS_标签-clawback-test-NNN.json`

### 状态文件

`~/.openclaw/.clawback/`

### 语言配置

`~/.openclaw/.clawback-lang`

## 安全考虑

### 敏感信息处理

- API Key、Secret 等自动打码显示
- 对比功能中敏感字段显示为 `***`
- 快照文件权限设置为 600

## 扩展开发

### 添加新功能

1. 在 `lib/core.sh` 添加核心函数
2. 在 `clawback` 添加菜单项
3. 更新所有语言包
4. 更新版本号
5. 更新文档

## 调试技巧

### 启用调试

```bash
bash -x clawback
```

### 检查日志

```bash
tail -f ~/.openclaw/.clawback/install.log
```

### 测试语言包

```bash
CLAWBACK_LANG=zh bash -c 'source lang/zh.sh; echo $(t menu_create)'
```

---

更多文档：
- [README.md](../README.md) - 项目介绍
- [CHANGELOG.md](../CHANGELOG.md) - 版本历史
