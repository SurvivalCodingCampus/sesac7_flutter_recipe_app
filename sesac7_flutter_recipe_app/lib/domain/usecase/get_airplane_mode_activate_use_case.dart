import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/system_settings_repository.dart';

class GetAirplaneModeActivateUseCase {
  final SystemSettingsRepository _systemSettingsRepository;

  GetAirplaneModeActivateUseCase({
    required SystemSettingsRepository systemSettingsRepository,
  }) : _systemSettingsRepository = systemSettingsRepository;

  Result<bool, String> execute() {
    final Result<bool, String> result = _systemSettingsRepository.getAirplaneModeActivate();
    switch(result) {
      case Success():
        return Success(result.data);
      case Error():
        return Error(result.error);
    }
  }
}