import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class RatingButton extends StatefulWidget {
  final int? rating;
  final bool initialIsSelected;
  final VoidCallback? onTap;

  const RatingButton({
    super.key,
    this.rating = 0,
    this.initialIsSelected = false,
    this.onTap,
  });

  @override
  State<RatingButton> createState() => _RatingButtonState();
}

class _RatingButtonState extends State<RatingButton> {
  late bool _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = widget.initialIsSelected;
  }

  void _tapHandler() {
    setState(() {
      _isSelected = !_isSelected;
    });

    if (widget.onTap != null) {
      widget.onTap!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _tapHandler,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5.5, horizontal: 10),
        decoration: BoxDecoration(
          color: _isSelected ? AppColor.Primary100 : AppColor.White,
          border: Border.all(color: AppColor.Primary100, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.rating}',
              style: TextStyle(
                color: _isSelected ? AppColor.White : AppColor.Primary100,
                fontSize: 11,
                height: 1.5,
              ),
            ),
            const SizedBox(width: 3),
            Icon(
              Icons.star,
              color: _isSelected ? AppColor.White : AppColor.Primary100,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }
}