import '../model/procedure.dart';

abstract interface class ProcedureRepository {
  Future<List<Procedure>> getAllProcedures();

  Future<Procedure> getProcedureById(int id);
}
