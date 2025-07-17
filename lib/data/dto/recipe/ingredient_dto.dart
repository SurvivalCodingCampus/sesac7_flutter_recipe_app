class IngredientDto {
  final int? id; // Nullable로 변경
  final String? name; // Nullable로 변경
  final String? image; // Nullable로 변경

  IngredientDto({
    required this.id,
    required this.name,
    required this.image,
  });

  // JSON Map을 IngredientDto 객체로 변환하는 팩토리 생성자
  factory IngredientDto.fromJson(Map<String, dynamic> json) {
    return IngredientDto(
      id: json['id'] as int?, // int?로 캐스팅
      name: json['name'] as String?, // String?로 캐스팅
      image: json['image'] as String?, // String?로 캐스팅
    );
  }

  // (선택 사항) 객체를 JSON Map으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}