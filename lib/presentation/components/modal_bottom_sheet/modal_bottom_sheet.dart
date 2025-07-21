import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/components/modal_bottom_sheet/filter_search_state.dart';
import 'package:flutter_recipe_app/presentation/components/modal_bottom_sheet/search_filter_enums.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

// // 사용자가 'Local Dish' 카테고리를 선택했을 경우
// FoodCategory selectedCategory = FoodCategory.localDish;
//
// // 선택된 카테고리의 UI 표시 이름 가져오기
// print(selectedCategory.displayName); // 출력: Local Dish
//
// // UI에서 카테고리에 따라 다른 처리를 할 경우
// if (selectedCategory == FoodCategory.breakfast) {
// print('아침 식사 메뉴를 보여줍니다.');
// } else if (selectedCategory.displayName == 'All') {
// print('모든 메뉴를 보여줍니다.');
// }
//
// // 모든 카테고리를 반복하며 UI 버튼을 생성하는 경우
// for (var category in FoodCategory.values) {
// print('버튼 텍스트: ${category.displayName}');
// }

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({super.key});

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  // Set<TimeFilter> timeFilters = {};
  // Set<RatingFilter> ratingFilters = {};
  // Set<CategoryFilter> categoryFilters = {};

  FilterSearchState _state = FilterSearchState();

  FilterSearchState get state => _state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Filter Search',
                style: TextStyles.smallTextBold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Time',
              style: TextStyles.smallTextBold,
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 10.0, // gap between lines
              children: TimeFilter.values.map((TimeFilter time) {
                bool userSelected = state.timeFilters.contains(time);
                return FilterChip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  backgroundColor: AppColors.white,
                  selectedColor: AppColors.primary100,
                  showCheckmark: false,
                  side: BorderSide(
                    color: userSelected
                        ? AppColors.primary80
                        : AppColors.primary100,
                  ),
                  label: Text(time.displayName),
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  labelStyle: TextStyle(
                    color: userSelected ? AppColors.white : AppColors.primary80,
                  ),
                  selected: userSelected,
                  onSelected: (bool selected) {
                    setState(
                      () {
                        if (selected) {
                          // state.timeFilters.add(time);
                          _state = state.copyWith(
                            timeFilters: {...state.timeFilters, time},
                          );
                        } else {
                          _state = state.copyWith(
                            timeFilters: state.timeFilters
                                .where((t) => t != time)
                                .toSet(),
                          );
                        }
                      },
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Rating',
              style: TextStyles.smallTextBold,
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 10.0, // gap between lines
              children: RatingFilter.values.map((RatingFilter rating) {
                bool userSelected = state.ratingFilters.contains(rating);
                return FilterChip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  backgroundColor: AppColors.white,
                  selectedColor: AppColors.primary100,
                  showCheckmark: false,
                  side: BorderSide(
                    color: userSelected
                        ? AppColors.primary80
                        : AppColors.primary100,
                  ),
                  label: Text(rating.displayName),
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  labelStyle: TextStyle(
                    color: userSelected ? AppColors.white : AppColors.primary80,
                  ),
                  selected: userSelected,
                  onSelected: (bool selected) {
                    setState(
                      () {
                        if (selected) {
                          // state.timeFilters.add(time);
                          _state = state.copyWith(
                            ratingFilters: {...state.ratingFilters, rating},
                          );
                        } else {
                          _state = state.copyWith(
                            ratingFilters: state.ratingFilters
                                .where((t) => t != rating)
                                .toSet(),
                          );
                        }
                      },
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'Category',
              style: TextStyles.smallTextBold,
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10.0, // gap between adjacent chips
              runSpacing: 10.0, // gap between lines
              children: CategoryFilter.values.map((CategoryFilter category) {
                bool userSelected = state.categoryFilters.contains(category);
                return FilterChip(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  backgroundColor: AppColors.white,
                  selectedColor: AppColors.primary100,
                  showCheckmark: false,
                  side: BorderSide(
                    color: userSelected
                        ? AppColors.primary80
                        : AppColors.primary100,
                  ),
                  label: Text(category.displayName),
                  labelPadding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 5,
                  ),
                  labelStyle: TextStyle(
                    color: userSelected ? AppColors.white : AppColors.primary80,
                  ),
                  selected: userSelected,
                  onSelected: (bool selected) {
                    setState(
                      () {
                        if (selected) {
                          // state.timeFilters.add(time);
                          _state = state.copyWith(
                            categoryFilters: {
                              ...state.categoryFilters,
                              category,
                            },
                          );
                        } else {
                          _state = state.copyWith(
                            categoryFilters: state.categoryFilters
                                .where((t) => t != category)
                                .toSet(),
                          );
                        }
                      },
                    );
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(174, 37),
                  backgroundColor: AppColors.primary100,
                ),
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  'Filter',
                  style: TextStyles.smallerTextBold.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: ModalBottomSheet(),
      ),
    ),
  );
}
