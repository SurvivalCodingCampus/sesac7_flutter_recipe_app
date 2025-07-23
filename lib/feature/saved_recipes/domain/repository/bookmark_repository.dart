abstract interface class BookmarkRepository {
  Future<List<String>> fetchBookmarks();
  Future<void> updateBookmarks(List<String> bookmarks);
}
