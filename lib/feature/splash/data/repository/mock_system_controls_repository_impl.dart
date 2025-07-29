import 'package:flutter_recipe_app/feature/splash/domain/repository/system_controls_repository.dart';

class MockSystemControlsRepositoryImpl implements SystemControlsRepository {
  @override
  Future<bool> isAirplaneMode() async {
    return true;
  }
}
