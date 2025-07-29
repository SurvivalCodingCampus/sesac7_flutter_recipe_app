import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_event.freezed.dart';

@freezed
sealed class SplashScreenEvent with _$SplashScreenEvent {
  const factory SplashScreenEvent.showNetworkError(String message) = ShowNetworkError;
  const factory SplashScreenEvent.navigateToSignIn() = NavigateToSignIn;
}

