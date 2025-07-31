
import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/repository/system_settings_repository.dart';

class MockSystemSettingsRepository implements SystemSettingsRepository {
  final Result<bool, String> _getAirplaneModeActivateResult;

  MockSystemSettingsRepository({
    required Result<bool, String> getAirplaneModeActivateResult,
  })
      : _getAirplaneModeActivateResult = getAirplaneModeActivateResult;

  @override
  Result<bool, String> getAirplaneModeActivate() {
    return _getAirplaneModeActivateResult;
  }
}
