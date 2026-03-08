# Clawback

[![Version](https://img.shields.io/badge/version-0.9.176-blue.svg)](https://github.com/yourusername/clawback)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
[![Bash](https://img.shields.io/badge/bash-4.0%2B-orange.svg)](https://www.gnu.org/software/bash/)

**OpenClaw è¨­å®šãƒ­ãƒ¼ãƒ«ãƒãƒƒã‚¯ãƒ„ãƒ¼ãƒ«** - å¤šè¨€èªžTUIï¼ˆã‚¿ãƒ¼ãƒŸãƒŠãƒ«ãƒ¦ãƒ¼ã‚¶ãƒ¼ã‚¤ãƒ³ã‚¿ãƒ¼ãƒ•ã‚§ãƒ¼ã‚¹ï¼‰

[English](README.md) | [ç®€ä½“ä¸­æ–‡](README.zh.md)

---

## ðŸ“– ç°¡ä»‹

Clawbackã¯ã€OpenClawè¨­å®šç®¡ç†ç”¨ã®ãƒãƒƒã‚¯ã‚¢ãƒƒãƒ—ãŠã‚ˆã³ãƒ­ãƒ¼ãƒ«ãƒãƒƒã‚¯ãƒ„ãƒ¼ãƒ«ã§ã™ã€‚äº¤äº’å¼ã®ã‚¿ãƒ¼ãƒŸãƒŠãƒ«ã‚¤ãƒ³ã‚¿ãƒ¼ãƒ•ã‚§ãƒ¼ã‚¹ã‚’æä¾›ã—ã€ä»¥ä¸‹ã®æ“ä½œãŒå¯èƒ½ã§ã™ï¼š

- ðŸ“ ãƒ©ãƒ™ãƒ«ä»˜ãã®æ‰‹å‹•ãƒãƒƒã‚¯ã‚¢ãƒƒãƒ—ã®ä½œæˆ
- ðŸ“‹ ã™ã¹ã¦ã®ã‚¹ãƒŠãƒƒãƒ—ã‚·ãƒ§ãƒƒãƒˆã®è¡¨ç¤ºã¨ç®¡ç†
- ðŸ”„ ä»¥å‰ã®è¨­å®šã¸ã®ãƒ¯ãƒ³ã‚¯ãƒªãƒƒã‚¯ãƒ­ãƒ¼ãƒ«ãƒãƒƒã‚¯
- ðŸ—‘ï¸ ä¸è¦ãªã‚¹ãƒŠãƒƒãƒ—ã‚·ãƒ§ãƒƒãƒˆã®å‰Šé™¤
- ðŸŒ 7è¨€èªžã®ã‚µãƒãƒ¼ãƒˆ

## âœ¨ æ©Ÿèƒ½

- **å¤šè¨€èªžã‚µãƒãƒ¼ãƒˆ** - ç®€ä½“ä¸­æ–‡ã€Englishã€æ—¥æœ¬èªžã€Deutschã€EspaÃ±olã€FranÃ§aisã€í•œêµ­ì–´
- **ã‚¹ãƒžãƒ¼ãƒˆãƒãƒƒã‚¯ã‚¢ãƒƒãƒ—** - è¨­å®šå¤‰æ›´ã®è‡ªå‹•æ¤œå‡ºã€é‡è¤‡ãƒãƒƒã‚¯ã‚¢ãƒƒãƒ—ã®é˜²æ­¢
- **ãƒ­ãƒ¼ãƒ«ãƒãƒƒã‚¯ãƒ—ãƒ¬ãƒ“ãƒ¥ãƒ¼** - ãƒ­ãƒ¼ãƒ«ãƒãƒƒã‚¯å‰å¾Œã®è¨­å®šå·®ç•°ã‚’è¡¨ç¤º�
diff --git a/README.ja.md b/README.ja.md
new file mode 100644
index 0000000..e69de17
--- /dev/null
+++ b/README.ja.md
@@ -0,0 +1,100 @@
+# Clawback
+
+[![Version](https://img.shields.io/badge/version-0.9.176-blue.svg)](https://github.com/yourusername/clawback)
+[![License](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)
+[![Bash](https://img.shields.io/badge/bash-4.0%2B-orange.svg)](https://www.gnu.org/software/bash/)
+
+**OpenClaw 設定ロールバックツール** - 多言語TUI（ターミナルユーザーインターフェース）
+
+[English](README.md) | [简体中文](README.zh.md)
+
+---
+
+## 📖 簡介
+
+Clawbackは、OpenClaw設定管理用のバックアップおよびロールバックツールです。インタラクティブなターミナルインターフェースを提供し、以下の操作が可能です：
+
+- 📝 ラベル付きの手動バックアップの作成
+- 📋 すべてのスナップショットの表示と管理
+- 🔄 以前の設定へのワンクリックロールバック
+- 🗑️ 不要なスナップショットの削除
+- 🌐 7言語のサポート
+
+## ✨ 機能
+
+- **多言語サポート** - 简体中文、English、日本語、Deutsch、Español、Français、한국어
+- **スマートバックアップ** - 設定変更の自動検出、重複バックアップの防止
+- **ロールバックプレビュー** - ロールバック前後の設定差異を表示
+- **ラベル管理** - 重要なバックアップに説明的なラベルを追加
+- **セキュリティ** - 機密情報（APIキーなど）の自動マスキング
+
+## 🚀 クイックスタート
+
+### インストール
+
+```bash
+# ダウンロードして解凍
+tar -xzf clawback-0.9.176.tar.gz
+cd clawback-0.9.176
+
+# インストールスクリプトを実行
+./install.sh
+```
+
+### 使用方法
+
+```bash
+# インタラクティブUIを起動
+clawback
+
+# ヘルプを表示
+clawback --help
+
+# インストール詳細を表示
+clawback --details
+```
+
+## 📸 スクリーンショット
+
+```
+═══════════════════════════════════════
+  Clawback - OpenClaw 設定ロールバック
+═══════════════════════════════════════
+
+  ↑↓で選択、Enterで確認：
+
+    [● ] 手動スナップショット作成
+    [  ] スナップショット管理とロールバック
+    [  ] 言語を変更[language]
+    [  ] clawbackをアンインストール
+    [  ] 終了 [ESC]
+
+  ────────────────────────────────────
+  設定パス: ~/.openclaw/config.json
+  スナップショット数: 17
+```
+
+## 🌍 言語切り替え
+
+プログラム内のメニューで言語を切り替えるか、環境変数を設定：
+
+```bash
+export CLAWBACK_LANG=en  # English
+export CLAWBACK_LANG=zh  # 简体中文
+export CLAWBACK_LANG=ja  # 日本語
+export CLAWBACK_LANG=de  # Deutsch
+export CLAWBACK_LANG=es  # Español
+export CLAWBACK_LANG=fr  # Français
+export CLAWBACK_LANG=ko  # 한국어
+```
+
+## 🛠️ システム要件
+
+- Bash 4.0+
+- jq（オプション、JSON処理用）
+- OpenClaw（バックアップする設定ソース）
+
+## 📁 ディレクトリ構造
+
+```
+~/.local/share/clawback/    # プログラムディレクトリ
+~/.openclaw/.snapshots/     # スナップショットディレクトリ
+~/.local/bin/clawback       # コマンドシンボリックリンク
+```
+
+## 🗑️ アンインストール
+
+```bash
+~/.local/share/clawback/uninstall.sh
+```
+
+## 📄 ライセンス
+
+このプロジェクトは MIT ライセンスの下でライセンスされています - 詳細は [LICENSE](LICENSE) ファイルを参照してください。
+
+## 🤝 貢献
+
+貢献を歓迎します！ガイドラインについては [CONTRIBUTING.md](CONTRIBUTING.md) を参照してください。
+
+## 📝 変更履歴
+
+バージョン履歴については [CHANGELOG.md](CHANGELOG.md) を参照してください。
+
+## 👨‍💻 作者
+
+OpenClaw コミュニティのために ❤️ を込めて作成
+
+---
+
+**注意**: これは OpenClaw 設定管理の個人ツールです。自己責任で使用してください。
