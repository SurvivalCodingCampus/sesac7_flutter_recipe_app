import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_screen_state.freezed.dart';

@freezed
abstract class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState({
    @Default(false) bool isFlightMode,
    @Default(false) bool isLoading,
  }) = _SplashScreenState;
}
