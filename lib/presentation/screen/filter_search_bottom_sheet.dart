import 'package:flutter/material.dart';

import '../../core/category.dart';
import '../../core/filter_options.dart';
import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';
import '../component/small_button.dart';
import '../component/unclicked_filter_button.dart';
import '../component/unclicked_rating_button.dart';
import 'filter_search_bottom_sheet_state.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final FilterSearchBottomSheetState? filterSearchState;

  final void Function(
    FilterSearchBottomSheetState filterSearchState,
  )
  onClosing;

  const FilterSearchBottomSheet({
    super.key,
    required this.onClosing,
    this.filterSearchState,
  });

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  final int ratingLength = 5;

  late FilterSearchBottomSheetState filterSearchState;

  @override
  void initState() {
    super.initState();
    // 위젯으로부터 전달받은 초기 필터 값들로 filterSearchState를 초기화합니다.
    filterSearchState = FilterSearchBottomSheetState(
      selectedTimeFilter: widget.filterSearchState?.selectedTimeFilter,
      selectedRatingFilter: widget.filterSearchState?.selectedRatingFilter,
      selectedCategoryFilter: widget.filterSearchState?.selectedCategoryFilter,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      enableDrag: false,
      constraints: BoxConstraints(
        minWidth: double.infinity,
        minHeight: 484,
      ),
      backgroundColor: Colors.transparent,
      onClosing: () {},
      builder: (BuildContext context) {
        return Container(
          width: double.infinity,
          height: 484,
          padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: SizedBox()),
              Text(
                'Filter Search',
                style: TextStyles.smallTextBold,
              ),
              Expanded(child: SizedBox(height: 20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: TextStyles.smallTextBold,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      spacing: 10,
                      children: [
                        ...List.generate(
                          FilterOptions.values.length,
                          (index) {
                            final text = FilterOptions.values[index].name;

                            final bool checkSelected =
                                (filterSearchState.selectedTimeFilter == text);

                            return UnclickedFilterButton(
                              text: text,
                              isSelected: checkSelected,
                              onClick: () {
                                setState(() {
                                  if (filterSearchState.selectedTimeFilter ==
                                      text) {
                                    filterSearchState = filterSearchState
                                        .copyWith(
                                          selectedTimeFilter: null,
                                        );
                                  } else {
                                    filterSearchState = filterSearchState
                                        .copyWith(
                                          selectedTimeFilter: text,
                                        );
                                  }
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox(height: 20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rate',
                    style: TextStyles.smallTextBold,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 15,
                      children: [
                        ...List.generate(ratingLength, (index) {
                          final int rating = ratingLength - index;

                          final bool checkSelected =
                              (rating ==
                              filterSearchState.selectedRatingFilter);

                          return UnclickedRatingButton(
                            text: '${ratingLength - index}',
                            isSelected: checkSelected,
                            onClick: () {
                              setState(() {
                                if (filterSearchState.selectedRatingFilter ==
                                    rating) {
                                  filterSearchState = filterSearchState
                                      .copyWith(
                                        selectedRatingFilter: null,
                                      );
                                } else {
                                  filterSearchState = filterSearchState
                                      .copyWith(
                                        selectedRatingFilter: rating,
                                      );
                                }
                              });
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox(height: 20)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Category',
                    style: TextStyles.smallTextBold,
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      crossAxisAlignment: WrapCrossAlignment.start,
                      children: [
                        ...List.generate(
                          Category.values.length,
                          (index) {
                            final text = Category.values[index].name;

                            final bool checkSelected =
                                (filterSearchState.selectedCategoryFilter ==
                                text);

                            return UnclickedFilterButton(
                              text: text,
                              isSelected: checkSelected,
                              onClick: () {
                                setState(() {
                                  if (filterSearchState
                                          .selectedCategoryFilter ==
                                      text) {
                                    filterSearchState = filterSearchState
                                        .copyWith(
                                          selectedCategoryFilter: null,
                                        );
                                  } else {
                                    filterSearchState = filterSearchState
                                        .copyWith(
                                          selectedCategoryFilter: text,
                                        );
                                  }
                                });
                              },
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Expanded(child: SizedBox(height: 30)),
              SmallButton(
                text: 'Filter',
                onClick: () {
                  widget.onClosing(filterSearchState);
                  // Navigator.pop(context);
                },
              ),
              Expanded(child: SizedBox()),
            ],
          ),
        );
      },
    );
  }
}
