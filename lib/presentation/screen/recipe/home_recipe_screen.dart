import 'package:flutter/material.dart';

class HomeRecipeScreen extends StatelessWidget {
  const HomeRecipeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Recipe Screen'),
      ),
      body: Center(
        child: Text('This is the Home Recipe Screen'),)
    );
  }
}
