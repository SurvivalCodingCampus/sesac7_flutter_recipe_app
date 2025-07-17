import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class IngredientItem extends StatelessWidget {
  final String? imagePath;
  final String? name;
  final int? amount;
  final VoidCallback? onTap;

  const IngredientItem({
    super.key,
    this.imagePath = 'assets/images/tomato.png',
    this.name = 'Tomatos',
    this.amount = 500,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
        decoration: BoxDecoration(
          color: AppColor.Gray4,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: AppColor.White,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.asset(
                    imagePath!,
                    width: 40,
                    height: 40,
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.error);
                    },
                  ),
                ),
                SizedBox(width: 16),
                Text('$name', style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
            Text('${amount}g', style: TextStyle(color: AppColor.Gray3)),
          ],
        ),
      ),
    );
  }
}
