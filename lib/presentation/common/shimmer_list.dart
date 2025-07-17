import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/common/shimmer_box.dart';

class ShimmerList extends StatelessWidget {
  const ShimmerList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: 12),
      itemBuilder: (_, __) => const ShimmerBox(
        width: double.infinity,
        height: 150,
      ),
    );
  }
}
