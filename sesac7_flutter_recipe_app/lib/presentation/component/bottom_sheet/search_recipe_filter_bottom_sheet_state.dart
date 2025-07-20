import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_category_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_time_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_recipe_filter_bottom_sheet_state.freezed.dart';

@freezed
abstract class SearchRecipeFilterBottomSheetState with _$SearchRecipeFilterBottomSheetState {
  const factory SearchRecipeFilterBottomSheetState({
    @Default(null) SearchRecipeFilterTimeType? timeType,
    @Default(null) RatingType? ratingType,
    @Default(null) SearchRecipeFilterCategoryType? categoryType,
  }) = _SearchRecipeFilterBottomSheetState;
}