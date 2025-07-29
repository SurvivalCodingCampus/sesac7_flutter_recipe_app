import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/home/home_action.dart';
import 'package:flutter_recipe_app/presentation/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/home/home_view_model.dart';

class HomeScreenRoot extends StatefulWidget {
  final HomeViewModel _homeViewModel;
  final VoidCallback moveSearchRecipeScreen;

  const HomeScreenRoot(
    HomeViewModel homeViewModel, {
    super.key,
    required this.moveSearchRecipeScreen,
  }) : _homeViewModel = homeViewModel;

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  StreamSubscription? _bookmarkChangedSubscription;

  @override
  void initState() {
    super.initState();
    widget._homeViewModel.loadSavedRecipeIds();
    widget._homeViewModel.loadCategories();
    widget._homeViewModel.fetchAllCategoryRecipes();
    _bookmarkChangedSubscription = widget._homeViewModel.bookmarkChangedStream
        .listen((event) {
          widget._homeViewModel.loadSavedRecipeIds();
        });
  }

  @override
  void dispose() {
    _bookmarkChangedSubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget._homeViewModel,
      builder: (context, value, child) {
        return HomeScreen(
          state: value,
          onAction: (action) {
            if (action is MoveSearchRecipeScreen) {
              widget.moveSearchRecipeScreen();
            } else {
              widget._homeViewModel.onAction(action);
            }
          },
        );
      },
    );
  }
}
