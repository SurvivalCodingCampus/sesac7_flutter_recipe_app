import 'package:flutter/material.dart';

import '../../data/state_holder/filter_holder_info.dart';

class FilterViewModel with ChangeNotifier {
  List<FilterHolderInfo> _timesState = [
    FilterHolderInfo(itemName: 'All'),
    FilterHolderInfo(itemName: 'Newest'),
    FilterHolderInfo(itemName: 'Oldest'),
    FilterHolderInfo(itemName: 'Popularity'),
  ];
  List<FilterHolderInfo> _ratesState = [
    FilterHolderInfo(itemName: '1'),
    FilterHolderInfo(itemName: '2'),
    FilterHolderInfo(itemName: '3'),
    FilterHolderInfo(itemName: '4'),
    FilterHolderInfo(itemName: '5'),
  ];
  List<FilterHolderInfo> _categoriesState = [
    FilterHolderInfo(itemName: 'All'),
    FilterHolderInfo(itemName: 'Cereal'),
    FilterHolderInfo(itemName: 'Vegetables'),
    FilterHolderInfo(itemName: 'Dinner'),
    FilterHolderInfo(itemName: 'Chinese'),
    FilterHolderInfo(itemName: 'Local Dish'),
    FilterHolderInfo(itemName: 'Fruit'),
    FilterHolderInfo(itemName: 'Breakfast'),
    FilterHolderInfo(itemName: 'Spanish'),
    FilterHolderInfo(itemName: 'Lunch'),
  ];

  List<FilterHolderInfo> get timesState => _timesState;

  List<FilterHolderInfo> get ratesState => _ratesState;

  List<FilterHolderInfo> get categoriesState => _categoriesState;

  // itemName을 찾아서 isSelected를 업데이트하고 그 이외것들은 !isSelected로 업데이트
  void updateFilterSearchState(String kinds, String itemName, bool isSelected) {
    if (kinds == 'time') {
      _timesState = List<FilterHolderInfo>.from(timesState)
          .map(
            (item) => (item.itemName == itemName)
                ? item.copyWith(isSelected: isSelected)
                : item.copyWith(isSelected: false),
          ).toList();

      notifyListeners();
    } else if (kinds == 'rate') {
      _ratesState = List<FilterHolderInfo>.from(ratesState)
          .map(
            (item) => (item.itemName == itemName)
            ? item.copyWith(isSelected: isSelected)
            : item.copyWith(isSelected: false),
      ).toList();

      notifyListeners();
    } else if (kinds == 'category') {
      _categoriesState = List<FilterHolderInfo>.from(categoriesState)
          .map(
            (item) => (item.itemName == itemName)
            ? item.copyWith(isSelected: isSelected)
            : item.copyWith(isSelected: false),
      ).toList();

      notifyListeners();
    }
  }
}
