// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'step_Info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_StepInfo _$StepInfoFromJson(Map<String, dynamic> json) => _StepInfo(
  stepNumber: (json['stepNumber'] as num).toInt(),
  description: json['description'] as String,
);

Map<String, dynamic> _$StepInfoToJson(_StepInfo instance) => <String, dynamic>{
  'stepNumber': instance.stepNumber,
  'description': instance.description,
};
