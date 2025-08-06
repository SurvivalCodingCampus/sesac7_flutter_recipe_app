import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_bottom_sheet_state.freezed.dart';

@freezed
abstract class FilterSearchBottomSheetState
    with _$FilterSearchBottomSheetState {
  const factory FilterSearchBottomSheetState({
    @Default('Newest') String selectedTime,
    @Default(4) int selectedRate,
    @Default(['Local Dish']) List<String> selectedCategories,
  }) = _FilterSearchBottomSheetState;
}
