abstract interface class BookmarkRepository {
  Future<List<String>> fetchBookmarks();
  Future<void> removeBookmarks(String id);
}
