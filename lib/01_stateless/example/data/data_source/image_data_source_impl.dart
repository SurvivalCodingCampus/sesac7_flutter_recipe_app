import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../../core/result.dart';
import '../../dto/image_dto.dart';
import 'image_data_source.dart';

class ImageDataSourceImpl implements ImageDataSource {
  static const String _apiKey = "10711147-dc41758b93b263957026bdadb"; // <-- **여기에 API 키를 넣으세요!**
  static const String _baseUrl = "https://pixabay.com/api/";

  final http.Client _client;

  ImageDataSourceImpl({http.Client? client}) : _client = client ?? http.Client();

  @override
  Future<Result<List<ImageDto>, DataSourceException>> searchImages(
      String query, {
        int perPage = 20,
        int page = 1,
      }) async {
    if (_apiKey.isEmpty) {
      if (kDebugMode) {
        print("경고: Pixabay API 키가 설정되지 않았습니다. `_apiKey` 변수를 업데이트해주세요.");
      }
      return const Failure(DataSourceException.invalidApiKey);
    }

    final uri = Uri.parse(
      '$_baseUrl?key=$_apiKey&q=${Uri.encodeComponent(query)}&image_type=photo&per_page=$perPage&page=$page',
    );

    try {
      final response = await _client.get(uri);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<dynamic> hits = data['hits'];

        if (hits.isEmpty) {
          return const Success([]); // 결과가 없어도 성공으로 간주 (빈 리스트 반환)
        }

        final List<ImageDto> imageDtos = hits.map((json) => ImageDto.fromJson(json)).toList();
        return Success(imageDtos);
      } else if (response.statusCode == 400 && response.body.contains("Invalid API key")) {
        return const Failure(DataSourceException.invalidApiKey);
      } else if (response.statusCode >= 500) {
        return const Failure(DataSourceException.serverError);
      } else {
        // 기타 HTTP 오류
        print('API Error: Status ${response.statusCode}, Body: ${response.body}');
        return const Failure(DataSourceException.unknownError);
      }
    } on http.ClientException {
      // 네트워크 연결 오류 (예: 인터넷 연결 끊김)
      return const Failure(DataSourceException.networkError);
    } catch (e) {
      // 기타 예상치 못한 오류
      print('Unexpected Error: $e');
      return const Failure(DataSourceException.unknownError);
    }
  }
}