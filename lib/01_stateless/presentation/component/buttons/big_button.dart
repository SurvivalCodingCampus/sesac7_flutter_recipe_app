import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../ui/app_colors.dart';
import '../../../ui/text_styles.dart';

class _BigButtonState extends State<BigButton> {
  bool isEnabled = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onClick,
      onTapDown: (details) {
        setState(() {
          isEnabled = false;
        });
      },
      onTapUp: (details) {
        setState(() {
          isEnabled = true;
        });
      },
      onTapCancel: () {
        setState(() {
          isEnabled = true;
        });
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: isEnabled? AppColors.primary100 : AppColors.gray4,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Row(
            children: [
              const Spacer(),
              SizedBox(
                width: 114,
                height: 24,
                child: Center(
                    child: Text(
                        widget.text,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyles.normalTextBold,
                            color: Colors.white
                        )
                    )
                ),
              ),
              const SizedBox(
                width: 11,
              ),
              const Icon(
                  Icons.arrow_forward,
                  size: 20,
                  color: Colors.white
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }


}

class BigButton extends StatefulWidget {
  final String text;
  final void Function() onClick;

  const BigButton({super.key, required this.text, required this.onClick});

  @override
  State<StatefulWidget> createState() => _BigButtonState();
}
