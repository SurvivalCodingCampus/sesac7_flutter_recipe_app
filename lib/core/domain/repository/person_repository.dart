abstract interface class PersonRepository {
  Future<int> getAge();

  Future<String> getName();
}