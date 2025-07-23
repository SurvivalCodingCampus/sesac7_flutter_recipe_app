import 'package:flutter_recipe_app/01_stateless/data/model/user.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/user_repository.dart';

class MockUserRepositoryImpl implements UserRepository {

  final _users = [
    User(
      id: 0,
      name: "Chef John",
      image: "https://placehold.co/100x100.jpg",
      address: "Pyongyang, North Korea"
    ),
    User(
        id: 1,
        name: "Mark Kelvin",
        image: "https://placehold.co/100x100.jpg",
        address: "Seoul, South Korea"
    ),
    User(
        id: 2,
        name: "Spicy Nelly",
        image: "https://placehold.co/100x100.jpg",
        address: "Los Angeles, California"
    ),
  ];
  @override
  Future<User> getUserById(int id) async {
    return _users[id];
  }

  @override
  Future<List<User>> getUsers() async {
    return List.unmodifiable(_users);
  }

}