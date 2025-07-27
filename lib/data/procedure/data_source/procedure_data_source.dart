import '../dto/procedure_dto.dart';

abstract interface class ProcedureDataSource {
  Future<List<ProcedureDto>> getAllProcedures();
}
