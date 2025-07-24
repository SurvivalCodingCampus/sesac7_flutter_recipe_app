class ImageModel {
  final int id;
  final String tags;
  final String thumbnailUrl; // UI에 표시될 대표 이미지 URL
  final String fullImageUrl; // 상세 보기 시 사용될 고해상도 이미지 URL
  final String photographerName;
  final int likesCount;
  final int downloadCount;

  ImageModel({
    required this.id,
    required this.tags,
    required this.thumbnailUrl,
    required this.fullImageUrl,
    required this.photographerName,
    required this.likesCount,
    required this.downloadCount,
  });

  // 이 외에 UI 로직에 필요한 추가 필드나 메서드를 여기에 정의할 수 있습니다.
  String get formattedLikes => '$likesCount 좋아요';
  String get formattedDownloads => '$downloadCount 다운로드';
}