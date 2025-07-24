import 'package:flutter_recipe_app/data/repository/user_repository.dart';
import '../model/user.dart';

class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<User>> getUsers() async {
    await Future.delayed(const Duration(milliseconds: 100));
    return [
      User(
        id: 'user1',
        name: 'Laura Wilson',
        profileImageUrl: 'https://placehold.co/100x100/EFEFEF/31343C?text=LW',
        location: 'Lagos, Nigeria',
      ),
      User(
        id: 'user2',
        name: 'Maria Kelvin',
        profileImageUrl: 'https://placehold.co/100x100/EFEFEF/31343C?text=MK',
        location: 'Rome, Italy',
      ),
      User(
        id: 'user3',
        name: 'Healthy Foodie',
        profileImageUrl: 'https://placehold.co/100x100/EFEFEF/31343C?text=HF',
        location: 'California, USA',
      ),
    ];
  }
}
