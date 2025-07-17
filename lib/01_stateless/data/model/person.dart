// freezed
class Person {
  final String name;
  final int age;

  const Person({
    required this.name,
    required this.age,
  });

  Person copyWith({
    String? name,
    int? age,
  }) {
    return Person(
      name: name ?? this.name,
      age: age ?? this.age,
    );
  }

  @override
  String toString() {
    return 'Person{name: $name, age: $age}';
  }
}
