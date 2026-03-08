# Clawback

[![Version](https://img.shields.io/badge/version-0.9.176-blue.svg)](https://github.com/yourusername/clawback)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Bash](https://img.shields.io/badge/bash-4.0%2B-orange.svg)](https://www.gnu.org/software/bash/)

**OpenClaw Configuration Rollback Tool** - Multi-language TUI (Terminal User Interface)

**Languages:** [English](README.md) | [简体中文](README.zh.md) | [日本語](README.ja.md) | [Deutsch](README.de.md) | [Español](README.es.md) | [Français](README.fr.md) | [한국어](README.ko.md) 

---

## 📖 Introduction

Clawback is a backup and rollback tool for OpenClaw configuration management. It provides an interactive terminal interface that allows you to:

- 📝 Create manual backups with labels
- 📋 View and manage all snapshots
- 🔄 One-click rollback to previous configurations
- 🗑️ Delete unwanted snapshots
- 🌐 Support for 7 languages

## ✨ Features

- **Multi-language Support** - English, 简体中文, 日本語, Deutsch, Español, Français, 한국어
- **Smart Backup** - Auto-detect configuration changes, avoid duplicate backups
- **Rollback Preview** - Compare feature shows differences before rollback
- **Label Management** - Add descriptive labels to important backups
- **Security** - Sensitive info (API keys, etc.) automatically masked

## 🚀 Quick Start

### One-line Installer (Recommended)

```bash
curl -fsSL https://raw.githubusercontent.com/lfslang/clawback/main/install-remote.sh | bash
```

Or with wget:

```bash
wget -qO- https://raw.githubusercontent.com/lfslang/clawback/main/install-remote.sh | bash
```

### Download Release

```bash
# Download latest release
wget https://github.com/lfslang/clawback/releases/latest/download/clawback-0.9.181.tar.gz

# Extract and install
tar -xzf clawback-0.9.181.tar.gz
cd clawback-0.9.181
./install.sh
```

### Clone from Source

```bash
# Clone repository
git clone https://github.com/lfslang/clawback.git
cd clawback

# Install
./install.sh
```

### Docker

```bash
# Run with Docker
docker run -it --rm \
  -v ~/.openclaw:/root/.openclaw \
  -v ~/.local/share/clawback:/root/.local/share/clawback \
  lfslang/clawback:latest
```

See [docs/DOCKER.md](docs/DOCKER.md) for more Docker options.

### Package Managers

See [docs/PACKAGE_MANAGER.md](docs/PACKAGE_MANAGER.md) for package manager installation options (Homebrew, APT, YUM, etc.)

### Usage

```bash
# Start interactive UI
clawback

# Show help
clawback --help

# Show installation details
clawback --details
```

## 📸 Screenshot

```
═══════════════════════════════════════
  Clawback - OpenClaw Config Rollback
═══════════════════════════════════════

  Use ↑↓ to navigate, Enter to select:

    [● ] Manual create snapshot
    [  ] Snapshot Management
    [  ] Change Language[language]
    [  ] Uninstall clawback
    [  ] Exit [ESC]

  ────────────────────────────────────
  Config: ~/.openclaw/config.json
  Snapshots: 17
```

## 🌍 Language Switching

Switch languages via the menu in the program, or set environment variable:

```bash
export CLAWBACK_LANG=en  # English
export CLAWBACK_LANG=zh  # 简体中文
export CLAWBACK_LANG=ja  # 日本語
export CLAWBACK_LANG=de  # Deutsch
export CLAWBACK_LANG=es  # Español
export CLAWBACK_LANG=fr  # Français
export CLAWBACK_LANG=ko  # 한국어
```

## 🛠️ Requirements

- Bash 4.0+
- jq (optional, for JSON processing)
- OpenClaw (the configuration source to backup)

## 📁 Directory Structure

```
~/.local/share/clawback/    # Program directory
~/.openclaw/.snapshots/     # Snapshots directory
~/.local/bin/clawback       # Command symlink
```

## 🗑️ Uninstall

```bash
~/.local/share/clawback/uninstall.sh
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## 📝 Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

## 👨‍💻 Author

Created with ❤️ for the OpenClaw community.

---

**Note**: This is a personal tool for OpenClaw configuration management. Use at your own risk.
