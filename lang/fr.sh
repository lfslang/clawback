#!/bin/bash
# Pack de langue Français pour Clawback
# French Language Pack for Clawback

LANG_CODE="fr"
LANG_NAME="Français"

# Fonction de traduction / Translation Function
t() {
    local key="$1"
    case "$key" in
        # Titres / Titles
        "title") echo "Clawback - Rollback de configuration OpenClaw" ;;
        "subtitle") echo "Sauvegarde et rollback de configuration en un clic" ;;
        
        # Menu principal / Main Menu
        "menu_navigate") echo "Utilisez ↑↓ pour naviguer, Entrée pour sélectionner:" ;;
        "menu_create") echo "Créer un snapshot[manual]" ;;
        "menu_list") echo "Gestion des Snapshots et Rollback" ;;
        "menu_rollback") echo "Rollback vers un snapshot précédent" ;;
        "menu_delete") echo "Supprimer le snapshot" ;;
        "menu_restart") echo "Sauvegarder et redémarrer OpenClaw" ;;
        "menu_language") echo "Changer de langue[language]" ;;
        "menu_uninstall") echo "Désinstaller clawback" ;;
        "menu_exit") echo "Quitter [ESC]" ;;
        
        # Affichage des informations / Info Display
        "config_path") echo "Chemin de configuration" ;;
        "snapshots_count") echo "Snapshots stockés" ;;
        
        # Création de snapshot / Create Snapshot
        "create_title") echo "Créer un snapshot manuel" ;;
        "create_label_prompt") echo "Entrez une étiquette (ex: feishu-config-ok):" ;;
        "create_success") echo "[✓] Snapshot créé" ;;
        "create_failed") echo "[✗] Échec de la création" ;;
        "create_too_frequent") echo "[i] Trop fréquent, attendez 5 minutes" ;;
        
        # Liste / List
        "list_title") echo "Liste des snapshots" ;;
        "list_empty") echo "Aucun snapshot trouvé" ;;
        "list_navigate") echo " [V]Mode vue ([Q]Quitter mode vue)" ;;
        "detail_navigate") echo " [R]Rollback [D]Supprimer [C]Comparer [ESC]Retour" ;;
        
        # Détails / Details
        "detail_title") echo "Détails du snapshot" ;;
        "detail_file") echo "Fichier" ;;
        "detail_size") echo "Taille" ;;
        "detail_modified") echo "Modifié le" ;;
        "detail_primary") echo "Modèle principal" ;;
        "detail_fallback") echo "Fallback" ;;
        "detail_feishu") echo "Feishu" ;;
        "detail_summary") echo "Résumé de la configuration" ;;
        
        # Actions / Actions
        "actions") echo "Actions" ;;
        "actions_rollback") echo "[R] Rollback" ;;
        "actions_delete") echo "[D] Supprimer" ;;
        "actions_back") echo "[Q] Retour" ;;
        "action_rollback") echo "Rollback" ;;
        "action_delete") echo "Supprimer" ;;
        "action_compare") echo "Comparer" ;;
        "view_full") echo "Voir la config complète" ;;
        "any_key") echo "Touche" ;;
        "back") echo "Retour" ;;
        
        # Rollback / Rollback
        "rollback_title") echo "Confirmer le rollback" ;;
        "rollback_target") echo "Cible du rollback" ;;
        "rollback_confirm") echo "Confirmer le rollback vers cette version?" ;;
        "rollback_backup") echo "La configuration actuelle sera sauvegardée" ;;
        "rollback_warning") echo "Cela écrasera votre openclaw.json actuel" ;;
        "rollback_success") echo "[✓] Rollback réussi" ;;
        "rollback_backup_saved") echo "Config actuelle sauvegardée sous" ;;
        "rollback_restart_hint") echo "Exécutez 'openclaw gateway restart' pour appliquer" ;;
        "rollback_empty") echo "Aucun snapshot disponible pour rollback" ;;
        "rollback_select") echo "Sélectionner le snapshot pour rollback" ;;
        "rollback_navigate") echo "(Entrée pour confirmer, Q pour annuler)" ;;
        "rollback_restart") echo "Exécutez 'openclaw gateway restart' pour appliquer" ;;
        
        # Suppression / Delete
        "delete_title") echo "Confirmer la suppression" ;;
        "delete_target") echo "Cible de suppression" ;;
        "delete_confirm") echo "Confirmer la suppression de ce snapshot?" ;;
        "delete_success") echo "[✓] Supprimé" ;;
        "delete_select") echo "Sélectionner le snapshot à supprimer" ;;
        "delete_hint") echo "(Entrée pour confirmer, Q pour annuler)" ;;
        
        # Redémarrage / Restart
        "restart_title") echo "Sauvegarde et redémarrage" ;;
        "restart_backup") echo "[✓] Snapshot créé" ;;
        "restart_backup_created") echo "Snapshot créé" ;;
        "restart_skip") echo "[i] Pas de changement, sauvegarde ignorée" ;;
        "restart_no_changes") echo "Pas de changement, sauvegarde ignorée" ;;
        "restart_not_found") echo "[✗] Commande OpenClaw introuvable" ;;
        "restart_starting") echo "Redémarrage d'OpenClaw" ;;
        "restart_manual") echo "Veuillez redémarrer manuellement: openclaw gateway restart" ;;
        
        # Désinstallation / Uninstall
        "uninstall_title") echo "Désinstaller Clawback" ;;
        "uninstall_desc") echo "Retirer clawback du système" ;;
        "uninstall_option1") echo "[1] Supprimer uniquement le programme (garder les snapshots)" ;;
        "uninstall_option2") echo "[2] Suppression complète (snapshots inclus)" ;;
        "uninstall_option3") echo "[3] Annuler" ;;
        "uninstall_keep") echo "[✓] Programme supprimé, snapshots conservés" ;;
        "uninstall_full") echo "[✓] Suppression complète" ;;
        "uninstall_location") echo "Emplacement des snapshots" ;;
        
        # Fonction de comparaison / Compare Feature
        "compare_title") echo "Aperçu du rollback" ;;
        "compare_desc") echo "Affiche les changements après rollback vers cette version" ;;
        "compare_not_found") echo "Outil de comparaison introuvable" ;;
        "compare_preview_title") echo "Aperçu de comparaison" ;;
        "compare_no_change") echo "Aucun changement" ;;
        "compare_legend") echo "Légende: [+]Ajouté [-]Supprimé [~]Modifié" ;;
        "compare_module_no_change") echo "Aucun changement dans ce module" ;;
        "compare_usage") echo "Utilisation: Appuyez sur C dans les détails du snapshot pour comparer" ;;
        
        # ESC et Navigation / ESC and Navigation
        "esc_cancel") echo "[ESC] Annuler et retourner" ;;
        "press_q_back") echo "Appuyez sur Q pour retourner" ;;
        
        # Détection d'installation / Installation Detection
        "install_detect_title") echo "Détection OpenClaw" ;;
        "install_detect_found") echo "OpenClaw trouvé" ;;
        "install_detect_not_found") echo "OpenClaw introuvable" ;;
        "install_detect_path") echo "Emplacement" ;;
        "install_detect_version") echo "Version" ;;
        "install_detect_config") echo "Config" ;;
        "install_detect_reason") echo "Raisons possibles" ;;
        "install_detect_suggest") echo "Suggestions" ;;
        "install_detect_continue") echo "Continuer l'installation?" ;;
        
        # Général / General
        "cancelled") echo "Annulé" ;;
        "continue") echo "Appuyez sur Entrée pour continuer..." ;;
        "exit_goodbye") echo "Au revoir!" ;;
        "label") echo "Étiquette" ;;
        "select") echo "Sélectionner" ;;
        "confirm") echo "Confirmer" ;;
        "config_not_found") echo "Config OpenClaw introuvable" ;;
        
        # Par défaut: retourner le nom de la clé / Default: return key name
        *) echo "$key" ;;
    esac
}

# Exporter la fonction et les variables / Export function and variables
export -f t
export LANG_CODE LANG_NAME
