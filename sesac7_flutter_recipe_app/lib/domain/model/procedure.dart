import 'package:freezed_annotation/freezed_annotation.dart';

part 'procedure.freezed.dart';

@freezed
class Procedure with _$Procedure {
  @override
  final int recipeId;
  @override
  final int step;
  @override
  final String content;

  const Procedure({
    required this.recipeId,
    required this.step,
    required this.content,
  });
}