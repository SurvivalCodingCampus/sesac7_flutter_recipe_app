import 'package:flutter/material.dart';

import '../../data/model/image_mode.dart';
import '../../data/repository/image_repository.dart';


class ImageSearchViewModel with ChangeNotifier {
  final ImageRepository _repository;

  List<ImageModel> _images = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<ImageModel> get images => _images;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  ImageSearchViewModel({required ImageRepository repository}) : _repository = repository;

  Future<void> searchImages(String query) async {
    if (query.isEmpty) {
      _images = [];
      _errorMessage = '검색어를 입력해주세요.';
      notifyListeners();
      return;
    }

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      final fetchedImages = await _repository.getImages(query);
      _images = fetchedImages;
    } catch (e) {
      // Repository에서 던져진 예외를 여기서 처리
      _errorMessage = e.toString().replaceFirst('Exception: ', ''); // "Exception: " 접두사 제거
      _images = [];
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}