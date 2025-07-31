
import 'package:flutter_recipe_app/core/enum/network_error.dart';
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/procedure.dart';
import 'package:flutter_recipe_app/domain/usecase/get_procedures_by_recipe_id_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import '../../mock/mock_procedure_repository.dart';

void main() {
  group('GetProceduresByRecipeIdUseCase', () {
    test('should return filtered procedures when repository returns success', () async {
      final procedureList = [
        Procedure(recipeId: 1, step: 1, content: 'step 1'),
        Procedure(recipeId: 2, step: 1, content: 'step 2'),
        Procedure(recipeId: 1, step: 2, content: 'step 3'),
      ];
      final mockRepository = MockProcedureRepository(
        getProceduresResult: Success<List<Procedure>, NetworkError>(procedureList),
      );
      final useCase = GetProceduresByRecipeIdUseCase(procedureRepository: mockRepository);

      final result = await useCase.execute(1);

      expect(result, isA<Success>());
      expect((result as Success).data.length, 2);
      expect((result as Success).data[0].recipeId, 1);
      expect((result as Success).data[1].recipeId, 1);
    });

    test('should return empty list when no matching procedures are found', () async {
      final procedureList = [
        Procedure(recipeId: 2, step: 1, content: 'step 1'),
      ];
      final mockRepository = MockProcedureRepository(
        getProceduresResult: Success<List<Procedure>, NetworkError>(procedureList),
      );
      final useCase = GetProceduresByRecipeIdUseCase(procedureRepository: mockRepository);

      final result = await useCase.execute(99);

      expect(result, isA<Success>());
      expect((result as Success).data, isEmpty);
    });

    test('should return error when repository returns error', () async {
      final mockRepository = MockProcedureRepository(
        getProceduresResult: Error(NetworkError.unKnown),
      );
      final useCase = GetProceduresByRecipeIdUseCase(procedureRepository: mockRepository);

      final result = await useCase.execute(1);

      expect(result, isA<Error>());
      expect((result as Error).error, NetworkError.unKnown);
    });
  });
}
