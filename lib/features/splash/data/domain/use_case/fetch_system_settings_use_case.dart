import 'package:flutter_recipe_app/core/system_settings/domain/repository/mock_system_settings_repository.dart';

class FetchSystemSettingsUseCase {
  final MockSystemSettingsRepository _systemSettingsRepository;

  const FetchSystemSettingsUseCase({
    required MockSystemSettingsRepository systemSettingsRepository,
  }) : _systemSettingsRepository = systemSettingsRepository;

  bool execute() {
    return _systemSettingsRepository.getSystemSettings();
  }
}
