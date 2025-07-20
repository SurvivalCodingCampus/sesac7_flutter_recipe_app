import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/component/input_field/input_field.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tabs.dart';

import '../component/button/big_button.dart';
import '../component/button/small_button.dart';
import 'filter_search_bottom_sheet.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigButton(
                  text: 'Button',
                  onClick: () {
                    print('Big Button Clicked!');
                  },
                ),
                const SizedBox(height: 10),
                MediumButton(
                  text: 'Button',
                  onClick: () {
                    print('Medium Button Clicked!');
                  },
                ),
                const SizedBox(height: 10),
                SmallButton(
                  text: 'Button',
                  onClick: () {

                  },
                ),
                const SizedBox(height: 10),
                InputField(
                  label: 'label',
                  placeHolder: 'placeHolder',
                  value: '',
                  onValueChange: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 10),
                InputField(
                  label: 'label',
                  placeHolder: 'placeHolder',
                  value: '',
                  onValueChange: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 10),
                InputField(
                  label: 'label',
                  placeHolder: 'placeHolder',
                  value: '기본값',
                  onValueChange: (value) {
                    print(value);
                  },
                ),
                const SizedBox(height: 10),
                Tabs(
                  labels: ['확인', '취소'],
                  selectedIndex: 0,
                  onValueChanged: (index) {},
                ),
                const SizedBox(height: 10),
                Tabs(
                  labels: ['확인', '취소'],
                  selectedIndex: 1,
                  onValueChanged: (index) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}