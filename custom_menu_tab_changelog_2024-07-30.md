# 커스텀 메뉴 탭 변경사항 정리

**일시:** 2024-07-30

---

## 1. PopupMenuButton에서 showDialog 방식으로 변경
- **설명:**
  - PopupMenuButton의 제한적인 스타일링과 위치 제어 문제를 해결하기 위해 showDialog + Dialog 방식으로 변경
  - 전체 화면에 반투명 배경이 깔리는 효과를 구현하여 더 나은 UX 제공
  - 메뉴 외부 클릭 시 자동으로 닫히는 기능 추가
- **수정 파일:**
  - `lib/features/show_ingredients/presentation/component/custom_menu_tab.dart`
- **주요 수정 변수/로직:**
  - `PopupMenuButton` → `showDialog` + `Dialog` 구조로 변경
  - `barrierColor: Colors.black.withValues(alpha: 0.5)` 추가로 전체 화면 반투명 배경
  - `Positioned.fill` + `GestureDetector`로 외부 클릭 처리
  - `Positioned(top: 50, right: 30)`로 메뉴 위치 고정

---

## 2. 메뉴 아이템 정렬 상태 수정
- **설명:**
  - 원래 PopupMenuItem과 동일한 정렬 상태를 유지하기 위해 crossAxisAlignment 제거
  - 아이콘과 텍스트의 수직 정렬을 원래 상태로 복원
- **수정 파일:**
  - `lib/features/show_ingredients/presentation/component/custom_menu_tab.dart`
- **주요 수정 변수/로직:**
  - `_buildMenuItem` 메서드에서 `crossAxisAlignment: CrossAxisAlignment.center` 제거
  - `mainAxisAlignment: MainAxisAlignment.start`만 유지

---

## 3. 메뉴 아이템 패딩 개선
- **설명:**
  - 첫 번째 아이템과 마지막 아이템에 추가 패딩을 적용하여 시각적 균형 개선
  - 첫 번째 아이템은 top padding 20, 마지막 아이템은 bottom padding 20 적용
- **수정 파일:**
  - `lib/features/show_ingredients/presentation/component/custom_menu_tab.dart`
- **주요 수정 변수/로직:**
  - `_buildMenuItem` 메서드에 `isFirst`, `isLast` 옵션 파라미터 추가
  - 조건부 패딩 적용:
    ```dart
    padding: EdgeInsets.fromLTRB(
      8,
      isFirst ? 20 : 10, // 첫 번째 아이템은 top padding 20
      8,
      isLast ? 20 : 10, // 마지막 아이템은 bottom padding 20
    ),
    ```
  - 첫 번째 아이템(Share)에 `isFirst: true` 적용
  - 마지막 아이템(Unsave)에 `isLast: true` 적용

---

## 4. withOpacity → withValues 변경
- **설명:**
  - Flutter의 deprecated된 `withOpacity` 메서드를 `withValues`로 변경
  - 최신 Flutter 버전과의 호환성 확보
- **수정 파일:**
  - `lib/features/show_ingredients/presentation/component/custom_menu_tab.dart`
- **주요 수정 변수/로직:**
  - `Colors.black.withOpacity(0.1)` → `Colors.black.withValues(alpha: 0.1)`
  - `Colors.black.withOpacity(0.5)` → `Colors.black.withValues(alpha: 0.5)`

---

## 5. 메뉴 구조 개선
- **설명:**
  - PopupMenuItem에서 커스텀 GestureDetector 구조로 변경
  - 메뉴 아이템 클릭 시 다이얼로그를 먼저 닫고 콜백 실행하도록 개선
- **수정 파일:**
  - `lib/features/show_ingredients/presentation/component/custom_menu_tab.dart`
- **주요 수정 변수/로직:**
  - `_buildMenuItem` 메서드에서 `GestureDetector` 사용
  - 클릭 시 `Navigator.of(context).pop()` 먼저 실행 후 `onSelectMenuItem(index)` 호출
  - 메뉴 아이템 구조를 `Container` + `Row` 형태로 변경

---

**요약:**
- PopupMenuButton의 한계를 극복하여 전체 화면 반투명 배경 효과 구현
- 메뉴 아이템의 정렬과 패딩을 개선하여 더 나은 시각적 효과 제공
- 최신 Flutter API 사용으로 호환성 확보
- 메뉴 클릭 시 UX 개선 (다이얼로그 자동 닫기)
- 전체적으로 더 자연스럽고 직관적인 메뉴 인터페이스 구현 