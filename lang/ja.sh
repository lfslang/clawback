#!/bin/bash
# 日本語言語パック for Clawback
# Japanese Language Pack for Clawback

LANG_CODE="ja"
LANG_NAME="日本語"

# 翻訳関数 / Translation Function
t() {
    local key="$1"
    case "$key" in
        # タイトル / Titles
        "title") echo "Clawback - OpenClaw 設定ロールバック" ;;
        "subtitle") echo "設定バックアップとワンクリックロールバック" ;;
        
        # メインメニュー / Main Menu
        "menu_navigate") echo "↑↓ で選択、Enter で決定：" ;;
        "menu_create") echo "スナップショット作成[manual]" ;;
        "menu_list") echo "スナップショット管理とロールバック" ;;
        "menu_rollback") echo "以前のスナップショットにロールバック" ;;
        "menu_delete") echo "スナップショットを削除" ;;
        "menu_restart") echo "バックアップして OpenClaw を再起動" ;;
        "menu_language") echo "言語を変更[language]" ;;
        "menu_uninstall") echo "clawback をアンインストール" ;;
        "menu_exit") echo "終了 [ESC]" ;;
        
        # 情報表示 / Info Display
        "config_path") echo "設定パス" ;;
        "snapshots_count") echo "保存されたスナップショット" ;;
        
        # スナップショット作成 / Create Snapshot
        "create_title") echo "手動スナップショット作成" ;;
        "create_label_prompt") echo "ラベルを入力（例：feishu-config-ok）：" ;;
        "create_success") echo "[✓] スナップショット作成完了" ;;
        "create_failed") echo "[✗] 作成に失敗しました" ;;
        "create_too_frequent") echo "[i] 頻繁すぎます、5分後に再試行してください" ;;
        
        # リスト / List
        "list_title") echo "スナップショット一覧" ;;
        "list_empty") echo "スナップショットが見つかりません" ;;
        "list_navigate") echo " [V]表示モード ([Q]表示モードを終了)" ;;
        "detail_navigate") echo " [R]ロールバック [D]削除 [C]比較 [ESC]戻る" ;;
        
        # 詳細 / Details
        "detail_title") echo "スナップショット詳細" ;;
        "detail_file") echo "ファイル" ;;
        "detail_size") echo "サイズ" ;;
        "detail_modified") echo "更新日時" ;;
        "detail_primary") echo "プライマリモデル" ;;
        "detail_fallback") echo "フォールバック" ;;
        "detail_feishu") echo "Feishu" ;;
        "detail_summary") echo "設定概要" ;;
        
        # アクション / Actions
        "actions") echo "アクション" ;;
        "actions_rollback") echo "[R] ロールバック" ;;
        "actions_delete") echo "[D] 削除" ;;
        "actions_back") echo "[Q] 戻る" ;;
        "action_rollback") echo "ロールバック" ;;
        "action_delete") echo "削除" ;;
        "action_compare") echo "比較" ;;
        "view_full") echo "完全な設定を表示" ;;
        "any_key") echo "任意のキー" ;;
        "back") echo "戻る" ;;
        
        # ロールバック / Rollback
        "rollback_title") echo "ロールバック確認" ;;
        "rollback_target") echo "ロールバック対象" ;;
        "rollback_confirm") echo "このバージョンにロールバックしますか？" ;;
        "rollback_backup") echo "現在の設定は自動的にバックアップされます" ;;
        "rollback_warning") echo "現在の openclaw.json が上書きされます" ;;
        "rollback_success") echo "[✓] ロールバック成功" ;;
        "rollback_backup_saved") echo "現在の設定は保存されました" ;;
        "rollback_restart_hint") echo "'openclaw gateway restart' を実行して変更を適用" ;;
        "rollback_empty") echo "ロールバック可能なスナップショットがありません" ;;
        "rollback_select") echo "ロールバックするスナップショットを選択" ;;
        "rollback_navigate") echo "（Enter で確認、Q でキャンセル）" ;;
        "rollback_restart") echo "'openclaw gateway restart' を実行して変更を適用" ;;
        
        # 削除 / Delete
        "delete_title") echo "削除確認" ;;
        "delete_target") echo "削除対象" ;;
        "delete_confirm") echo "このスナップショットを削除しますか？" ;;
        "delete_success") echo "[✓] 削除しました" ;;
        "delete_select") echo "削除するスナップショットを選択" ;;
        "delete_hint") echo "（Enter で削除、Q でキャンセル）" ;;
        
        # 再起動 / Restart
        "restart_title") echo "バックアップと再起動" ;;
        "restart_backup") echo "[✓] スナップショット作成完了" ;;
        "restart_backup_created") echo "スナップショットが作成されました" ;;
        "restart_skip") echo "[i] 変更が検出されませんでした、バックアップをスキップ" ;;
        "restart_no_changes") echo "変更が検出されませんでした、バックアップをスキップ" ;;
        "restart_not_found") echo "[✗] OpenClaw コマンドが見つかりません" ;;
        "restart_starting") echo "OpenClaw を再起動中" ;;
        "restart_manual") echo "手動で再起動してください：openclaw gateway restart" ;;
        
        # アンインストール / Uninstall
        "uninstall_title") echo "Clawback アンインストール" ;;
        "uninstall_desc") echo "システムから clawback を削除" ;;
        "uninstall_option1") echo "[1] プログラムのみ削除（スナップショット保持）" ;;
        "uninstall_option2") echo "[2] 完全削除（スナップショット含む）" ;;
        "uninstall_option3") echo "[3] キャンセル" ;;
        "uninstall_keep") echo "[✓] プログラム削除完了、スナップショット保持" ;;
        "uninstall_full") echo "[✓] 完全削除完了" ;;
        "uninstall_location") echo "スナップショット場所" ;;
        
        # 比較機能 / Compare Feature
        "compare_title") echo "ロールバックプレビュー" ;;
        "compare_desc") echo "このバージョンにロールバック後の変更を表示" ;;
        "compare_not_found") echo "比較ツールが見つかりません" ;;
        "compare_preview_title") echo "比較プレビュー" ;;
        "compare_no_change") echo "変更なし" ;;
        "compare_legend") echo "凡例: [+]追加 [-]削除 [~]変更" ;;
        "compare_module_no_change") echo "このモジュールに変更はありません" ;;
        "compare_usage") echo "使い方: スナップショット詳細で C キーを押す" ;;
        
        # ESCとナビゲーション / ESC and Navigation
        "esc_cancel") echo "[ESC] キャンセルして戻る" ;;
        "press_q_back") echo "Q を押して戻る" ;;
        
        # インストール検出 / Installation Detection
        "install_detect_title") echo "OpenClaw 検出" ;;
        "install_detect_found") echo "OpenClaw が見つかりました" ;;
        "install_detect_not_found") echo "OpenClaw が見つかりません" ;;
        "install_detect_path") echo "場所" ;;
        "install_detect_version") echo "バージョン" ;;
        "install_detect_config") echo "設定" ;;
        "install_detect_reason") echo "考えられる原因" ;;
        "install_detect_suggest") echo "推奨アクション" ;;
        "install_detect_continue") echo "インストールを続行しますか？" ;;
        
        # 共通 / General
        "cancelled") echo "キャンセルしました" ;;
        "continue") echo "Enter キーを押して続行..." ;;
        "exit_goodbye") echo "さようなら！" ;;
        "label") echo "ラベル" ;;
        "select") echo "選択" ;;
        "confirm") echo "確認" ;;
        "config_not_found") echo "OpenClaw 設定が見つかりません" ;;
        
        # デフォルト：キー名を返す / Default: return key name
        *) echo "$key" ;;
    esac
}

# 関数と変数をエクスポート / Export function and variables
export -f t
export LANG_CODE LANG_NAME
