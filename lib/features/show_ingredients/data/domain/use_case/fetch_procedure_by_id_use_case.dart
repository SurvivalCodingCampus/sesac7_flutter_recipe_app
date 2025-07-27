import '../../../../../data/procedure/domain/model/procedure.dart';
import '../../../../../data/procedure/domain/repository/procedure_repository.dart';

class FetchProcedureByIdUseCase {
  final ProcedureRepository _procedureRepository;

  const FetchProcedureByIdUseCase({
    required ProcedureRepository procedureRepository,
  }) : _procedureRepository = procedureRepository;

  Future<Procedure> execute(int id) async {
    final Procedure selectedProcedure = await _procedureRepository
        .getProcedureById(id);

    return selectedProcedure;
  }
}
