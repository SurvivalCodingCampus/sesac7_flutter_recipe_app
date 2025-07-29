import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/system_settings_repository.dart';

class MockSystemSettingsRepositoryImpl implements SystemSettingsRepository {
  @override
  Result<bool, String> getAirplaneModeActivate() {
    return Success(false);
  }
}