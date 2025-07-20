import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';

class MultiFilterSection extends StatelessWidget {
  final String title;
  final bool? isWrap;

  const MultiFilterSection({
    super.key,
    required this.title,
    this.isWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Time',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 10),
          isWrap == true
              ? Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    FilterButton(text: 'Breakfast', initialIsSelected: true),
                    FilterButton(text: 'Lunch'),
                    FilterButton(text: 'Breakfast', initialIsSelected: true),
                    FilterButton(text: 'Lunch'),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterButton(text: 'Breakfast', initialIsSelected: true),
                    FilterButton(text: 'Lunch'),
                    FilterButton(text: 'Breakfast', initialIsSelected: true),
                    FilterButton(text: 'Lunch'),
                  ],
                ),
        ],
      ),
    );
  }
}
