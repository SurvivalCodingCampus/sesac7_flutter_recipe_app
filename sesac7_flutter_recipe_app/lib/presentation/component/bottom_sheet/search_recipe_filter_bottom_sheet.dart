import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_category_type.dart';
import 'package:flutter_recipe_app/core/enum/search_recipe_filter_time_type.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

import 'search_recipe_filter_bottom_sheet_state.dart';

class SearchRecipeFilterBottomSheet extends StatefulWidget {
  final Function(
    SearchRecipeFilterTimeType? timeType,
    RatingType? ratingType,
    SearchRecipeFilterCategoryType? categoryType,
  )
  onValueChange;

  const SearchRecipeFilterBottomSheet({super.key, required this.onValueChange});

  @override
  State<SearchRecipeFilterBottomSheet> createState() =>
      _SearchRecipeFilterBottomSheetState();
}

class _SearchRecipeFilterBottomSheetState
    extends State<SearchRecipeFilterBottomSheet> {
  SearchRecipeFilterBottomSheetState _searchRecipeFilterBottomSheetState =
      SearchRecipeFilterBottomSheetState();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 31.0,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Filter Search',
              style: TextStyles.searchRecipeFilterBottomSheetTitle,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Time',
                style: TextStyles.searchRecipeFilterBottomSheetSubtitle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  for (final time in SearchRecipeFilterTimeType.values)
                    FilterButton(
                      filterTitle: time.value,
                      isSelected:
                          time.value ==
                          _searchRecipeFilterBottomSheetState.timeType?.value,
                      onValueChange: (isSelected) {
                        setState(() {
                          _searchRecipeFilterBottomSheetState =
                              _searchRecipeFilterBottomSheetState.copyWith(
                                timeType: isSelected ? time : null,
                              );
                        });
                      },
                    ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Rate',
                style: TextStyles.searchRecipeFilterBottomSheetSubtitle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Wrap(
                spacing: 15.0,
                runSpacing: 10.0,
                children: [
                  for (final rating in RatingType.values)
                    if (rating != RatingType.gradeZero)
                      RatingButton(
                        ratingButtonTitle: rating.value,
                        isSelected:
                            rating.value ==
                            _searchRecipeFilterBottomSheetState
                                .ratingType
                                ?.value,
                        onValueChange: (isSelected) {
                          setState(() {
                            _searchRecipeFilterBottomSheetState =
                                _searchRecipeFilterBottomSheetState.copyWith(
                                  ratingType: isSelected ? rating : null,
                                );
                          });
                        },
                      ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category',
                style: TextStyles.searchRecipeFilterBottomSheetSubtitle,
              ),
              SizedBox(
                height: 10.0,
              ),
              Wrap(
                spacing: 10.0,
                runSpacing: 10.0,
                children: [
                  for (final category in SearchRecipeFilterCategoryType.values)
                    FilterButton(
                      filterTitle: category.value,
                      isSelected:
                          category.value ==
                          _searchRecipeFilterBottomSheetState
                              .categoryType
                              ?.value,
                      onValueChange: (isSelected) {
                        setState(() {
                          _searchRecipeFilterBottomSheetState =
                              _searchRecipeFilterBottomSheetState.copyWith(
                                categoryType: isSelected ? category : null,
                              );
                        });
                      },
                    ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 30.0,
          ),
          Align(
            alignment: Alignment.center,
            child: SmallButton(
              title: 'Filter',
              onClick: () {
                widget.onValueChange(
                  _searchRecipeFilterBottomSheetState.timeType,
                  _searchRecipeFilterBottomSheetState.ratingType,
                  _searchRecipeFilterBottomSheetState.categoryType,
                );
                Navigator.pop(context);
              },
            ),
          ),
          SizedBox(
            height: 56.0,
          ),
        ],
      ),
    );
  }
}
