import 'package:flutter/material.dart';

class SearchInputField extends StatelessWidget {
  final void Function(String) onValueChange;

  const SearchInputField({super.key, required this.onValueChange});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                onChanged: onValueChange,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search Recipes',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
