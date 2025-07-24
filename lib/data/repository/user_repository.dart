import '../../data/model/user.dart';

abstract class UserRepository {
  Future<List<User>> getUsers();
}
