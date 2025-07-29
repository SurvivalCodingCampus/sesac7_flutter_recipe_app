import 'package:flutter_recipe_app/core/utils/result.dart';
import 'package:flutter_recipe_app/feature/splash/domain/repository/system_controls_repository.dart';

class IsAirplaneModeUseCase {
  final SystemControlsRepository _systemControlsRepository;

  IsAirplaneModeUseCase({
    required SystemControlsRepository systemControlsRepository,
  }) : _systemControlsRepository = systemControlsRepository;

  Future<Result<bool, String>> execute() async {
    try {
      final isAirplaneMode = await _systemControlsRepository.isAirplaneMode();

      return Result.success(isAirplaneMode);
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}
