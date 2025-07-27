import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_bottom_sheet_state.freezed.dart';
part 'filter_search_bottom_sheet_state.g.dart';

@freezed
abstract class FilterSearchBottomSheetState
    with _$FilterSearchBottomSheetState {
  const factory FilterSearchBottomSheetState({
    String? selectedTimeFilter,
    int? selectedRatingFilter,
    String? selectedCategoryFilter,
  }) = _FilterSearchBottomSheetState;

  factory FilterSearchBottomSheetState.fromJson(Map<String, Object?> json) =>
      _$FilterSearchBottomSheetStateFromJson(json);
}
