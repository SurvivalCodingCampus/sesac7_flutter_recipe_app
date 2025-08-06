import 'package:flutter_recipe_app/domain/repository/user_repository.dart';

import '../../core/result.dart';
import '../model/user.dart';

class RemoveSavedRecipeIdUseCase {
  final UserRepository _userRepository;

  const RemoveSavedRecipeIdUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  Future<Result<void, void>> execute(int recipeId) async {
    final Result<User, void> userResult = await _userRepository.getUser();
    switch (userResult) {
      case Success<User, void>():
        final User user = userResult.data;
        final List<int> savedRecipeIds = user.savedRecipes;
        savedRecipeIds.remove(recipeId);
        return await _userRepository.updateUser(
          user.copyWith(savedRecipes: savedRecipeIds),
        );
      case Error<User, void>():
        return Result.success(null);
    }
  }
}
