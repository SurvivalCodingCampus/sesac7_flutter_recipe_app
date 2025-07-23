import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class TabsScreen extends StatelessWidget {
  final Widget body;
  final int currentIndex;
  final void Function(int index) onTap;

  const TabsScreen({
    super.key,
    required this.body,
    required this.onTap,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body,
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary100,
        unselectedItemColor: AppColors.gray4,
        selectedFontSize: 0,
        currentIndex: currentIndex,
        onTap: (int index) {
          onTap(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.alarm),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
        ],
      ),
    );
  }
}

// void main() {
//   // final Recipe recipe = Recipe(name: "Traditional spare ribs baked", imageUrl: "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg", chef: "Chef John", cookingTime: "20 min", rating: 4.0, onChangeFavorite: () {},);
//   runApp(
//     MaterialApp(
//       home: Scaffold(
//         body: TabsScreen(
//           body: Center(
//             child: Text('tabs'),
//           ),
//           onTap: (int index) {},
//           currentIndex: 1,
//         ),
//       ),
//     ),
//   );
// }
