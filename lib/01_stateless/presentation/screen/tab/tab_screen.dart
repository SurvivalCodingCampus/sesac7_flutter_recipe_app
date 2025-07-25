import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/tab/tab_view_model.dart';

class TabScreen extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final void Function(int index) onTap;

  const TabScreen({
    super.key,
    required this.body,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = TabViewModel.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: body),
          BottomNavigationBar(
            fixedColor: viewModel.color,
            unselectedItemColor: Colors.grey,
            type: BottomNavigationBarType.fixed,
            currentIndex: currentIndex,
            onTap: (int index) {
              onTap(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bookmark),
                label: 'Saved Recipes',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.alarm),
                label: 'Alarm',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Person',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
