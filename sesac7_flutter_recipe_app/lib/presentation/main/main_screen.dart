import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/enum/rating_type.dart';
import 'package:flutter_recipe_app/data/model/label.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/presentation/component/dialog/rating_dialog.dart';
import 'package:flutter_recipe_app/presentation/component/tab/tabs.dart';
import 'package:flutter_recipe_app/presentation/component/text_field/input_filed.dart';

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
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  bool _ratingSelected = false;
  bool _filterSelected = false;
  int _ratingDialogRating = 0;

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
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RatingDialog(
              dialogTitle: 'Rate recipe',
              dialogButtonTitle: 'Send',
              currentRatingType: _ratingDialogRating.intToRatingType(),
              onChange: (rating) {
                setState(() {
                  _ratingDialogRating = rating;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RatingButton(
                  ratingButtonTitle: RatingType.gradeFive.value,
                  isSelected: _ratingSelected,
                  onValueChange: (isSelected) {
                    setState(() {
                      _ratingSelected = isSelected;
                    });
                  },
                ),
                FilterButton(
                  filterTitle: 'Text',
                  isSelected: _filterSelected,
                  onValueChange: (isSelected) {
                    setState(() {
                      _filterSelected = isSelected;
                    });
                  },
                ),
              ],
            ),
            SmallButton(
              title: 'Button',
              onClick: () {},
            ),
            MediumButton(
              title: 'Button',
              onClick: () {},
            ),
            BigButton(
              title: 'Button',
              onClick: () {},
            ),
            InputFiled(
              label: 'Label',
              placeHolder: 'PlaceHolder',
              value: 'value',
              onValueChange: (value) {},
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
    );
  }
}
