import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/presentation/component/input/input_field.dart';
import 'package:flutter_recipe_app/presentation/component/other/tabs.dart';

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
        body: Column(
          spacing: 20,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Tabs(
              labels: [
                'Tab 1',
                'Tab 2',
              ],
              selectedIndex: 0,
              onValueChange: (index) {
                print('Selected tab index: $index');
              },
            ),
            InputField(
              label: 'Label',
              placeholder: 'placeholder',
              value: 'Initial Value',
              onValueChange: (value) {
                print(value);
              },
            ),
            BigButton(
              text: 'Button',
              onClick: () {
                print('big button');
              },
            ),
            MediumButton(
              text: 'Button',
              onClick: () {
                print('medium button');
              },
            ),

            SmallButton(
              text: 'Button',
              onClick: () {
                print('small button');
              },
            ),
          ],
        ),
      ),
    );
  }
}
