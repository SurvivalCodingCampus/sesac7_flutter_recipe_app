import '../model/image_mode.dart';

abstract interface class ImageRepository {
  /// 지정된 쿼리로 이미지를 검색하고 [ImageModel] 리스트를 반환합니다.
  ///
  /// 검색 중 오류가 발생하면 [Exception]을 던집니다.
  Future<List<ImageModel>> getImages(String query, {int perPage, int page});
}