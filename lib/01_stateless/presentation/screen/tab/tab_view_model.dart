import 'package:flutter/material.dart';

class TabViewModel extends InheritedWidget {
  const TabViewModel({
    super.key,
    required super.child,
    required this.color,
  });

  final Color color;

  static TabViewModel of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TabViewModel>()!;
  }

  @override
  bool updateShouldNotify(TabViewModel oldWidget) {
    return color != oldWidget.color;
  }
}
