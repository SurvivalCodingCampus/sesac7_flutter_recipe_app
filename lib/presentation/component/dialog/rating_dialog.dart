import 'package:flutter/material.dart';

import '../../../ui/app_colors.dart';

class RatingDialog extends StatefulWidget {

  final String title;
  final String actionName;
  final void Function(int) onChange;

  RatingDialog({super.key, required this.title, required this.actionName, required this.onChange});

  @override
  State<RatingDialog> createState() => _RatingDialogState();
}

class _RatingDialogState extends State<RatingDialog> {

  int selectedRating = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),

      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      title: Text(
        widget.title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
        )
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              final starIndex = index + 1;

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedRating = starIndex;
                    });
                  },
                  child: Icon(
                    selectedRating >= starIndex ? Icons.star : Icons.star_border,
                    color: AppColors.rating,
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 5),
          TextButton(
            onPressed: selectedRating == 0 ? null : () {
              widget.onChange(selectedRating);
              Navigator.pop(context);
            },
            style: TextButton.styleFrom(
              foregroundColor: AppColors.white,
              backgroundColor: selectedRating == 0 ? AppColors.gray4 : AppColors.rating,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              widget.actionName,
              style: TextStyle(
                fontSize: 8,
              ),
            ),
          )
        ],
      ),
    );
  }
}