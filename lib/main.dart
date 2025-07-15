import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/0.study/stateless.dart';
import 'package:flutter_recipe_app/component/button/big_button.dart';
import 'package:flutter_recipe_app/component/button/medium_button.dart';
import 'package:flutter_recipe_app/component/button/small_button.dart';
import 'package:flutter_recipe_app/component/input/label.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigButton(),
              SizedBox(height: 10),
              MediumButton(),
              SizedBox(height: 10),
              SmallButton(),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
