
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/custom_chip_with_star_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/presentation/view_model/filter_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/data/state_holder/filter_search_state.dart';

import '../../data/state_holder/filter_holder_info.dart';
import '../../ui/text_styles.dart';
import '../component/button/custom_chip_button.dart';

class FilterSearchBottomSheet extends StatelessWidget {
  final ScrollController scrollController;
  final FilterViewModel filterViewModel;
  final void Function(FilterSearchState filterSearchState) onFilterSelected;

  const FilterSearchBottomSheet({
    super.key,
    required this.scrollController,
    required this.filterViewModel,
    required this.onFilterSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: filterViewModel,
      builder: (BuildContext context, Widget? child) {
        return Column(

          children: [
            const SizedBox(height: 30), // 스크롤 영역과 버튼 사이 간격
            Container(
              alignment: Alignment.center,
              child: Text(
                'Filter Search',
                style: TextStyles.smallTextBold.copyWith(
                  color: AppColors.black,
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                controller: scrollController,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0, right: 30, bottom: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      // Time 필터
                      _buildSectionTitle('Time'),
                      _buildTimeFilterChips(
                        filterViewModel,
                      ),

                      // Rate 필터
                      _buildSectionTitle('Rate'),
                      _buildRateFilterChips(filterViewModel),

                      // Category 필터
                      _buildSectionTitle('Category'),
                      _buildCategoryFilterChips(filterViewModel),
                    ],
                  ),
                ),
              ),
            ),
            // 스크롤되지 않는 버튼 영역
            const SizedBox(height: 30), // 스크롤 영역과 버튼 사이 간격
            Center(
              child: SmallButton(
                text: 'Filter',
                onClick: () {

                  final time = filterViewModel.timesState
                      .firstWhere(
                        (item) => item.isSelected,
                    orElse: () => const FilterHolderInfo(itemName: 'All', isSelected: false),
                  ).itemName;

                  final rate = filterViewModel.ratesState
                      .firstWhere(
                        (item) => item.isSelected,
                    orElse: () => const FilterHolderInfo(itemName: '0', isSelected: false),
                  ).itemName;

                  final category = filterViewModel.categoriesState
                      .firstWhere(
                        (item) => item.isSelected,
                    orElse: () => const FilterHolderInfo(itemName: 'All', isSelected: false),
                  ).itemName;

                  onFilterSelected(FilterSearchState(time: time, rate: int.parse(rate), category: category));
                },
              ),
            ),
            const SizedBox(height: 20), // 버튼과 바텀 시트 바
          ],
        );
      },
    );
  }
}

Widget _buildSectionTitle(String title) {
  return Padding(
    padding: const EdgeInsets.only(top: 20.0, bottom: 10),
    child: Text(
      title,
      style: TextStyles.smallTextBold.copyWith(color: AppColors.black),
    ),
  );
}

Widget _buildTimeFilterChips(
  FilterViewModel filterViewModel,
) {
  return Wrap(
    spacing: 10.0, // 가로 간격
    runSpacing: 8.0, // 세로 간격
    children: filterViewModel.timesState.map((state) {
      return CustomChipButton(
        contents: state.itemName,
        onTap: (isSelected) {
          filterViewModel.updateFilterSearchState('time', state.itemName, !isSelected);
        },
        isSelected: filterViewModel.timesState.firstWhere((item) => item.itemName == state.itemName).isSelected,
      );
    }).toList(),
  );
}

Widget _buildRateFilterChips(
    FilterViewModel filterViewModel,
    ) {
  return Wrap(
    spacing: 12.0, // 가로 간격
    runSpacing: 8.0, // 세로 간격
    children: filterViewModel.ratesState.map((state) {
      //final isSelected = selectedValue == option;
      return CustomChipWithStarButton(
        isVisibleIcon: true,
        contents: state.itemName,
        onTap: (isSelected) {
          filterViewModel.updateFilterSearchState('rate', state.itemName, !isSelected);
        },
        isSelected: filterViewModel.ratesState.firstWhere((item) => item.itemName == state.itemName).isSelected,
      );
    }).toList(),
  );
}

Widget _buildCategoryFilterChips(
    FilterViewModel filterViewModel,
    ) {
  return Wrap(
    spacing: 10.0, // 가로 간격
    runSpacing: 8.0, // 세로 간격
    children: filterViewModel.categoriesState.map((state) {
      //final isSelected = selectedValue == option;
      return CustomChipWithStarButton(
        isVisibleIcon: state.itemName == 'Dinner' ? true : false,
        contents: state.itemName,
        onTap: (isSelected) {
          filterViewModel.updateFilterSearchState('category', state.itemName, !isSelected);
        },
        isSelected: filterViewModel.categoriesState.firstWhere((item) => item.itemName == state.itemName).isSelected,
      );
    }).toList(),
  );
}
