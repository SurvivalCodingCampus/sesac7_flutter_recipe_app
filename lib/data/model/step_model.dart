import 'package:freezed_annotation/freezed_annotation.dart';

part 'step_model.freezed.dart';
part 'step_model.g.dart';

@freezed
abstract class StepModel with _$StepModel {
  const factory StepModel({
    required int stepNumber,
    required String description,
  }) = _StepModel;

  factory StepModel.fromJson(Map<String, Object?> json) => _$StepModelFromJson(json);
}
