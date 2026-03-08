#!/bin/bash
# 한국어 언어 팩 for Clawback
# Korean Language Pack for Clawback

LANG_CODE="ko"
LANG_NAME="한국어"

# 번역 함수 / Translation Function
t() {
    local key="$1"
    case "$key" in
        # 제목 / Titles
        "title") echo "Clawback - OpenClaw 설정 롤백" ;;
        "subtitle") echo "설정 백업 및 원클릭 롤백" ;;
        
        # 메인 메뉴 / Main Menu
        "menu_navigate") echo "↑↓로 선택, Enter로 확인:" ;;
        "menu_create") echo "스냅샷 생성 (라벨이 있는 수동 백업)" ;;
        "menu_list") echo "스냅샷 관리 및 롤백" ;;
        "menu_rollback") echo "이전 스냅샷으로 롤백" ;;
        "menu_delete") echo "스냅샷 삭제" ;;
        "menu_restart") echo "백업하고 OpenClaw 재시작" ;;
        "menu_language") echo "언어 변경" ;;
        "menu_uninstall") echo "clawback 제거" ;;
        "menu_exit") echo "종료 [ESC]" ;;
        
        # 정보 표시 / Info Display
        "config_path") echo "설정 경로" ;;
        "snapshots_count") echo "저장된 스냅샷" ;;
        
        # 스냅샷 생성 / Create Snapshot
        "create_title") echo "수동 스냅샷 생성" ;;
        "create_label_prompt") echo "라벨 입력 (예: feishu-config-ok):" ;;
        "create_success") echo "[✓] 스냅샷 생성 완료" ;;
        "create_failed") echo "[✗] 생성 실패" ;;
        "create_too_frequent") echo "[i] 너무 빈번합니다, 5분 후에 다시 시도하세요" ;;
        
        # 목록 / List
        "list_title") echo "스냅샷 목록" ;;
        "list_empty") echo "스냅샷을 찾을 수 없습니다" ;;
        "list_navigate") echo "작업: [R]롤백 [D]삭제 [V]보기 [C]비교 [ESC]뒤로" ;;
        
        # 상세 / Details
        "detail_title") echo "스냅샷 상세" ;;
        "detail_file") echo "파일" ;;
        "detail_size") echo "크기" ;;
        "detail_modified") echo "수정 시간" ;;
        "detail_primary") echo "기본 모델" ;;
        "detail_fallback") echo "폴백" ;;
        "detail_feishu") echo "Feishu" ;;
        "detail_summary") echo "설정 요약" ;;
        
        # 작업 / Actions
        "actions") echo "작업" ;;
        "actions_rollback") echo "[R] 롤백" ;;
        "actions_delete") echo "[D] 삭제" ;;
        "actions_back") echo "[Q] 뒤로" ;;
        "action_rollback") echo "롤백" ;;
        "action_delete") echo "삭제" ;;
        "action_compare") echo "비교" ;;
        "view_full") echo "전체 설정 보기" ;;
        "any_key") echo "아무 키" ;;
        "back") echo "뒤로" ;;
        
        # 롤백 / Rollback
        "rollback_title") echo "롤백 확인" ;;
        "rollback_target") echo "롤백 대상" ;;
        "rollback_confirm") echo "이 버전으로 롤백하시겠습니까?" ;;
        "rollback_backup") echo "현재 설정은 자동으로 백업됩니다" ;;
        "rollback_warning") echo "현재 openclaw.json을 덮어씁니다" ;;
        "rollback_success") echo "[✓] 롤백 성공" ;;
        "rollback_backup_saved") echo "현재 설정이 저장되었습니다" ;;
        "rollback_restart_hint") echo "'openclaw gateway restart'를 실행하여 변경사항 적용" ;;
        "rollback_empty") echo "롤백 가능한 스냅샷이 없습니다" ;;
        "rollback_select") echo "롤백할 스냅샷 선택" ;;
        "rollback_navigate") echo "(Enter 확인, Q 취소)" ;;
        "rollback_restart") echo "'openclaw gateway restart'를 실행하여 변경사항 적용" ;;
        
        # 삭제 / Delete
        "delete_title") echo "삭제 확인" ;;
        "delete_target") echo "삭제 대상" ;;
        "delete_confirm") echo "이 스냅샷을 삭제하시겠습니까?" ;;
        "delete_success") echo "[✓] 삭제되었습니다" ;;
        "delete_select") echo "삭제할 스냅샷 선택" ;;
        "delete_hint") echo "(Enter 확인, Q 취소)" ;;
        
        # 재시작 / Restart
        "restart_title") echo "백업 및 재시작" ;;
        "restart_backup") echo "[✓] 스냅샷 생성 완료" ;;
        "restart_backup_created") echo "스냅샷이 생성되었습니다" ;;
        "restart_skip") echo "[i] 변경사항이 없습니다, 백업을 걸너뜁니다" ;;
        "restart_no_changes") echo "변경사항이 없습니다, 백업을 걸너뜁니다" ;;
        "restart_not_found") echo "[✗] OpenClaw 명령을 찾을 수 없습니다" ;;
        "restart_starting") echo "OpenClaw를 재시작 중" ;;
        "restart_manual") echo "수동으로 재시작하세요: openclaw gateway restart" ;;
        
        # 제거 / Uninstall
        "uninstall_title") echo "Clawback 제거" ;;
        "uninstall_desc") echo "시스템에서 clawback 제거" ;;
        "uninstall_option1") echo "[1] 프로그램만 삭제 (스냅샷 유지)" ;;
        "uninstall_option2") echo "[2] 완전 삭제 (스냅샷 포함)" ;;
        "uninstall_option3") echo "[3] 취소" ;;
        "uninstall_keep") echo "[✓] 프로그램 삭제 완료, 스냅샷 유지" ;;
        "uninstall_full") echo "[✓] 완전 삭제 완료" ;;
        "uninstall_location") echo "스냅샷 위치" ;;
        
        # 비교 기능 / Compare Feature
        "compare_title") echo "롤백 미리보기" ;;
        "compare_desc") echo "이 버전으로 롤백 후의 변경사항을 표시" ;;
        "compare_not_found") echo "비교 도구를 찾을 수 없습니다" ;;
        "compare_preview_title") echo "비교 미리보기" ;;
        "compare_no_change") echo "변경사항 없음" ;;
        "compare_legend") echo "범례: [+]추가됨 [-]삭제됨 [~]변경됨" ;;
        "compare_module_no_change") echo "이 모듈에 변경사항 없음" ;;
        "compare_usage") echo "사용법: 스냅샷 상세에서 C 키를 눌러 비교" ;;
        
        # ESC 및 네비게이션 / ESC and Navigation
        "esc_cancel") echo "[ESC] 취소하고 돌아가기" ;;
        "press_q_back") echo "Q를 눌러 돌아가기" ;;
        
        # 설치 감지 / Installation Detection
        "install_detect_title") echo "OpenClaw 감지" ;;
        "install_detect_found") echo "OpenClaw를 찾았습니다" ;;
        "install_detect_not_found") echo "OpenClaw를 찾을 수 없습니다" ;;
        "install_detect_path") echo "위치" ;;
        "install_detect_version") echo "버전" ;;
        "install_detect_config") echo "설정" ;;
        "install_detect_reason") echo "가능한 원인" ;;
        "install_detect_suggest") echo "권장 조치" ;;
        "install_detect_continue") echo "설치를 계속하시겠습니까?" ;;
        
        # 일반 / General
        "cancelled") echo "취소되었습니다" ;;
        "continue") echo "Enter 키를 눌러 계속..." ;;
        "exit_goodbye") echo "안녕히 가세요!" ;;
        "label") echo "라벨" ;;
        "select") echo "선택" ;;
        "confirm") echo "확인" ;;
        "config_not_found") echo "OpenClaw 설정을 찾을 수 없습니다" ;;
        
        # 기본: 키 이름 반환 / Default: return key name
        *) echo "$key" ;;
    esac
}

# 함수 및 변수 내보내기 / Export function and variables
export -f t
export LANG_CODE LANG_NAME
