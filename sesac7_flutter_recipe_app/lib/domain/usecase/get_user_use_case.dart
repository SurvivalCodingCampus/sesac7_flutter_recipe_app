import 'package:flutter_recipe_app/core/result.dart';
import 'package:flutter_recipe_app/domain/model/user.dart';
import 'package:flutter_recipe_app/domain/repository/user_repository.dart';

class GetUserUseCase {
  final UserRepository _userRepository;

  const GetUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<Result<User, void>> execute() async {
    return await _userRepository.getUser();
  }
}
