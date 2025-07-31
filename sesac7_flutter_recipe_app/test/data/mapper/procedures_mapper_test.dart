
import 'package:flutter_recipe_app/data/dto/procedure_dto.dart';
import 'package:flutter_recipe_app/data/dto/procedures_dto.dart';
import 'package:flutter_recipe_app/data/mapper/procedures_mapper.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/domain/model/procedures.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ProceduresMapper', () {
    test('ProceduresDto toModel should return correct Procedures model', () {
      final proceduresDto = ProceduresDto(
        procedures: [
          ProcedureDto(recipeId: 1, step: 1, content: 'Step 1'),
          ProcedureDto(recipeId: 1, step: 2, content: 'Step 2'),
        ],
      );

      final proceduresModel = proceduresDto.toModel();

      expect(proceduresModel.procedures.length, 2);
      expect(proceduresModel.procedures[0].content, 'Step 1');
      expect(proceduresModel.procedures[1].content, 'Step 2');
    });

    test('ProceduresModel toDto should return correct ProceduresDto', () {
      final proceduresModel = Procedures(
        procedures: [
          Procedure(recipeId: 1, step: 1, content: 'Step 1'),
          Procedure(recipeId: 1, step: 2, content: 'Step 2'),
        ],
      );

      final proceduresDto = proceduresModel.toDto();

      expect(proceduresDto.procedures?.length, 2);
      expect(proceduresDto.procedures?[0].content, 'Step 1');
      expect(proceduresDto.procedures?[1].content, 'Step 2');
    });

    test('ProceduresDto toModel should handle null procedures list', () {
      final proceduresDto = ProceduresDto(procedures: null);

      final proceduresModel = proceduresDto.toModel();

      expect(proceduresModel.procedures, isEmpty);
    });
  });
}
