import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class RatingButton extends StatelessWidget {
  final int? rating;
  final bool isSelect;

  const RatingButton({super.key, this.rating = 0, this.isSelect = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5.5, horizontal: 10),
      decoration: BoxDecoration(
        color: isSelect ? AppColor.Primary100 : AppColor.White,
        border: Border.all(color: AppColor.Primary100, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$rating',
            style: TextStyle(
              color: isSelect ? AppColor.White : AppColor.Primary100,
              fontSize: 11,
              height: 1.5,
            ),
          ),
          SizedBox(width: 3),
          Icon(
            Icons.star,
            color: isSelect ? AppColor.White : AppColor.Primary100,
            size: 18,
          ),
        ],
      ),
    );
  }
}
