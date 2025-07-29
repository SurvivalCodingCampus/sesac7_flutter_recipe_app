abstract interface class BookmarkRepository {
  Stream<List<String>> fetchBookmarks();
  Future<void> removeBookmarks(String id);
}
