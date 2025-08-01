import 'package:flutter_recipe_app/domain/repository/user_repository.dart';

import '../../core/result.dart';
import '../model/user.dart';

class AddUserUseCase {
  final UserRepository _userRepository;

  const AddUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<Result<bool, String>> execute(User user) async {
    try {
      await _userRepository.insetUser(user);
      return Success(true);
    } catch (e) {
      return Error(e.toString());
    }
  }
}
