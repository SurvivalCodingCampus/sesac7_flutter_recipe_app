import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/component/inputfield/input_field.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tab.dart';

import '../component/button/small_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigButton(
              text: 'Button',
              onClick: (value) {
              },
            ),
            SizedBox(height: 16),
            MediumButton(
              text: 'Button',
              onClick: (String text) {
              },
            ),
            SizedBox(height: 16),
            SmallButton(
              text: 'Button',
              onClick: (String text) {
              },
            ),
            SizedBox(height: 16),
            InputField(
              label: 'Label',
              placeHolder: 'Placeholder',
              value: 'Value',
              onValueChange: (String value) {
                print(value);
              },
            ),
            SizedBox(height: 16),
            Tap(
              labelList: ['Label1', 'Label2'],
              selectedIndex: 0,
              onValueChange: (int index) {
                print(index);
              },
            ),
          ],
        ),
      ),
    );
  }
}
