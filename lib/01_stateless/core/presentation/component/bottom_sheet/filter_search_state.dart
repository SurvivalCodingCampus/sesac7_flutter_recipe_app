import 'package:freezed_annotation/freezed_annotation.dart';

part 'filter_search_state.freezed.dart';

@freezed
abstract class FilterSearchState with _$FilterSearchState {
  const factory FilterSearchState({
    @Default('Newest') String time,
    @Default(4) int rate,
    @Default('Local Dish') String category,
  }) = _FilterSearchState;
}
