import 'package:flutter_recipe_app/domain/usecase/get_user_use_case.dart';

import '../../core/result.dart';
import '../model/user.dart';

class GetUserSavedRecipeIdsUseCase {
  final GetUserUseCase _userUseCase;

  const GetUserSavedRecipeIdsUseCase({
    required GetUserUseCase userUseCase,
  }) : _userUseCase = userUseCase;

  Future<Result<List<int>, void>> execute() async {
    final Result<User, void> userResult = await _userUseCase.execute();
    switch (userResult) {
      case Success<User, void>():
        return Success(userResult.data.savedRecipes);
      case Error<User, void>():
        return Success([]);
    }
  }
}
