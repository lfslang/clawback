#!/bin/bash
# Paquete de idioma Español para Clawback
# Spanish Language Pack for Clawback

LANG_CODE="es"
LANG_NAME="Español"

# Función de traducción / Translation Function
t() {
    local key="$1"
    case "$key" in
        # Títulos / Titles
        "title") echo "Clawback - Rollback de configuración OpenClaw" ;;
        "subtitle") echo "Backup y rollback de configuración en un clic" ;;
        
        # Menú principal / Main Menu
        "menu_navigate") echo "Usa ↑↓ para navegar, Enter para seleccionar:" ;;
        "menu_create") echo "Crear snapshot (backup manual con etiqueta)" ;;
        "menu_list") echo "Gestión de Snapshots y Rollback" ;;
        "menu_rollback") echo "Rollback a snapshot anterior" ;;
        "menu_delete") echo "Eliminar snapshot" ;;
        "menu_restart") echo "Backup y reiniciar OpenClaw" ;;
        "menu_language") echo "Cambiar idioma" ;;
        "menu_uninstall") echo "Desinstalar clawback" ;;
        "menu_exit") echo "Salir [ESC]" ;;
        
        # Visualización de información / Info Display
        "config_path") echo "Ruta de configuración" ;;
        "snapshots_count") echo "Snapshots almacenados" ;;
        
        # Crear snapshot / Create Snapshot
        "create_title") echo "Crear snapshot manual" ;;
        "create_label_prompt") echo "Ingresa una etiqueta (ej: feishu-config-ok):" ;;
        "create_success") echo "[✓] Snapshot creado" ;;
        "create_failed") echo "[✗] Error al crear" ;;
        
        # Lista / List
        "list_title") echo "Lista de snapshots" ;;
        "list_empty") echo "No se encontraron snapshots" ;;
        "list_navigate") echo "Acciones: [R]Rollback [D]Eliminar [V]Ver [C]Comparar [ESC]Volver" ;;
        
        # Detalles / Details
        "detail_title") echo "Detalles del snapshot" ;;
        "detail_file") echo "Archivo" ;;
        "detail_size") echo "Tamaño" ;;
        "detail_modified") echo "Modificado" ;;
        "detail_primary") echo "Modelo principal" ;;
        "detail_fallback") echo "Fallback" ;;
        "detail_feishu") echo "Feishu" ;;
        "detail_summary") echo "Resumen de configuración" ;;
        
        # Acciones / Actions
        "actions") echo "Acciones" ;;
        "actions_rollback") echo "[R] Rollback" ;;
        "actions_delete") echo "[D] Eliminar" ;;
        "actions_back") echo "[Q] Volver" ;;
        "action_rollback") echo "Rollback" ;;
        "action_delete") echo "Eliminar" ;;
        "action_compare") echo "Comparar" ;;
        "view_full") echo "Ver configuración completa" ;;
        "any_key") echo "Cualquier tecla" ;;
        "back") echo "Volver" ;;
        
        # Rollback / Rollback
        "rollback_title") echo "Confirmar rollback" ;;
        "rollback_target") echo "Objetivo de rollback" ;;
        "rollback_confirm") echo "¿Confirmar rollback a esta versión?" ;;
        "rollback_backup") echo "La configuración actual se respaldará automáticamente" ;;
        "rollback_warning") echo "Esto sobrescribirá su openclaw.json actual" ;;
        "rollback_success") echo "[✓] Rollback exitoso" ;;
        "rollback_backup_saved") echo "Config actual guardada como" ;;
        "rollback_restart_hint") echo "Ejecuta 'openclaw gateway restart' para aplicar" ;;
        "rollback_empty") echo "No hay snapshots disponibles para rollback" ;;
        "rollback_select") echo "Seleccionar snapshot para rollback" ;;
        "rollback_navigate") echo "(Enter para confirmar, Q para cancelar)" ;;
        "rollback_restart") echo "Ejecuta 'openclaw gateway restart' para aplicar" ;;
        
        # Eliminar / Delete
        "delete_title") echo "Confirmar eliminación" ;;
        "delete_target") echo "Objetivo de eliminación" ;;
        "delete_confirm") echo "¿Confirmar eliminación de este snapshot?" ;;
        "delete_success") echo "[✓] Eliminado" ;;
        
        # Reinicio / Restart
        "restart_title") echo "Backup y reinicio" ;;
        "restart_backup") echo "[✓] Snapshot creado" ;;
        "restart_backup_created") echo "Snapshot creado" ;;
        "restart_skip") echo "[i] Sin cambios, backup omitido" ;;
        "restart_no_changes") echo "Sin cambios, backup omitido" ;;
        "restart_not_found") echo "[✗] Comando OpenClaw no encontrado" ;;
        "restart_starting") echo "Reiniciando OpenClaw" ;;
        "restart_manual") echo "Por favor reinicia manualmente: openclaw gateway restart" ;;
        
        # Desinstalación / Uninstall
        "uninstall_title") echo "Desinstalar Clawback" ;;
        "uninstall_desc") echo "Eliminar clawback del sistema" ;;
        "uninstall_option1") echo "[1] Eliminar solo el programa (conservar snapshots)" ;;
        "uninstall_option2") echo "[2] Eliminación completa (incluyendo snapshots)" ;;
        "uninstall_option3") echo "[3] Cancelar" ;;
        "uninstall_keep") echo "[✓] Programa eliminado, snapshots conservados" ;;
        "uninstall_full") echo "[✓] Eliminación completa" ;;
        "uninstall_location") echo "Ubicación de snapshots" ;;
        
        # Función de comparación / Compare Feature
        "compare_title") echo "Vista previa del rollback" ;;
        "compare_desc") echo "Muestra los cambios después del rollback a esta versión" ;;
        "compare_not_found") echo "Herramienta de comparación no encontrada" ;;
        "compare_preview_title") echo "Vista previa de comparación" ;;
        "compare_no_change") echo "Sin cambios" ;;
        "compare_legend") echo "Leyenda: [+]Añadido [-]Eliminado [~]Cambiado" ;;
        "compare_module_no_change") echo "Sin cambios en este módulo" ;;
        "compare_usage") echo "Uso: Presiona C en los detalles del snapshot para comparar" ;;
        
        # ESC y Navegación / ESC and Navigation
        "esc_cancel") echo "[ESC] Cancelar y volver" ;;
        "press_q_back") echo "Presiona Q para volver" ;;
        
        # Detección de instalación / Installation Detection
        "install_detect_title") echo "Detección de OpenClaw" ;;
        "install_detect_found") echo "OpenClaw encontrado" ;;
        "install_detect_not_found") echo "OpenClaw no encontrado" ;;
        "install_detect_path") echo "Ubicación" ;;
        "install_detect_version") echo "Versión" ;;
        "install_detect_config") echo "Configuración" ;;
        "install_detect_reason") echo "Razones posibles" ;;
        "install_detect_suggest") echo "Sugerencias" ;;
        "install_detect_continue") echo "¿Continuar con la instalación?" ;;
        
        # General / General
        "cancelled") echo "Cancelado" ;;
        "continue") echo "Presiona Enter para continuar..." ;;
        "exit_goodbye") echo "¡Adiós!" ;;
        "label") echo "Etiqueta" ;;
        "select") echo "Seleccionar" ;;
        "confirm") echo "Confirmar" ;;
        "config_not_found") echo "Configuración de OpenClaw no encontrada" ;;
        
        # Por defecto: devolver nombre de clave / Default: return key name
        *) echo "$key" ;;
    esac
}

# Exportar función y variables / Export function and variables
export -f t
export LANG_CODE LANG_NAME
