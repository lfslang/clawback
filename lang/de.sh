#!/bin/bash
# Deutsche Sprachpaket für Clawback
# German Language Pack for Clawback

LANG_CODE="de"
LANG_NAME="Deutsch"

# Übersetzungsfunktion / Translation Function
t() {
    local key="$1"
    case "$key" in
        # Titel / Titles
        "title") echo "Clawback - OpenClaw Konfiguration Rollback" ;;
        "subtitle") echo "Konfigurations-Backup und Rollback mit einem Klick" ;;
        
        # Hauptmenü / Main Menu
        "menu_navigate") echo "Mit ↑↓ navigieren, Enter zum Auswählen:" ;;
        "menu_create") echo "Snapshot erstellen (manuelles Backup mit Label)" ;;
        "menu_list") echo "Snapshot-Verwaltung und Rollback" ;;
        "menu_rollback") echo "Zu vorherigem Snapshot zurücksetzen" ;;
        "menu_delete") echo "Snapshot löschen" ;;
        "menu_restart") echo "Backup und OpenClaw neu starten" ;;
        "menu_language") echo "Sprache ändern" ;;
        "menu_uninstall") echo "clawback deinstallieren" ;;
        "menu_exit") echo "Beenden [ESC]" ;;
        
        # Info-Anzeige / Info Display
        "config_path") echo "Konfigurationspfad" ;;
        "snapshots_count") echo "Gespeicherte Snapshots" ;;
        
        # Snapshot erstellen / Create Snapshot
        "create_title") echo "Manuellen Snapshot erstellen" ;;
        "create_label_prompt") echo "Label eingeben (z.B. feishu-config-ok):" ;;
        "create_success") echo "[✓] Snapshot erstellt" ;;
        "create_failed") echo "[✗] Erstellung fehlgeschlagen" ;;
        
        # Liste / List
        "list_title") echo "Snapshot-Liste" ;;
        "list_empty") echo "Keine Snapshots gefunden" ;;
        "list_navigate") echo "Aktionen: [R]Rollback [D]Löschen [V]Anzeigen [C]Vergleichen [ESC]Zurück" ;;
        
        # Details / Details
        "detail_title") echo "Snapshot-Details" ;;
        "detail_file") echo "Datei" ;;
        "detail_size") echo "Größe" ;;
        "detail_modified") echo "Geändert am" ;;
        "detail_primary") echo "Primäres Modell" ;;
        "detail_fallback") echo "Fallback" ;;
        "detail_feishu") echo "Feishu" ;;
        "detail_summary") echo "Konfigurationsübersicht" ;;
        
        # Aktionen / Actions
        "actions") echo "Aktionen" ;;
        "actions_rollback") echo "[R] Rollback" ;;
        "actions_delete") echo "[D] Löschen" ;;
        "actions_back") echo "[Q] Zurück" ;;
        "action_rollback") echo "Rollback" ;;
        "action_delete") echo "Löschen" ;;
        "action_compare") echo "Vergleichen" ;;
        "view_full") echo "Vollständige Konfiguration anzeigen" ;;
        "any_key") echo "Beliebige Taste" ;;
        "back") echo "Zurück" ;;
        
        # Rollback / Rollback
        "rollback_title") echo "Rollback bestätigen" ;;
        "rollback_target") echo "Rollback-Ziel" ;;
        "rollback_confirm") echo "Rollback auf diese Version bestätigen?" ;;
        "rollback_backup") echo "Aktuelle Konfiguration wird automatisch gesichert" ;;
        "rollback_warning") echo "Dies überschreibt Ihre aktuelle openclaw.json" ;;
        "rollback_success") echo "[✓] Rollback erfolgreich" ;;
        "rollback_backup_saved") echo "Aktuelle Konfiguration gespeichert als" ;;
        "rollback_restart_hint") echo "'openclaw gateway restart' ausführen zum Anwenden" ;;
        "rollback_empty") echo "Keine Snapshots für Rollback verfügbar" ;;
        "rollback_select") echo "Snapshot für Rollback auswählen" ;;
        "rollback_navigate") echo "(Enter zum Bestätigen, Q zum Abbrechen)" ;;
        "rollback_restart") echo "'openclaw gateway restart' ausführen zum Anwenden" ;;
        
        # Löschen / Delete
        "delete_title") echo "Löschen bestätigen" ;;
        "delete_target") echo "Löschziel" ;;
        "delete_confirm") echo "Löschen dieses Snapshots bestätigen?" ;;
        "delete_success") echo "[✓] Gelöscht" ;;
        
        # Neustart / Restart
        "restart_title") echo "Backup und Neustart" ;;
        "restart_backup") echo "[✓] Snapshot erstellt" ;;
        "restart_backup_created") echo "Snapshot erstellt" ;;
        "restart_skip") echo "[i] Keine Änderungen, Backup übersprungen" ;;
        "restart_no_changes") echo "Keine Änderungen erkannt, Backup übersprungen" ;;
        "restart_not_found") echo "[✗] OpenClaw-Befehl nicht gefunden" ;;
        "restart_starting") echo "OpenClaw wird neu gestartet" ;;
        "restart_manual") echo "Bitte manuell neu starten: openclaw gateway restart" ;;
        
        # Deinstallation / Uninstall
        "uninstall_title") echo "Clawback deinstallieren" ;;
        "uninstall_desc") echo "clawback vom System entfernen" ;;
        "uninstall_option1") echo "[1] Nur Programm löschen (Snapshots behalten)" ;;
        "uninstall_option2") echo "[2] Vollständige Deinstallation (inkl. Snapshots)" ;;
        "uninstall_option3") echo "[3] Abbrechen" ;;
        "uninstall_keep") echo "[✓] Programm gelöscht, Snapshots behalten" ;;
        "uninstall_full") echo "[✓] Vollständig entfernt" ;;
        "uninstall_location") echo "Snapshot-Speicherort" ;;
        
        # Vergleichsfunktion / Compare Feature
        "compare_title") echo "Rollback-Vorschau" ;;
        "compare_desc") echo "Zeigt Änderungen nach Rollback zu dieser Version" ;;
        "compare_not_found") echo "Vergleichstool nicht gefunden" ;;
        "compare_preview_title") echo "Vergleichsvorschau" ;;
        "compare_no_change") echo "Keine Änderungen" ;;
        "compare_legend") echo "Legende: [+]Hinzugefügt [-]Entfernt [~]Geändert" ;;
        "compare_module_no_change") echo "Keine Änderungen in diesem Modul" ;;
        "compare_usage") echo "Verwendung: Drücke C in den Snapshot-Details zum Vergleichen" ;;
        
        # ESC und Navigation / ESC and Navigation
        "esc_cancel") echo "[ESC] Abbrechen und zurück" ;;
        "press_q_back") echo "Drücke Q zum Zurückgehen" ;;
        
        # Installationserkennung / Installation Detection
        "install_detect_title") echo "OpenClaw-Erkennung" ;;
        "install_detect_found") echo "OpenClaw gefunden" ;;
        "install_detect_not_found") echo "OpenClaw nicht gefunden" ;;
        "install_detect_path") echo "Speicherort" ;;
        "install_detect_version") echo "Version" ;;
        "install_detect_config") echo "Konfiguration" ;;
        "install_detect_reason") echo "Mögliche Gründe" ;;
        "install_detect_suggest") echo "Empfohlene Maßnahmen" ;;
        "install_detect_continue") echo "Installation fortsetzen?" ;;
        
        # Allgemein / General
        "cancelled") echo "Abgebrochen" ;;
        "continue") echo "Enter drücken zum Fortfahren..." ;;
        "exit_goodbye") echo "Auf Wiedersehen!" ;;
        "label") echo "Label" ;;
        "select") echo "Auswählen" ;;
        "confirm") echo "Bestätigen" ;;
        "config_not_found") echo "OpenClaw-Konfiguration nicht gefunden" ;;
        
        # Standard: Schlüsselnamen zurückgeben / Default: return key name
        *) echo "$key" ;;
    esac
}

# Funktion und Variablen exportieren / Export function and variables
export -f t
export LANG_CODE LANG_NAME
