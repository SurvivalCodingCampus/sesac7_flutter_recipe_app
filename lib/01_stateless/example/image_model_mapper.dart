

import 'dto/image_dto.dart';
import 'model/image_mode.dart';

extension ImageMapper on ImageDto {
  // ImageDto를 ImageModel로 변환하는 확장 메서드
  ImageModel toImageModel() {
    return ImageModel(
      id: id,
      tags: tags,
      thumbnailUrl: webformatURL, // UI에 사용할 URL 선택
      fullImageUrl: largeImageURL, // 고해상도 이미지 URL
      photographerName: user,
      likesCount: likes,
      downloadCount: downloads,
    );
  }
}

// (선택 사항) 여러 ImageDto를 ImageModel 리스트로 변환하는 매퍼
extension ImageDtoListMapper on List<ImageDto> {
  List<ImageModel> toImageModelList() {
    return map((dto) => dto.toImageModel()).toList();
  }
}