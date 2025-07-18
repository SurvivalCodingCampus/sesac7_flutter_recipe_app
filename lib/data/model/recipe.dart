class Recipe {
  final String name;
  final String imageUrl;
  final String chef;
  final String cookingTime;
  final double rating;
  final void Function() onChangeFavorite;

  const Recipe({
    required this.name,
    required this.imageUrl,
    required this.chef,
    required this.cookingTime,
    required this.rating,
    required this.onChangeFavorite,
  });
}