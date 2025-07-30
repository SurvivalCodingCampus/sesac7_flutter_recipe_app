import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_image_test_utils/image_test/image_test.dart';
import 'package:flutter_recipe_app/core/routing/router.dart';
import 'package:flutter_recipe_app/di/di.dart';
import 'package:flutter_recipe_app/feature/authentication/presentation/sign_in_screen.dart';
import 'package:flutter_recipe_app/feature/authentication/presentation/sign_up_screen.dart';
import 'package:flutter_recipe_app/feature/home/presentation/home_screen.dart';
import 'package:flutter_recipe_app/feature/main_navigation/presentation/main_navigation_screen.dart';
import 'package:flutter_recipe_app/feature/notifications/presentation/notifications_screen.dart';
import 'package:flutter_recipe_app/feature/profile/presentation/profile_screen.dart';
import 'package:flutter_recipe_app/feature/saved_recipes/presentation/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_event.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_screen.dart';
import 'package:flutter_recipe_app/feature/splash/presentation/splash_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mockito/mockito.dart';

// Mock ViewModel to control its behavior in tests
class MockSplashViewModel extends Mock implements SplashViewModel {
  @override
  Stream<SplashEvent> get eventStream => Stream.empty(); // Return an empty stream to prevent any UI events

  @override
  void init() {
    // Override init to do nothing, preventing airplane mode checks
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Sets up the DI container for testing, injecting mocks where needed.
  Future<void> setupTestDI() async {
    await getIt.reset(); // Ensure a clean slate
    diSetUp(); // Set up production dependencies first

    // Unregister the real SplashViewModel and register our mock version
    getIt.unregister<SplashViewModel>();
    getIt.registerSingleton<SplashViewModel>(MockSplashViewModel());
  }

  // Reset DI before each test to ensure test isolation
  setUp(() async {
    await setupTestDI();
  });

  group('end-to-end test', () {
    testWidgets('authentication routing flow is correct', (tester) async {
      // Mock network images to prevent real HTTP requests
      await provideMockedNetworkImages(() async {
        // Given: The app is started
        await tester.pumpWidget(
          MaterialApp.router(
            routerConfig: productionRouter(),
          ),
        );
        await tester.pumpAndSettle();

        // When: User taps "Start Cooking" on the splash screen
        await tester.tap(find.byKey(SplashScreen.startCookingButtonKey));
        await tester.pumpAndSettle();

        // Then: The app should navigate to the SignInScreen
        expect(find.byType(SignInScreen), findsOneWidget);

        // When: User taps the "Sign Up" button on the sign-in screen
        await tester.tap(find.byKey(SignInScreen.signUpButtonKey));
        await tester.pumpAndSettle();

        // Then: The app should navigate to the SignUpScreen
        expect(find.byType(SignUpScreen), findsOneWidget);

        // When: User taps the "Sign In" button on the sign-up screen
        final signInButtonFinder = find.byKey(SignUpScreen.signInButtonKey);
        await tester.ensureVisible(
          signInButtonFinder,
        ); // IMPORTANT: Ensure the button is on screen
        await tester.pumpAndSettle();
        await tester.tap(signInButtonFinder);
        await tester.pumpAndSettle();

        // Then: The app should navigate back to the SignInScreen
        expect(find.byType(SignInScreen), findsOneWidget);
      });
    });

    testWidgets('main navigation tabs work correctly', (tester) async {
      // Mock network images to prevent real HTTP requests
      await provideMockedNetworkImages(() async {
        // Given: The app is started
        await tester.pumpWidget(
          MaterialApp.router(
            routerConfig: productionRouter(),
          ),
        );
        await tester.pumpAndSettle();

        // When: User completes the initial navigation to the main screen
        await tester.tap(find.byKey(SplashScreen.startCookingButtonKey));
        await tester.pumpAndSettle();
        await tester.tap(find.byKey(SignInScreen.signInButtonKey));
        await tester.pumpAndSettle();

        // Then: The app should be on the MainNavigationScreen, showing the HomeScreen
        expect(find.byType(MainNavigationScreen), findsOneWidget);
        expect(find.byType(HomeScreen), findsOneWidget);

        // When: User taps the 'Saved Recipes' tab
        await tester.tap(find.byKey(MainNavigationScreen.savedRecipesTabKey));
        await tester.pumpAndSettle();

        // Then: The SavedRecipesScreen should be displayed
        expect(find.byType(SavedRecipesScreen), findsOneWidget);

        // When: User taps the 'Notifications' tab
        await tester.tap(find.byKey(MainNavigationScreen.notificationsTabKey));
        await tester.pumpAndSettle();

        // Then: The NotificationsScreen should be displayed
        expect(find.byType(NotificationsScreen), findsOneWidget);

        // When: User taps the 'Profile' tab
        await tester.tap(find.byKey(MainNavigationScreen.profileTabKey));
        await tester.pumpAndSettle();

        // Then: The ProfileScreen should be displayed
        expect(find.byType(ProfileScreen), findsOneWidget);

        // When: User taps the 'Home' tab
        await tester.tap(find.byKey(MainNavigationScreen.homeTabKey));
        await tester.pumpAndSettle();

        // Then: The HomeScreen should be displayed again
        expect(find.byType(HomeScreen), findsOneWidget);
      });
    });
  });
}
