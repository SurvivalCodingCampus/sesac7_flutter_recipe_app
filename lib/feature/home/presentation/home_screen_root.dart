import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/presentation/component/dialog/error_dialog.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_action.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_event.dart';
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
  StreamSubscription<HomeEvent>? _subscription;

  @override
  void initState() {
    super.initState();
    widget.viewModel.init();

    _subscription = widget.viewModel.eventStream.listen((event) {
      if (mounted) {
        switch (event) {
          case ShowErrorDialog():
            showErrorDialog(context, event.message);
        }
      }
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    widget.viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = widget.viewModel;

    return StreamBuilder(
      stream: viewModel.state,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        return HomeScreen(
          state: snapshot.data!,
          onAction: (HomeAction action) {
            viewModel.onAction(action);
          },
        );
      },
    );
  }
}
