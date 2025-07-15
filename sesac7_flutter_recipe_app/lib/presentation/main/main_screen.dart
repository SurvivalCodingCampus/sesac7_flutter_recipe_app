import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/data/model/label.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tabs.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/input_filed.dart';

void main() {
  runApp(const MainScreen());
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  void _onTabChange(int selectedIndex) {
    setState(() {
      _selectedIndex = selectedIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Label> labels = [
      Label(labelTitle: 'Label1'),
      Label(labelTitle: 'Label2'),
    ];
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SmallButton(title: 'Button'),
              MediumButton(title: 'Button'),
              BigButton(title: 'Button'),
              InputFiled(
                label: 'Label',
                placeHolder: 'PlaceHolder',
                value: 'value',
                onValueChange: (value) {
                  print(value);
                },
              ),
              Tabs(
                labels: labels,
                selectedIndex: _selectedIndex,
                onValueChange: (selectedIndex) {
                  _onTabChange(selectedIndex);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
