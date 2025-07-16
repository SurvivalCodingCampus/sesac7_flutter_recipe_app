import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/components/buttons/big_button.dart';
import 'package:flutter_recipe_app/presentation/components/input_fields/default_input_field.dart';
import 'package:flutter_recipe_app/presentation/components/tabs/tabs.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Tabs(labels: ['Label1', 'Label2'], selectedIndex: 0, onValueChange: (int value) {print(value);}),
              SizedBox(height: 20),
              Tabs(labels: ['Label1', 'Label2', 'Label3'], selectedIndex: 1, onValueChange: (int value) {print(value);}),
            ],
          ),
        ),
      ),
    );
  }
}
