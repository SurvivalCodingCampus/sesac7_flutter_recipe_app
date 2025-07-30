# 검색 및 필터 기능 변경사항 정리

**일시:** 2024-07-30

---

## 1. 필터 해제 시 전체 레시피가 최근 검색 이력에 추가되는 현상 수정
- **설명:**
  - 필터를 해제하면 전체 레시피가 최근 검색 이력에 한 번에 추가되는 UX 혼란 발생을 방지.
  - 필터가 실제로 활성화되어 있고 결과가 있을 때만 검색 이력에 추가하도록 조건 강화.
  - 필터가 모두 해제된 경우에는 최근 검색 이력만 보여주도록 분기 처리.
- **수정 파일:**
  - `lib/features/search_recipes/presentation/screen/search_recipes_screen_view_model.dart`
- **주요 수정 변수/로직:**
  - `isFilterActive` 변수 도입: `final isFilterActive = filterSearchState.selectedRatingFilter != null;`
  - 검색 이력 추가 조건 강화: `if (isFilterActive && filteredList.isNotEmpty) { _addSearchHistoryUseCase.execute(filteredList); }`
  - filteredResult 분기: `(state.query.isNotEmpty || isFilterActive) ? filteredList : _fetchSearchHistoriesUseCase.execute()`

---

## 2. 쿼리 검색 시 검색 결과가 최근 검색 이력에 추가되지 않는 현상 수정
- **설명:**
  - 쿼리로 검색 후 쿼리를 모두 지우면, 검색 이력에 새 검색 결과가 반영되지 않는 문제 해결.
  - 쿼리로 검색했을 때, 검색 결과가 있으면 반드시 AddSearchHistoryUseCase를 호출하여 최근 검색 이력에 추가하도록 수정.
- **수정 파일:**
  - `lib/features/search_recipes/presentation/screen/search_recipes_screen_view_model.dart`
- **주요 수정 변수/로직:**
  - `_search` 메서드 내에서 `if (query.isNotEmpty && searchedResult.isNotEmpty) { _addSearchHistoryUseCase.execute(searchedResult); }` 추가

---

## 3. 쿼리 검색 후 쿼리를 모두 지운 상태에서 필터만 적용하면 결과가 안 나오는 현상 수정
- **설명:**
  - 한 번이라도 쿼리 검색 후 쿼리를 모두 지우고 필터만 적용하면, 필터 결과가 나오지 않는 문제 해결.
  - 쿼리가 비어있을 때는 항상 전체 레시피를 대상으로 필터가 적용되도록 baseList 조건을 수정.
- **수정 파일:**
  - `lib/features/search_recipes/presentation/screen/search_recipes_screen_view_model.dart`
- **주요 수정 변수/로직:**
  - `_filterRecipes` 내에서 baseList 결정 로직 변경:
    ```dart
    final List<Recipe> baseList = state.query.isEmpty
        ? state.recipes
        : (state.searchedResult ?? state.recipes);
    ```

---

## 4. searchLabel(상단 라벨) 표시 로직 개선
- **설명:**
  - 검색 중이 아닐 때도 'Search Result'가 계속 표시되는 UX 오류 수정.
  - 쿼리 중이거나 필터가 활성화된 경우에만 'Search Result'가, 검색 중이 아닐 때는 항상 'Recent Search'가 표시되도록 조건을 명확하게 수정.
- **수정 파일:**
  - `lib/features/search_recipes/presentation/screen/search_recipes_screen_view_model.dart`
- **주요 수정 변수/로직:**
  - `_filterRecipes` 내에서 searchLabel 결정 로직 변경:
    ```dart
    searchLabel: (state.query.isNotEmpty || isFilterActive)
        ? 'Search Result'
        : 'Recent Search',
    ```

---

## 5. 주석과 코드의 불일치 여부 점검
- **설명:**
  - 기존 주석과 코드의 동작이 일치함을 확인. 불필요한 주석 수정이나 추가는 필요하지 않음.
- **수정 파일:**
  - `lib/features/search_recipes/presentation/screen/search_recipes_screen_view_model.dart`

---

**요약:**
- 검색/필터 UX가 자연스럽고 일관되게 동작하도록 로직을 개선함.
- 최근 검색 이력, 필터, 쿼리 검색, 라벨 표시 등 모든 주요 흐름이 요구사항에 맞게 동작함.
- 코드와 주석의 불일치도 없음. 