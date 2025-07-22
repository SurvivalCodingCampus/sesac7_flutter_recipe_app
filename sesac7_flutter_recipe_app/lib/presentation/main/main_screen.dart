import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/tab/main_bottom_nav_bar.dart';

class MainScreen extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final void Function(int index) onTap;

  const MainScreen({
    super.key,
    required this.body,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: body),
            MainBottomNavBar(selectedIndex: currentIndex, onItemTapped: onTap),
          ],
        ),
      ),
    );
  }
}
