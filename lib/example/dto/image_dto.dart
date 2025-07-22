class ImageDto {
  final int id;
  final String tags;
  final String previewURL;
  final String webformatURL;
  final String largeImageURL;
  final String user;
  final int likes;
  final int downloads;
  final int views;
  final int comments;

  ImageDto({
    required this.id,
    required this.tags,
    required this.previewURL,
    required this.webformatURL,
    required this.largeImageURL,
    required this.user,
    required this.likes,
    required this.downloads,
    required this.views,
    required this.comments,
  });

  // JSON 데이터로부터 DTO 객체를 생성하는 팩토리 메서드
  factory ImageDto.fromJson(Map<String, dynamic> json) {
    return ImageDto(
      id: json['id'] as int,
      tags: json['tags'] as String,
      previewURL: json['previewURL'] as String,
      webformatURL: json['webformatURL'] as String,
      largeImageURL: json['largeImageURL'] as String,
      user: json['user'] as String,
      likes: json['likes'] as int,
      downloads: json['downloads'] as int,
      views: json['views'] as int,
      comments: json['comments'] as int,
    );
  }

  // (선택 사항) DTO를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tags': tags,
      'previewURL': previewURL,
      'webformatURL': webformatURL,
      'largeImageURL': largeImageURL,
      'user': user,
      'likes': likes,
      'downloads': downloads,
      'views': views,
      'comments': comments,
    };
  }
}