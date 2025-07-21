import 'package:flutter/material.dart';
import '../../../../ui/app_colors.dart';

enum SearchInputState {
  defaultState,
  focus,
  filled,
  filledFocus,
  disabled,
}

class SearchInputModel {
  final SearchInputState inputState;
  final String text;

  const SearchInputModel({
    required this.inputState,
    required this.text,
  });

  bool get isPlaceholder {
    switch (inputState) {
      case SearchInputState.disabled:
        return true;
      default:
        return text.isEmpty;
    }
  }

  String get displayText {
    switch (inputState) {
      case SearchInputState.disabled:
        return 'Disabled';
      default:
        return text.isNotEmpty ? text : 'Search recipes';
    }
  }

  Color get textColor {
    switch (inputState) {
      case SearchInputState.disabled:
        return AppColors.gray4;
      default:
        return text.isNotEmpty ? AppColors.black : AppColors.gray4;
    }
  }

  Color get background {
    switch (inputState) {
      case SearchInputState.disabled:
        return AppColors.gray2;
      default:
        return AppColors.white;
    }
  }

  Color get borderColor {
    switch (inputState) {
      case SearchInputState.focus:
      case SearchInputState.filledFocus:
        return AppColors.primary100;
      case SearchInputState.disabled:
        return Colors.transparent;
      default:
        return AppColors.gray3;
    }
  }
}
