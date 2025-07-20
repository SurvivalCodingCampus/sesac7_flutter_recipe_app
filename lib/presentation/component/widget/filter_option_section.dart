import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/presentation/component/button/filter_button.dart';

class FilterOptionSection extends StatelessWidget {
  const FilterOptionSection({super.key});

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
          Wrap(
            alignment: WrapAlignment.start,
            spacing: 10,
            runSpacing: 10,
            children: [
              FilterButton(text: 'Breakfast', initialIsSelected: true),
              FilterButton(text: 'Lunch'),
            ],
          ),
        ],
      ),
    );
  }
}
