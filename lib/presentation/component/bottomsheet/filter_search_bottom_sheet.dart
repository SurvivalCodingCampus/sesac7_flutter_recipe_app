import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_button.dart';
import 'package:flutter_recipe_app/presentation/component/bottomsheet/filter_search_bottom_sheet_state.dart';

class FilterSearchBottomSheet extends StatefulWidget {
  final FilterSearchBottomSheetState filterSearchState; // 외부에서 초기 상태를 받을수있도록
  const FilterSearchBottomSheet({super.key, required this.filterSearchState});

  @override
  State<FilterSearchBottomSheet> createState() =>
      _FilterSearchBottomSheetState();
}

class _FilterSearchBottomSheetState extends State<FilterSearchBottomSheet> {
  late FilterSearchBottomSheetState _state;

  @override
  void initState() {
    super.initState();
    //_state = FilterSearchBottomSheetState(); // 이것 때문에 초기값으로 됨 -> 해결방법 부모위젯으로 보내기
    _state = widget.filterSearchState; // 외부로 부터 초기 상태를 받아옴
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              'Filter Search',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 20),
          const Text(
            'Time',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            children: ['All', 'Newest', 'Oldest', 'Popularity'].map((time) {
              return FilterButton(
                text: time,
                isSelected: _state.selectedTime == time,
                onTap: () {
                  setState(() {
                    _state = _state.copyWith(selectedTime: time);
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Text(
            'Rate',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            children: [5, 4, 3, 2, 1].map((rate) {
              return RatingButton(
                text: rate.toString(),
                isSelected: _state.selectedRate == rate,
                onTap: () {
                  setState(() {
                    _state = _state.copyWith(selectedRate: rate);
                  });
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          const Text(
            'Category',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Wrap(
            children:
                [
                  'All',
                  'Cereal',
                  'Vegetables',
                  'Dinner',
                  'Chinese',
                  'Local Dish',
                  'Fruit',
                  'Breakfast',
                  'Spanish',
                  'Lunch',
                ].map((category) {
                  final isSelected = _state.selectedCategories.contains(
                    category,
                  );
                  return FilterButton(
                    text: category,
                    isSelected: isSelected,
                    onTap: () {
                      setState(() {
                        _handleCategorySelection(category);
                        // 기존 카테고리 목록을 복사 // 스프레드 연산자 ...
                        final newCategories = [..._state.selectedCategories];
                        // final newCategories = [
                        //               'All', 'Cereal', 'Vegetables', 'Dinner', 'Chinese', 'Local Dish', 'Fruit', 'Breakfast',
                        //               'Spanish', 'Lunch'
                        //             ].toList();
                        if (category == 'All') {
                          _state = _state.copyWith(
                            selectedCategories: isSelected ? [] : ['All'],
                          );
                        } else {
                          // if (category.contains('All')) {
                          //   newCategories.remove('All');
                          // }
                          if (newCategories.contains(category)) {
                            newCategories.remove(category);
                          } else {
                            newCategories.add(category);
                            newCategories.remove('All');
                          }
                          if (newCategories.isEmpty) {
                            _state = _state.copyWith(
                              selectedCategories: ['All'],
                            );
                          } else {
                            _state = _state.copyWith(
                              selectedCategories: newCategories,
                            );
                          }
                        }
                      });
                    },
                  );
                }).toList(),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context, _state); // search_recipes_screen.dart _state 객체가 전달
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                'Filter',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void _handleCategorySelection(String category) {


}
