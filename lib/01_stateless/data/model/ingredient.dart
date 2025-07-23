// freezed
class Ingredient {
  final String name;
  final String image;
  final int amount;

  const Ingredient({
    required this.name,
    required this.image,
    required this.amount,
  });

  Ingredient copyWith({
    String? name,
    String? image,
    int? amount,
  }) {
    return Ingredient(
      name: name ?? this.name,
      image: image ?? this.image,
      amount: amount ?? this.amount,
    );
  }

  @override
  String toString() {
    return 'Ingredient{name: $name, image: $image, amount: $amount}';
  }
}
