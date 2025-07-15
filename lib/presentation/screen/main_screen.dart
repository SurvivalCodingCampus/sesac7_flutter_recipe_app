import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/medium_button.dart';

import '../component/button/small_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SmallButton(
              text: 'Button',
              onClick: (String text) {
                print(text);
              },
            ),
            SizedBox(height: 16),
            MediumButton(
              text: 'Button',
              onClick: (String text) {
                print(text);
              },
            ),
          ],
        ),
      ),
    );
  }
}
