
import 'package:flutter_recipe_app/data/dto/procedure_dto.dart';
import 'package:flutter_recipe_app/data/mapper/procedure_mapper.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProcedureMapper', () {
    test('ProcedureDto toModel should return correct Procedure model', () {
      final procedureDto = ProcedureDto(
        recipeId: 1,
        step: 1,
        content: 'Test Content',
      );

      final procedureModel = procedureDto.toModel();

      expect(procedureModel.recipeId, 1);
      expect(procedureModel.step, 1);
      expect(procedureModel.content, 'Test Content');
    });

    test('ProcedureModel toDto should return correct ProcedureDto', () {
      final procedureModel = Procedure(
        recipeId: 1,
        step: 1,
        content: 'Test Content',
      );

      final procedureDto = procedureModel.toDto();

      expect(procedureDto.recipeId, 1);
      expect(procedureDto.step, 1);
      expect(procedureDto.content, 'Test Content');
    });
  });
}
