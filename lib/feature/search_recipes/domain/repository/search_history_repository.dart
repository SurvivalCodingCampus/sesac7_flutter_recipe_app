abstract interface class SearchHistoryRepository {
  Future<List<String>> fetchSearchHistory();
  Future<void> saveSearchKeyword(String value);
}
