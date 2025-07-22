import 'person_repository.dart';

class PersonRepositoryImpl implements PersonRepository {
  @override
  Future<int> getAge() async {
    await Future.delayed(Duration(milliseconds: 500));
    return 10;
  }

  @override
  Future<String> getName() async {
    await Future.delayed(Duration(milliseconds: 500));
    return '홍길동';
  }
}