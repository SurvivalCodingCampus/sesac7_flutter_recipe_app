import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/domain/model/person.dart';

class Greeting extends StatelessWidget {
  final String name;
  final Person person;
  final void Function(Person person)? onTap;

  const Greeting({
    super.key,
    required this.name,
    required this.person,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call(person);
      },
      child: Column(
        children: [
          Text(
            key: const Key('value'),
            'Hello $name',
            style: TextStyle(fontSize: 40),
          ),
          Text(
            key: const Key('value2'),
            '${person.age}',
            style: TextStyle(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
