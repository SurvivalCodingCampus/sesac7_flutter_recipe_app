class BookmarkDto {
  int? id;
  String recipeId;

  BookmarkDto({
    this.id,
    required this.recipeId,
  });

  factory BookmarkDto.fromJson(Map<String, dynamic> json) {
    return BookmarkDto(
      id: json['id'],
      recipeId: json['recipeId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'recipeId': recipeId,
    };
  }
}
