
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../network/network_status.dart';

part 'splash_screen_state.freezed.dart';

@freezed
abstract class SplashScreenState with _$SplashScreenState {
  const factory SplashScreenState({
    @Default(false) bool isLoading,
    NetworkStatus? networkStatus,
  }) = _SplashScreenState;
}