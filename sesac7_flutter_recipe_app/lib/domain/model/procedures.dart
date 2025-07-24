import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedures.freezed.dart';

@freezed
class Procedures with _$Procedures {
  @override
  final List<Procedure> procedures;

  const Procedures({
    required this.procedures,
  });
}
