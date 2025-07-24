import 'package:flutter/material.dart';

import '../../ui/app_colors.dart';
import '../../ui/text_styles.dart';
import '../component/filter_button.dart';
import '../component/search_input_field.dart';

class HomeScreen extends StatelessWidget {
  final String greeting = 'Hello Jega';
  final String title = 'What are you cooking today?';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.fromLTRB(30, 0, 30, 0),
        child: Column(
          children: [
            SizedBox(height: 64),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(greeting, style: TextStyles.largeTextBold),
                    SizedBox(height: 5),
                    Text(
                      title,
                      style: TextStyles.smallerTextRegular.copyWith(
                        color: AppColors.gray3,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: AppColors.secondary40,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Icon(Icons.tag_faces_outlined),
                ),
              ],
            ),
            SizedBox(height: 30),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 40,
                    margin: EdgeInsets.only(right: 20.0),
                    child: SearchInputField(
                      placeHolder: 'Search recipe',
                      onValueChange: (value) {},
                    ),
                  ),
                ),
                FilterButton(onClick: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
