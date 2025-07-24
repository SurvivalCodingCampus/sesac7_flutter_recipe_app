import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_holder_info.freezed.dart';

@freezed
abstract class FilterHolderInfo with _$FilterHolderInfo {
  const factory FilterHolderInfo({
    @Default(false) bool isSelected,
    required String itemName,
  }) = _FilterHolderInfo;
}
