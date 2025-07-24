import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure.freezed.dart';
part 'procedure.g.dart';

@freezed
abstract class Procedure with _$Procedure {
  const factory Procedure({
    required int id,
    required List<String> steps,
  }) = _Procedure;

  factory Procedure.fromJson(Map<String, Object?> json) =>
      _$ProcedureFromJson(json);
}
