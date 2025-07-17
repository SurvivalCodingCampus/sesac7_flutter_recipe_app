// freezed
class Ingredient {
  final String name;
  final String image;

  const Ingredient({
    required this.name,
    required this.image
  });

  Ingredient copyWith({
    String? name,
    String? image,
  }) {
    return Ingredient(
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  @override
  String toString() {
    return 'Person{name: $name, image: $image}';
  }
}
