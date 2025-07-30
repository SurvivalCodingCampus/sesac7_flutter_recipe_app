import 'package:flutter_recipe_app/domain/repository/bookmark_repository.dart';

class GetBookmarkChangedStreamUseCase {
  final BookmarkRepository _bookmarkRepository;

  const GetBookmarkChangedStreamUseCase({
    required BookmarkRepository bookmarkRepository,
  }) : _bookmarkRepository = bookmarkRepository;

  Stream<void> execute() {
    return _bookmarkRepository.getBookmarkChangedStream();
  }
}
