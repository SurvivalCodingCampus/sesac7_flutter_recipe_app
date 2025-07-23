import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';

class NavBarScreen extends StatelessWidget {
  final Widget body;
  final int index;
  final void Function(int index) onTap;

  const NavBarScreen({super.key, required this.body, required this.index, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: body,
          ),
          Container(
            height: 120,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0.1),
                  offset: Offset(0, -4),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (index == 0)? () {} : () { onTap(0);},
                  child: SizedBox(
                    width: 48,
                    height: 48,
                    child: Center(
                      child: Icon(
                        Icons.home_outlined,
                        color: (index == 0)? AppColors.primary100 : AppColors.gray4,
                        size: 24,
                      )
                    )
                  ),
                ),
                GestureDetector(
                  onTap: (index == 1)? () {} : () { onTap(1);},
                  child: SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                          child: Icon(
                            Icons.bookmark_border_rounded,
                            color: (index == 1)? AppColors.primary100 : AppColors.gray4,
                            size: 24,
                          )
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (index == 2)? () {} : () { onTap(2);},
                  child: SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                          child: Icon(
                            Icons.notifications_outlined,
                            color: (index == 2)? AppColors.primary100 : AppColors.gray4,
                            size: 24,
                          )
                      )
                  ),
                ),
                GestureDetector(
                  onTap: (index == 3)? () {} : () { onTap(3);},
                  child: SizedBox(
                      width: 48,
                      height: 48,
                      child: Center(
                          child: Icon(
                            Icons.person_outlined,
                            color: (index == 3)? AppColors.primary100 : AppColors.gray4,
                            size: 24,
                          )
                      )
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
