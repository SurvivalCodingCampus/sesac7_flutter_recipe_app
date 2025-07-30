import '../domain/repository/mock_system_settings_repository.dart';

class MockSystemSettingsRepositoryImpl implements MockSystemSettingsRepository {
  final bool _isFlightMode = true;

  @override
  bool getSystemSettings() {
    return _isFlightMode;
  }
}
