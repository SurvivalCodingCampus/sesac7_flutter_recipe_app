import 'package:freezed_annotation/freezed_annotation.dart';

part "home_event.freezed.dart";

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.openErrorDialog(String message) = OpenErrorDialog;
}
