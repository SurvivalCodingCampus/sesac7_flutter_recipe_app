abstract interface class RecentSearchKeywordDataSource {
  Future<String?> fetchRecentSearchKeyword();
  Future<void> saveSearchKeyword(String value);
}
