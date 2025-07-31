
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/component/button/sns_login_button.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SnsLoginButton', () {
    testWidgets('SnsLoginButton renders correctly with image', (tester) async {
      const String testImagePath = 'assets/facebook.png'; // Replace with a valid asset path

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SnsLoginButton(
              imageAssetPath: testImagePath,
            ),
          ),
        ),
      );

      expect(find.byType(Image), findsOneWidget);
      final Image imageWidget = tester.widget(find.byType(Image));
      expect((imageWidget.image as AssetImage).assetName, testImagePath);

      final Container container = tester.widget(find.byType(Container));
      final BoxDecoration decoration = container.decoration as BoxDecoration;
      expect(decoration.color, AppColors.white);
      expect(decoration.borderRadius, BorderRadius.circular(10.0));
      expect(decoration.boxShadow, isNotEmpty);
    });
  });
}
