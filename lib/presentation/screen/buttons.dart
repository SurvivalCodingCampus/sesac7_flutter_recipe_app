
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/rating_button.dart';
import 'package:flutter_recipe_app/presentation/component/button/big_button.dart';


class Buttons extends StatefulWidget{

  const Buttons({super.key});

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {

  bool isRatingSelected = false;
  bool isFilterSelected = false;
  bool isButtonDisabled = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingButton(
          text: '5',
          isSelected: isRatingSelected,
          onClick: () {
            setState(() {
              isRatingSelected = !isRatingSelected;
            });
          },
        ),
        const SizedBox(width: 10),
        FilterButton(
          text: '5',
          isSelected: isFilterSelected,
          onTap: () {
            setState(() {
              isFilterSelected = !isFilterSelected ;
            });
          },
        ),
        const SizedBox(width: 10),
        BigButton(
          text: 'button',
          isDisabled: false,
          onTap: () {
            setState(() {
              isButtonDisabled = !isButtonDisabled;
            });
          },
        ),
      ],
    );
  }

}