import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final Widget body;
  final int selectedIndex;
  final void Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.body,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: body,
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => onTap(0),
              child: Icon(
                Icons.home,
                color: selectedIndex == 0 ? Colors.green : Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () => onTap(1),
              child: Icon(
                Icons.bookmark,
                color: selectedIndex == 1 ? Colors.green : Colors.grey,
              ),
            ),
            const SizedBox(width: 40),
            GestureDetector(
              onTap: () => onTap(2),
              child: Icon(
                Icons.notifications,
                color: selectedIndex == 2 ? Colors.green : Colors.grey,
              ),
            ),
            GestureDetector(
              onTap: () => onTap(3),
              child: Icon(
                Icons.person,
                color: selectedIndex == 3 ? Colors.green : Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
