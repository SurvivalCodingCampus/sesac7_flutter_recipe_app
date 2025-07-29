abstract interface class BookmarkRepository {
  Stream<List<String>> fetchBookmarks();
  Future<void> saveBookmark(String id);
  Future<void> removeBookmarks(String id);
}
