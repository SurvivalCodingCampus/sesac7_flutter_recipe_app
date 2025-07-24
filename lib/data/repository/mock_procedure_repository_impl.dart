import 'package:flutter_recipe_app/data/data_source/procedure_data_source.dart';
import 'package:flutter_recipe_app/data/mapper/procedure_mapper.dart';
import 'package:flutter_recipe_app/data/repository/procedure_repository.dart';

import '../data_source/mock_procedure_data_source_impl.dart';
import '../model/procedure.dart';

class MockProcedureRepositoryImpl implements ProcedureRepository {
  final ProcedureDataSource _procedureDataSource;

  const MockProcedureRepositoryImpl({
    required ProcedureDataSource procedureDataSource,
  }) : _procedureDataSource = procedureDataSource;

  @override
  Future<List<Procedure>> getAllProcedures() async {
    final result = await _procedureDataSource.getAllProcedures();

    return result.map((e) => e.toModel()).toList();
  }

  @override
  Future<Procedure> getProcedureById(int id) async {
    final result = await _procedureDataSource.getAllProcedures();

    return result.firstWhere((e) => e.id == id).toModel();
  }
}

void main() async {
  final ProcedureRepository procedureRepository = MockProcedureRepositoryImpl(
    procedureDataSource: MockProcedureDataSourceImpl(),
  );

  final result = await procedureRepository.getProcedureById(4);

  print(result);
}
