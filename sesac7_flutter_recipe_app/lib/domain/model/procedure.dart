import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure.freezed.dart';

@freezed
class Procedure with _$Procedure {
  @override
  final int step;
  @override
  final String description;

  const Procedure({
    required this.step,
    required this.description,
  });
}