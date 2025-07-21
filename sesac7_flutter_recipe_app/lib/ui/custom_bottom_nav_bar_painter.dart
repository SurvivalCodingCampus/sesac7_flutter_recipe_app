import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';

class CustomBottomNavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // 1. 그림자를 그릴 위쪽 테두리 경로 (열린 경로)ㄴ
    Path topEdgePath = Path()
      ..moveTo(0, 2) // y 좌표를 살짝 내려서 그림자가 잘 보이게 시작
      ..lineTo((size.width / 2) - 56, 2)
      ..quadraticBezierTo((size.width / 2) - 40, 2, (size.width / 2) - 32, 22)
      ..arcToPoint(
        Offset((size.width / 2) + 32, 20),
        radius: const Radius.circular(34),
        clockwise: false,
      )
      ..quadraticBezierTo((size.width / 2) + 40, 2, (size.width / 2) + 56, 2)
      ..lineTo(size.width, 2);

    // 2. 그림자 효과를 위한 Paint 객체 생성
    Paint shadowPaint = Paint()
      ..color = const Color(0xFF6C6C6C).withOpacity(0.15)
      ..style = PaintingStyle.stroke // 선 스타일
      ..strokeWidth = 4 // 그림자 두께
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8.0); // 흐림 효과

    // 3. 위쪽 테두리 경로에 그림자 효과를 적용하여 그리기
    canvas.drawPath(topEdgePath, shadowPaint);

    // 4. 실제 도형을 그릴 전체 경로 (닫힌 경로)
    Path fillPath = Path()
      ..moveTo(0, 0)
      ..lineTo((size.width / 2) - 56, 0)
      ..quadraticBezierTo((size.width / 2) - 40, 0, (size.width / 2) - 32, 20)
      ..arcToPoint(
        Offset((size.width / 2) + 32, 18),
        radius: const Radius.circular(34),
        clockwise: false,
      )
      ..quadraticBezierTo((size.width / 2) + 40, 0, (size.width / 2) + 56, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    // 5. 그림자 위에 흰색 도형 채우기
    Paint fillPaint = Paint()
      ..color = AppColors.white
      ..style = PaintingStyle.fill;
    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(CustomBottomNavBarPainter oldDelegate) {
    return false; // 다시 그릴 필요가 없으면 false
  }
}