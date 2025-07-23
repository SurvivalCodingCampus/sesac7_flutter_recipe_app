import 'package:flutter/cupertino.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class SmallButton extends StatefulWidget {
  final String title;
  final VoidCallback onClick;

  const SmallButton({
    super.key,
    required this.title,
    required this.onClick,
  });

  @override
  State<SmallButton> createState() => _SmallButtonState();
}

class _SmallButtonState extends State<SmallButton> {
  bool _isTapDown = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapDown = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapDown = false;
        });
      },
      onTapCancel: () {
        setState(() {
          _isTapDown = false;
        });
      },
      onTap: widget.onClick,
      child: Container(
        height: 37.0,
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        decoration: BoxDecoration(
          color: _isTapDown? AppColors.gray4 : AppColors.primary100,
          borderRadius: BorderRadius.circular(10.0),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.title,
          style: TextStyles.smallButtonTitle,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
