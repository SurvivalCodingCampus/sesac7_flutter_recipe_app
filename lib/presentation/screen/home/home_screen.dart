import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/nav_bar/bottom_nav_bar.dart';
import 'package:flutter_svg/svg.dart';

import '../../../ui/app_colors.dart';
import '../../component/search/search_input.dart';
import 'home_view_model.dart';

class HomeScreen extends StatelessWidget {
  final HomeViewModel viewModel;
  const HomeScreen({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
             Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hello Jega',
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: AppColors.black),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'What are you cooking today?',
                            style: TextStyle(fontSize: 14, color: AppColors.gray3),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFFFD580),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Image.asset(
                          'lib/asset/profile_image.png',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    const Expanded(
                      child: SearchInput(
                        hint: 'Search recipes',
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      // onTap: viewModel.onPressed,
                      child: Material(
                        color: Colors.transparent, // 리플
                        borderRadius: BorderRadius.circular(12),
                        child: InkWell(
                          // onTap: viewModel.onPressed,
                          borderRadius: BorderRadius.circular(12),
                          splashColor: AppColors.primary100.withAlpha(100),
                          highlightColor: Colors.transparent,
                          child: Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: AppColors.primary100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Center(
                              child: SvgPicture.asset(
                                'lib/asset/ic_setting.svg',
                                width: 24,
                                height: 24,
                                colorFilter: const ColorFilter.mode(
                                  Colors.white,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          // BottomNavBar(
          //   body: null,
          //   selectedIndex: 0,
          //   onTap: (index) => viewModel.setIndex(index),
          // ),
        ],
      ),
    );
  }
}
