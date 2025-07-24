import 'package:flutter_recipe_app/data/repository/user_repository.dart';
import '../../data/model/user.dart';

class GetUsersUseCase {
  final UserRepository _repository;

  GetUsersUseCase(this._repository);

  Future<List<User>> call() async {
    return await _repository.getUsers();
  }
}
