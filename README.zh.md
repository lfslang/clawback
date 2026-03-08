# Clawback

[![版本](https://img.shields.io/badge/version-0.9.176-blue.svg)](https://github.com/yourusername/clawback)
[![许可证](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Bash](https://img.shields.io/badge/bash-4.0%2B-orange.svg)](https://www.gnu.org/software/bash/)

**OpenClaw 配置回滚工具** - 多语言 TUI（终端用户界面）

**语言:** [English](README.md) | [简体中文](README.zh.md) | [日本語](README.ja.md) | [Deutsch](README.de.md) | [Español](README.es.md) | [Français](README.fr.md) | [한국어](README.ko.md) 

---

## 📖 简介

Clawback 是一个用于 OpenClaw 配置管理的备份与回滚工具。它提供了一个交互式的终端界面，让你可以：

- 📝 创建带标签的手动备份
- 📋 查看和管理所有快照
- 🔄 一键回滚到之前的配置
- 🗑️ 删除不需要的快照
- 🌐 支持 7 种语言

## ✨ 功能特性

- **多语言支持** - 简体中文、English、日本語、Deutsch、Español、Français、한국어
- **智能备份** - 自动检测配置变化，避免重复备份
- **回滚预览** - 对比功能显示回滚前后的配置差异
- **标签管理** - 为重要备份添加描述性标签
- **安全保护** - 敏感信息（API Key 等）自动打码

## 🚀 快速开始

### 安装

```bash
# 下载并解压
tar -xzf clawback-0.9.176.tar.gz
cd clawback-0.9.176

# 运行安装脚本
./install.sh
```

### 使用

```bash
# 启动交互式界面
clawback

# 显示帮助
clawback --help

# 显示安装详情
clawback --details
```

## 📸 界面预览

```
═══════════════════════════════════════
  Clawback - OpenClaw 配置回滚
═══════════════════════════════════════

  使用 ↑↓ 选择，回车确认：

    [● ] 手动创建快照
    [  ] 快照管理与回滚
    [  ] 切换语言[language]
    [  ] 卸载 clawback
    [  ] 退出 [ESC]

  ────────────────────────────────────
  配置路径: ~/.openclaw/config.json
  快照数量: 17
```

## 🌍 语言切换

在程序内通过菜单切换语言，或设置环境变量：

```bash
export CLAWBACK_LANG=en  # English
export CLAWBACK_LANG=zh  # 简体中文
export CLAWBACK_LANG=ja  # 日本語
export CLAWBACK_LANG=de  # Deutsch
export CLAWBACK_LANG=es  # Español
export CLAWBACK_LANG=fr  # Français
export CLAWBACK_LANG=ko  # 한국어
```

## 🛠️ 系统要求

- Bash 4.0+
- jq（可选，用于 JSON 处理）
- OpenClaw（需要备份的配置来源）

## 📁 目录结构

```
~/.local/share/clawback/    # 程序安装目录
~/.openclaw/.snapshots/     # 快照存储目录
~/.local/bin/clawback       # 命令符号链接
```

## 🗑️ 卸载

```bash
~/.local/share/clawback/uninstall.sh
```

## 📄 许可证

本项目采用 MIT 许可证 - 详见 [LICENSE](LICENSE) 文件。

## 🤝 贡献

欢迎贡献！请查看 [CONTRIBUTING.md](CONTRIBUTING.md) 了解指南。

## 📝 更新日志

查看 [CHANGELOG.md](CHANGELOG.md) 了解版本历史。

## 👨‍💻 作者

为 OpenClaw 社区创建 ❤️

---

**注意**: 这是 OpenClaw 配置管理的个人工具。使用风险自负。
