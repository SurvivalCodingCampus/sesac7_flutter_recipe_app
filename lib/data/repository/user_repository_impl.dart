import 'package:flutter_recipe_app/data/repository/user_repository.dart';
import '../model/user.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return [
      User(
        id: 'jega',
        name: 'Jega',
        profileImageUrl: 'https://placehold.co/50x50/FFCE80/000000?text=J',
        location: 'Seoul',
      ),
      User(
        id: 'james',
        name: 'James Milner',
        profileImageUrl: 'https://placehold.co/25x25/B2DFDB/000000?text=J',
        location: 'Liverpool',
      ),
      User(
        id: 'laura',
        name: 'Laura Wilson',
        profileImageUrl: 'https://placehold.co/25x25/B2DFDB/000000?text=L',
        location: 'London',
      ),
    ];
  }
}
