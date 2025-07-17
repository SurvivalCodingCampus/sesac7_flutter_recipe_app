import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class FilterButton extends StatefulWidget {
  final String? text;
  final bool initialIsSelected;
  final VoidCallback? onTap;

  const FilterButton({
    super.key,
    this.text = 'Text',
    this.initialIsSelected = false,
    this.onTap,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
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
        child: Text(
          '${widget.text}',
          style: TextStyle(
            color: _isSelected ? AppColor.White : AppColor.Primary100,
            fontSize: 11,
            height: 1.5,
          ),
        ),
      ),
    );
  }
}