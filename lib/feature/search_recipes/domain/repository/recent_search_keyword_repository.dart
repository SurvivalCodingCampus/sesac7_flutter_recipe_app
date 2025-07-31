abstract interface class RecentSearchKeywordRepository {
  Future<String> fetchRecentSearchKeyword();
  Future<void> saveSearchKeyword(String value);
}
