

import 'package:flutter_recipe_app/example/image_model_mapper.dart';

import '../core/result.dart';
import '../data_source/image_data_source.dart';
import '../model/image_mode.dart';
import 'image_repository.dart';

class ImageRepositoryImpl implements ImageRepository {
  final ImageDataSource _dataSource; // ImageDataSource 의존성 주입

  // 생성자를 통해 DataSource를 주입받습니다.
  ImageRepositoryImpl({required ImageDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<List<ImageModel>> getImages(String query, {int perPage = 20, int page = 1}) async {
    // 1. DataSource로부터 Result<List<ImageDto>, DataSourceException> 타입의 결과를 받습니다.
    final result = await _dataSource.searchImages(query, perPage: perPage, page: page);

    // 2. Result 패턴의 결과를 처리합니다.
    return switch (result) {
    // 2-1. 성공(Success)인 경우:
    //     받은 ImageDto 리스트를 매퍼를 사용하여 ImageModel 리스트로 변환하여 반환합니다.
      Success(value: final imageDtos) => imageDtos.toImageModelList(),

    // 2-2. 실패(Failure)인 경우:
    //     DataSourceException을 도메인 레벨의 Exception으로 변환하여 던집니다.
      Failure(exception: final error) => throw _mapDataSourceErrorToDomainError(error),
    };
  }

  /// [DataSourceException]을 앱의 도메인 계층에서 이해할 수 있는 [Exception]으로 매핑합니다.
  ///
  /// 실제 앱에서는 더욱 구체적인 사용자 정의 도메인 오류 클래스(예: [NetworkException], [ApiException])를
  /// 정의하여 반환하는 것이 좋습니다.
  Exception _mapDataSourceErrorToDomainError(DataSourceException error) {
    switch (error) {
      case DataSourceException.networkError:
        return Exception('네트워크 연결에 문제가 있습니다. 인터넷을 확인해주세요.');
      case DataSourceException.serverError:
        return Exception('서버에 일시적인 문제가 발생했습니다. 잠시 후 다시 시도해주세요.');
      case DataSourceException.invalidApiKey:
        return Exception('API 키가 올바르지 않습니다. 개발자에게 문의해주세요.');
      case DataSourceException.emptyResponse:
        return Exception('검색된 이미지가 없습니다.');
      case DataSourceException.unknownError:
        return Exception('알 수 없는 오류가 발생했습니다. 다시 시도해주세요.');
    }
  }
}