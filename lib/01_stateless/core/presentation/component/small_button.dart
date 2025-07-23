import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';

class SmallButton extends StatefulWidget {
  final String text;
  final void Function() onClick;

  const SmallButton({
    super.key,
    required this.text,
    required this.onClick,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool isClicked = true;
  double get width => isClicked ? 174 : 300;

  @override
  Widget build(BuildContext context) {
    Colors.red;
    return GestureDetector(
      onTap: () {
        widget.onClick();

        setState(() {
          isClicked = !isClicked;
        });
      },
      child: AnimatedContainer(
        width: width,
        height: 37,
        decoration: BoxDecoration(
          color: isClicked ? AppColors.primary100 : Colors.red,
          borderRadius: BorderRadius.circular(10.0),
        ),
        duration: Duration(milliseconds: 500),
        child: Center(child: Text(widget.text)),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SmallButton(
          text: 'small button',
          onClick: () {
            print('클릭!!');
          },
        ),
      ),
    ),
  );
}
