import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/routes.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: Routes.home,
  routes: [
    GoRoute(
      path: Routes.home,
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Text('Home'),
          ),
        );
      },
    ),
  ],
);
