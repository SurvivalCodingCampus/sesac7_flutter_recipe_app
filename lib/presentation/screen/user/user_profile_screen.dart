import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Text(
          'This is the User Profile Screen',
          style: TextStyle(color: AppColor.Gray2, fontSize: 12),
        ),
      ),
    );
  }
}
