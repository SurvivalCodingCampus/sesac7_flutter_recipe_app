class Ingredient {
  final String name;
  final String image;
  final String amount;

  Ingredient({
    required this.name,
    required this.image,
    required this.amount,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      name: json['name'],
      image: json['image'],
      amount: json['amount'] ?? '500g',
    );
  }
}
