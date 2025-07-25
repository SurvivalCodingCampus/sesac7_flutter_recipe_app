import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_action.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_screen.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_view_model.dart';

class HomeScreenRoot extends StatefulWidget {
  final HomeViewModel viewModel;

  const HomeScreenRoot({
    super.key,
    required this.viewModel,
  });

  @override
  State<HomeScreenRoot> createState() => _HomeScreenRootState();
}

class _HomeScreenRootState extends State<HomeScreenRoot> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        return HomeScreen(
          state: viewModel.state,
          onAction: (HomeAction action) {
            viewModel.onAction(action);
          },
        );
      },
    );
  }
}
