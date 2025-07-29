import 'package:flutter_recipe_app/core/result.dart';

abstract interface class SystemSettingsRepository {
  Result<bool, String> getAirplaneModeActivate();
}