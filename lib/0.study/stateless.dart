import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  final String name;
  final int age;
  final void Function() onTap;

  const Greeting({super.key, required this.name, required this.age, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            onTap();
          },
          child: Text('Hello, $name! You are $age years old.'),
        ),
      ),
    );
  }
}
