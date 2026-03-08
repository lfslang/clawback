# 包管理器安装

## Homebrew (macOS/Linux)

```bash
# 添加 tap
brew tap lfslang/clawback

# 安装
brew install clawback

# 使用
clawback
```

## APT (Debian/Ubuntu)

```bash
# 添加仓库
curl -fsSL https://lfslang.github.io/clawback/apt/gpg.key | sudo apt-key add -
echo "deb https://lfslang.github.io/clawback/apt stable main" | sudo tee /etc/apt/sources.list.d/clawback.list

# 更新并安装
sudo apt update
sudo apt install clawback

# 使用
clawback
```

## YUM/DNF (CentOS/RHEL/Fedora)

```bash
# 添加仓库
sudo tee /etc/yum.repos.d/clawback.repo <> EOF
[clawback]
name=Clawback Repository
baseurl=https://lfslang.github.io/clawback/rpm/\$releasever/\$basearch/
enabled=1
gpgcheck=1
gpgkey=https://lfslang.github.io/clawback/rpm/gpg.key
EOF

# 安装
sudo yum install clawback
# 或
sudo dnf install clawback

# 使用
clawback
```

## AUR (Arch Linux)

```bash
# 使用 yay
yay -S clawback

# 或从 AUR 构建
git clone https://aur.archlinux.org/clawback.git
cd clawback
makepkg -si
```

## Snap

```bash
# 安装
sudo snap install clawback

# 使用
clawback
```

## 注意

以上包管理器安装方式需要先在对应的包管理平台发布软件包。目前推荐使用一键安装脚本或手动下载安装。
