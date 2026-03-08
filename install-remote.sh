#!/bin/bash
# Clawback 一键安装脚本
# Copyright (c) 2026 Liufs <1936638@qq.com>
# Licensed under the MIT License

set -e

REPO="lfslang/clawback"
INSTALL_DIR="${HOME}/.local/share/clawback"
BIN_DIR="${HOME}/.local/bin"

echo "═══════════════════════════════════════"
echo "  Clawback 一键安装脚本"
echo "  Copyright (c) 2026 Liufs"
echo "═══════════════════════════════════════"
echo ""

# 检测系统
 detect_os() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        echo "linux"
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo "macos"
    else
        echo "unknown"
    fi
}

OS=$(detect_os)
echo "检测到系统: $OS"

# 获取最新版本
echo ""
echo "获取最新版本..."
LATEST_VERSION=$(curl -s https://api.github.com/repos/${REPO}/releases/latest | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

if [ -z "$LATEST_VERSION" ]; then
    echo "✗ 无法获取最新版本，使用默认版本 v0.9.181"
    LATEST_VERSION="v0.9.181"
fi

echo "✓ 最新版本: $LATEST_VERSION"

# 下载
echo ""
echo "下载 $LATEST_VERSION..."
DOWNLOAD_URL="https://github.com/${REPO}/releases/download/${LATEST_VERSION}/clawback-${LATEST_VERSION#v}.tar.gz"

mkdir -p /tmp/clawback-install
cd /tmp/clawback-install

if command -v wget &> /dev/null; then
    wget -q "$DOWNLOAD_URL" -O clawback.tar.gz
elif command -v curl &> /dev/null; then
    curl -sL "$DOWNLOAD_URL" -o clawback.tar.gz
else
    echo "✗ 需要 wget 或 curl"
    exit 1
fi

if [ ! -f clawback.tar.gz ]; then
    echo "✗ 下载失败"
    exit 1
fi

echo "✓ 下载完成"

# 安装
echo ""
echo "安装到 $INSTALL_DIR..."
mkdir -p "$INSTALL_DIR" "$BIN_DIR"

tar -xzf clawback.tar.gz --strip-components=1 -C "$INSTALL_DIR"

# 创建符号链接
if [ -L "${BIN_DIR}/clawback" ]; then
    rm "${BIN_DIR}/clawback"
fi
ln -sf "${INSTALL_DIR}/clawback" "${BIN_DIR}/clawback"

# 清理
rm -rf /tmp/clawback-install

echo "✓ 安装完成"

# 检查 PATH
if [[ ":$PATH:" != *":${BIN_DIR}:"* ]]; then
    echo ""
    echo "⚠️  ${BIN_DIR} 不在 PATH 中"
    echo "请添加以下行到 ~/.bashrc 或 ~/.zshrc:"
    echo "  export PATH=\"\$HOME/.local/bin:\$PATH\""
    echo ""
fi

echo "═══════════════════════════════════════"
echo ""
echo "🎉 Clawback 安装成功！"
echo ""
echo "使用方法:"
echo "  clawback              启动交互式界面"
echo "  clawback --help       显示帮助"
echo "  clawback --version    显示版本"
echo ""
echo "卸载方法:"
echo "  ${INSTALL_DIR}/uninstall.sh"
echo ""
echo "═══════════════════════════════════════"
