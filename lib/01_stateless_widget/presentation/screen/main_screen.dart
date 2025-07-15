import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/small_button.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/big_button.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/default_input_field.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/filled_input_field.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/focused_input_field.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/left_selected_tabs.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/medium_button.dart';
import 'package:flutter_recipe_app/01_stateless_widget/presentation/component/right_selected_tabs.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigButton(text: 'Button', onClick: () { print('큰 버튼 클릭되었어요'); }),
            SizedBox(height: 20),
            MediumButton(text: 'Button', onClick: () { print('중간 버튼 클릭되었어요'); }),
            SizedBox(height: 20),
            SmallButton(text: 'Button', onClick: () { print('작은 버튼 클릭되었어요'); },),
            SizedBox(height: 20),
            DefaultInputField(label: 'Label', placeHolder: 'PlaceHolder', value: 'PlaceHolder', onValueChange: (String value) { print(value); }),
            SizedBox(height: 20),
            FocusedInputField(label: 'Label', placeHolder: 'PlaceHolder', value: 'PlaceHolder', onValueChange: (String value) { print(value); }),
            SizedBox(height: 20),
            FilledInputField(label: 'Label', placeHolder: 'PlaceHolder', value: 'PlaceHolder', onValueChange: (String value) { print(value); }),
            SizedBox(height: 20),
            LeftSelectedTabs(listOfLables: ['label1', 'label2'], selectedIndex: 0, onValueChange: (int value) { print('selected: $value'); },),
            SizedBox(height: 20),
            RightSelectedTabs(listOfLables: ['label1', 'label2'], selectedIndex: 0, onValueChange: (int value) { print('selected: $value'); },),
          ],
        ),
      ),
    );
  }
}
