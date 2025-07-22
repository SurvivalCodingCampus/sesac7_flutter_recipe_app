


import '../../core/result.dart';
import '../../dto/image_dto.dart';

abstract interface class ImageDataSource {
  Future<Result<List<ImageDto>, DataSourceException>> searchImages(
      String query, {
        int perPage,
        int page,
      });
}