import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SmallButton extends StatelessWidget {
  final String title;
  final Function(void)? onClick;

  const SmallButton({
    super.key,
    required this.title,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174.0,
      height: 37.0,
      decoration: BoxDecoration(
        color: AppColors.primary100,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: GestureDetector(
        onTap: () {
          onClick;
        },
        child: Center(
          child: Text(
            title,
            style: TextStyles.smallButtonTitle,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
