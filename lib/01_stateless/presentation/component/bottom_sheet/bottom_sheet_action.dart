import 'package:freezed_annotation/freezed_annotation.dart';

part 'bottom_sheet_action.freezed.dart';

@freezed
sealed class BottomSheetAction with _$BottomSheetAction {
  const factory BottomSheetAction.clickOnFilter() = ClickOnFilter;
  const factory BottomSheetAction.selectTime(String time) = SelectTime;
  const factory BottomSheetAction.selectRate(int rate) = SelectRate;
  const factory BottomSheetAction.selectCategory(String category) = SelectCategory;
}