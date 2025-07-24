import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_Info.freezed.dart';
part 'step_Info.g.dart';

@freezed
abstract class StepInfo with _$StepInfo {
  const factory StepInfo({
    required int stepNumber,
    required String description,
  }) = _StepInfo;

  factory StepInfo.fromJson(Map<String, Object?> json) => _$StepInfoFromJson(json);
}
