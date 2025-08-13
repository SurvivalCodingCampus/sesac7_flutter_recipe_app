import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/inputfield/search_input_field.dart';

import '../component/button/filter_button.dart';

class InputField extends StatelessWidget {
  final String label;
  final String placeHolder;

  const InputField({
    super.key,
    required this.label,
    required this.placeHolder,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              const Icon(Icons.search, color: Colors.grey),
              const SizedBox(width: 10),
              Expanded(
                child: SearchInputField(onValueChange: (String value) {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // bottomNavigationBar의 현재 인덱스를 저장하기 위한 상태 변수
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello Jega',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'What are you cooking today?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  // 프로필 사진/아바타
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF7E2CE),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        '^.^',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Row(
                children: [
                  SearchInputField(onValueChange: (String value) {}),
                  const SizedBox(width: 5),
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: FilterButton(
                      text: '三',
                      isSelected: false,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Theme(
      //   data: ThemeData(
      //     splashColor: Colors.transparent,
      //     highlightColor: Colors.transparent,
      //     hoverColor: Colors.transparent,
      //   ),
      //   child: BottomNavigationBar(
      //     onTap: (int index) {
      //       setState(() {
      //         _selectedIndex = index;
      //       });
      //     },
      //     selectedItemColor: Colors.green,
      //     unselectedItemColor: Colors.grey,
      //     type : BottomNavigationBarType.fixed,
      //     items: const [
      //       BottomNavigationBarItem(
      //         backgroundColor: Colors.white,
      //         icon: Icon(Icons.home),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.bookmark),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.alarm),
      //         label: '',
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(Icons.person),
      //         label: '',
      //       ),
      //     ],
      //     currentIndex: _selectedIndex,
      //   ),
      // ),
    );
  }
}