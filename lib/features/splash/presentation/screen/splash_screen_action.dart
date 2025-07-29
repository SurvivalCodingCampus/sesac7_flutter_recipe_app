import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_action.freezed.dart';

@freezed
sealed class SplashScreenAction with _$SplashScreenAction {
  const factory SplashScreenAction.touchStartCooking() = TouchStartCooking;
}
