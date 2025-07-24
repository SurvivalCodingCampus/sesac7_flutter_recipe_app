import 'package:flutter/material.dart';

import '../component/big_button.dart';
import '../component/default_input_field.dart';
import '../component/filled_input_field.dart';
import '../component/focused_input_field.dart';
import '../component/left_selected_tabs.dart';
import '../component/left_selected_triple_tabs.dart';
import '../component/medium_button.dart';
import '../component/middle_selected_triple_tabs.dart';
import '../component/right_selected_tabs.dart';
import '../component/right_selected_triple_tabs.dart';
import '../component/small_button.dart';

class StatelessWidgetStudyScreen extends StatelessWidget {
  const StatelessWidgetStudyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 60),
              BigButton(
                text: 'Button',
                onClick: () {
                  print('큰 버튼 클릭되었어요');
                },
              ),
              SizedBox(height: 13),
              MediumButton(
                text: 'Button',
                onClick: () {
                  print('중간 버튼 클릭되었어요');
                },
              ),
              SizedBox(height: 13),
              SmallButton(
                text: 'Button',
                onClick: () {
                  print('작은 버튼 클릭되었어요');
                },
              ),
              SizedBox(height: 13),
              DefaultInputField(
                label: 'Label',
                placeHolder: 'PlaceHolder',
                onValueChange: (String value) {
                  print(value);
                },
              ),
              SizedBox(height: 13),
              FocusedInputField(
                label: 'Label',
                placeHolder: 'PlaceHolder',
                value: 'PlaceHolder',
                onValueChange: (String value) {
                  print(value);
                },
              ),
              SizedBox(height: 13),
              FilledInputField(
                label: 'Label',
                placeHolder: 'PlaceHolder',
                value: 'PlaceHolder',
                onValueChange: (String value) {
                  print(value);
                },
              ),
              SizedBox(height: 13),
              LeftSelectedTabs(
                listOfLables: ['label1', 'label2'],
                selectedIndex: 0,
                onValueChange: (int value) {
                  print('selected: $value');
                },
              ),
              SizedBox(height: 13),
              RightSelectedTabs(
                listOfLables: ['label1', 'label2'],
                selectedIndex: 0,
                onValueChange: (int value) {
                  print('selected: $value');
                },
              ),
              SizedBox(height: 13),
              LeftSelectedTripleTabs(
                listOfLables: ['label1', 'label2', 'label3'],
                selectedIndex: 0,
                onValueChange: (int value) {
                  print('selected: $value');
                },
              ),
              SizedBox(height: 13),
              MiddleSelectedTripleTabs(
                listOfLables: ['label1', 'label2', 'label3'],
                selectedIndex: 0,
                onValueChange: (int value) {
                  print('selected: $value');
                },
              ),
              SizedBox(height: 13),
              RightSelectedTripleTabs(
                listOfLables: ['label1', 'label2', 'label3'],
                selectedIndex: 0,
                onValueChange: (int value) {
                  print('selected: $value');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
