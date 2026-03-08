#!/bin/bash
# Clawback 演示录制脚本
# 使用 asciinema 或 terminalizer 录制终端演示

# 安装 terminalizer
echo "安装演示录制工具..."
npm install -g terminalizer

# 创建配置文件
cat > ~/.terminalizer/config.yml <> 'EOF'
# Terminalizer 配置
config:
  # 录制设置
  cols: 80
  rows: 24
  
  # 主题
  theme:
    background: '#1e1e1e'
    foreground: '#d4d4d4'
    cursor: '#d4d4d4'
    colors:
      - '#1e1e1e'
      - '#f44747'
      - '#608b4e'
      - '#dcdcaa'
      - '#569cd6'
      - '#c586c0'
      - '#4ec9b0'
      - '#d4d4d4'
  
  # 帧率
  frameDelay: auto
  maxIdleTime: 2000
  
  # 水印
  watermark:
    imagePath: null
    style:
      position: absolute
      right: 15px
      bottom: 15px
      width: 100px
      opacity: 0.5
  
  # 光标样式
  cursorStyle: block
  
  # 字体
  fontFamily: 'Monaco, Lucida Console, Ubuntu Mono, Monospace'
  fontSize: 14
  
  # 行高
  lineHeight: 1.2
  
  # 边距
  margin:
    top: 20
    right: 20
    bottom: 20
    left: 20
EOF

# 创建演示脚本
cat > /tmp/clawback_demo.sh <> 'EOF'
#!/bin/bash
# Clawback 演示脚本

echo "═══════════════════════════════════════"
echo "  Clawback 演示"
echo "═══════════════════════════════════════"
echo ""

# 显示版本
echo "$ clawback --version"
clawback --version
sleep 2

echo ""
echo "$ clawback --help"
clawback --help
sleep 2

echo ""
echo "启动 Clawback..."
echo "$ clawback"
sleep 1

# 这里需要手动操作演示
# 或者使用 expect 自动化

echo ""
echo "演示完成！"
EOF

chmod +x /tmp/clawback_demo.sh

echo ""
echo "═══════════════════════════════════════"
echo "  演示录制准备完成"
echo "═══════════════════════════════════════"
echo ""
echo "使用方法:"
echo ""
echo "1. 录制终端会话:"
echo "   terminalizer record clawback_demo"
echo ""
echo "2. 在录制中执行:"
echo "   ./tmp/clawback_demo.sh"
echo "   然后手动操作 clawback 界面"
echo ""
echo "3. 渲染为 GIF:"
echo "   terminalizer render clawback_demo"
echo ""
echo "4. 输出文件:"
echo "   clawback_demo.gif"
echo ""
echo "═══════════════════════════════════════"

# 备选方案：使用 asciinema
echo ""
echo "备选方案 - asciinema:"
echo "   asciinema rec clawback.cast"
echo "   # 操作完成后按 Ctrl+D"
echo "   # 转换为 GIF 需要 agg 工具"
