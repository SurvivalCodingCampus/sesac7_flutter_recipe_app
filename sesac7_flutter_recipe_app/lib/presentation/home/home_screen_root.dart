import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/home/home_view_model.dart';

class HomeScreenRoot extends StatefulWidget {
  final HomeViewModel _homeViewModel;

  const HomeScreenRoot(
    HomeViewModel homeViewModel, {
    super.key,
  }) : _homeViewModel = homeViewModel;

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget._homeViewModel.loadCategories();
    widget._homeViewModel.fetchAllCategoryRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget._homeViewModel,
      builder: (context, value, child) {
        return HomeScreen(
          state: value,
          onAction: (action) {
            widget._homeViewModel.onAction(action);
          },
        );
      },
    );
  }
}
