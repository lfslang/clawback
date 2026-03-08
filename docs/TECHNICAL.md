# Clawback 技术文档

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
- `smart_backup()` - 智能备份（自动检测变化）

### lib/log.sh

日志和审计功能：

- `init_logging()` - 初始化日志系统
- `log_info()` - 记录信息
- `log_error()` - 记录错误
- `record_uninstall()` - 记录卸载操作

### lib/compare.sh

配置对比功能：

- `compare_modules()` - 对比配置模块
- `mask_sensitive()` - 打码敏感信息
- 支持基于回滚视角的差异显示

## 语言包系统

### 翻译函数

每个语言包定义 `t()` 函数：

```bash
t() {
    local key="$1"
    case "$key" in
        "menu_create") echo "手动创建快照" ;;
        "menu_list") echo "快照管理与回滚" ;;
        # ...
        *) echo "$key" ;;
    esac
}
```

### 语言加载

1. 先加载默认语言 (en)
2. 再加载用户选择的语言覆盖
3. 缺失的键使用默认语言

### 添加新语言

1. 复制 `lang/template.sh` 为 `lang/xx.sh`
2. 翻译所有字段
3. 更新 `LANG_CODE` 和 `LANG_NAME`
4. 测试语言切换

## 数据存储

### 快照存储

```
~/.openclaw/.snapshots/
├── 20260308_100826_标签-clawback-test-001.json
├── 20260308_095848_daily-first.json
└── ...
```

命名格式: `YYYYMMDD_HHMMSS_标签-clawback-test-NNN.json`

### 状态文件

```
~/.openclaw/.clawback/
├── state.json           # 备份状态
├── install.log          # 安装日志
└── manifest.json        # 安装清单
```

### 语言配置

```
~/.openclaw/.clawback-lang
```

## 安装过程

1. 复制文件到 `~/.local/share/clawback/`
2. 创建符号链接 `~/.local/bin/clawback`
3. 创建必要的目录
4. 记录安装清单

## 卸载过程

1. 根据清单删除文件
2. 可选：保留或删除快照
3. 记录卸载操作

## 安全考虑

### 敏感信息处理

- API Key、Secret 等自动打码显示
- 对比功能中敏感字段显示为 `***`
- 快照文件权限设置为 600

### 备份验证

- 备份前验证配置 JSON 有效性
- 回滚前自动备份当前配置
- 防止意外覆盖

## 性能优化

### 智能备份

- 检测配置变化（MD5 哈希）
- 避免重复备份相同配置
- 自动清理旧快照（保留策略）

### 延迟加载

- 语言包按需加载
- 日志系统初始化延迟

## 扩展开发

### 添加新功能

1. 在 `lib/core.sh` 添加核心函数
2. 在 `clawback` 添加菜单项
3. 更新所有语言包
4. 更新版本号
5. 更新文档

### 修改菜单

1. 更新 `main_menu()` 函数
2. 添加/修改 `do_xxx()` 处理函数
3. 更新语言包中的菜单文本
4. 更新 `DESIGN_DECISIONS.md`

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

## 常见问题

### Q: 如何添加新的配置模块支持？

A: 修改 `lib/compare.sh` 中的 `modules` 变量。

### Q: 如何修改备份保留策略？

A: 修改 `lib/core.sh` 中的清理逻辑。

### Q: 如何添加新的快捷键？

A: 在相应的事件循环中添加 case 分支。

---

更多文档：
- [README.md](../README.md) - 项目介绍
- [CHANGELOG.md](../CHANGELOG.md) - 版本历史
- [CONTRIBUTING.md](../CONTRIBUTING.md) - 贡献指南
