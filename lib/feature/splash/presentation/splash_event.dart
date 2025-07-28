import 'package:freezed_annotation/freezed_annotation.dart';

part "splash_event.freezed.dart";

@freezed
sealed class SplashEvent with _$SplashEvent {
  const factory SplashEvent.showAirplaneModeError() = ShowAirplaneModeError;
  const factory SplashEvent.showErrorDialog(String message) = ShowErrorDialog;
}
