import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/component/button/big_button.dart';
import 'package:flutter_recipe_app/component/button/medium_button.dart';
import 'package:flutter_recipe_app/component/button/small_button.dart';
import 'package:flutter_recipe_app/component/input/text_input.dart';
import 'package:flutter_recipe_app/component/tabs/custom_tab.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const tab1 = [
    {'id': 1, 'name': 'Label'},
    {'id': 2, 'name': 'Label'},
  ];

  static const tab2 = [
    {'id': 1, 'name': 'Label'},
    {'id': 2, 'name': 'Label'},
    {'id': 3, 'name': 'Label'},
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BigButton(
                  buttonText: 'Big Button',
                  onTap: () {
                    print('Big button');
                  },
                ),
                SizedBox(height: 5),
                MediumButton(
                  buttonText: 'Medium Button',
                  onTap: () {
                    print('Medium Button');
                  },
                ),
                SizedBox(height: 5),
                SmallButton(
                  buttonText: 'Small Button',
                  onTap: () {
                    print('Small Button');
                  },
                ),
                SizedBox(height: 10),
                TextInput(
                  labelText: 'label',
                  placeholderText: 'placeholder',
                  onChanged: (value) => print(value),
                ),
                SizedBox(height: 5),
                TextInput(
                  labelText: 'label',
                  placeholderText: 'placeholder',
                  isDisabled: true,
                  onChanged: (value) => print(value),
                ),

                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(color: AppColor.Primary40),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      CustomTab(
                        tabData: tab1,
                        selectedTabId: 1,
                        onTap: (id) => print('tab id : $id'),
                      ),
                      // 선택이 됐다고 가정한 탭 id
                      SizedBox(height: 10),
                      CustomTab(
                        tabData: tab1,
                        selectedTabId: 2,
                        onTap: (id) => print('tab id : $id'),
                      ),
                      // 선택이 됐다고 가정한 탭 id
                      SizedBox(height: 10),
                      CustomTab(
                        tabData: tab2,
                        selectedTabId: 1,
                        onTap: (id) => print('tab id : $id'),
                      ),
                      // 선택이 됐다고 가정한 탭 id
                      SizedBox(height: 10),
                      CustomTab(
                        tabData: tab2,
                        selectedTabId: 2,
                        onTap: (id) => print('tab id : $id'),
                      ),
                      // 선택이 됐다고 가정한 탭 id
                      SizedBox(height: 10),
                      CustomTab(
                        tabData: tab2,
                        selectedTabId: 3,
                        onTap: (id) => print('tab id : $id'),
                      ),
                      // 선택이 됐다고 가정한 탭 id
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
