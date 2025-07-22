import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/routing/router.dart';
import 'package:flutter_recipe_app/presentation/screen/authentication/sign_in_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/authentication/sign_up_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/home/home_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/main_navigation/main_navigation_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/notifications/notifications_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/profile/profile_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/presentation/screen/splash/splash_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets('authentication routing', (tester) async {
      runApp(
        MaterialApp.router(
          routerConfig: createRouter(),
        ),
      );
      await tester.pumpAndSettle();

      // 1. SplashScreen에서 startCookingButtonKey를 가진 위젯을 누르면 SignInScreen으로 이동.
      await tester.tap(find.byKey(SplashScreen.startCookingButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(SignInScreen), findsOneWidget);

      // 2. SignInScreen에서 signUpButtonKey를 가진 위젯을 누르면 SignUpScreen으로 이동.
      await tester.tap(find.byKey(SignInScreen.signUpButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(SignUpScreen), findsOneWidget);

      // 3. SignUpScreen에서 signInButtonKey를 가진 위젯을 누르면 SignInScreen으로 이동.
      await tester.tap(find.byKey(SignUpScreen.signInButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(SignInScreen), findsOneWidget);
    });

    testWidgets('main navigation', (tester) async {
      runApp(
        MaterialApp.router(
          routerConfig: createRouter(),
        ),
      );
      await tester.pumpAndSettle();

      // 1. SignInScreen에서 signInButtonKey를 가진 위젯을 누르면 MainNavigationScreen으로 이동.
      await tester.tap(find.byKey(SplashScreen.startCookingButtonKey));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(SignInScreen.signInButtonKey));
      await tester.pumpAndSettle();
      expect(find.byType(MainNavigationScreen), findsOneWidget);

      // 2. MainNavigationScreen에서 savedRecipesTabKey를 가진 위젯을 누르면 SavedRecipesScreen이 화면에 보임.
      await tester.tap(find.byKey(MainNavigationScreen.savedRecipesTabKey));
      await tester.pumpAndSettle();
      expect(find.byType(SavedRecipesScreen), findsOneWidget);

      // 3. MainNavigationScreen에서 notificationsTabKey를 가진 위젯을 누르면 NotificationsScreen이 화면에 보임.
      await tester.tap(find.byKey(MainNavigationScreen.notificationsTabKey));
      await tester.pumpAndSettle();
      expect(find.byType(NotificationsScreen), findsOneWidget);

      // 4. MainNavigationScreen에서 profileTabKey를 가진 위젯을 누르면 ProfileScreen이 화면에 보임.
      await tester.tap(find.byKey(MainNavigationScreen.profileTabKey));
      await tester.pumpAndSettle();
      expect(find.byType(ProfileScreen), findsOneWidget);

      // 5. MainNavigationScreen에서 homeTabKey를 가진 위젯을 누르면 HomeScreen이 화면에 보임.
      await tester.tap(find.byKey(MainNavigationScreen.homeTabKey));
      await tester.pumpAndSettle();
      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });
}
