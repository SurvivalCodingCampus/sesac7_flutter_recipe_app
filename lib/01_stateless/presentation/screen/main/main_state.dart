import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    @Default(0) int count,
    @Default(0) int score,
    @Default(0) int age,
    @Default('이름 없음') String name,
    @Default(false) bool isLoading,
  }) = _MainState;
}