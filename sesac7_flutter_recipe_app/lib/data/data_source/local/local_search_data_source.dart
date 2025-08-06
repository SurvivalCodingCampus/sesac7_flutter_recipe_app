abstract interface class LocalSearchDataSource {
  Future<bool> saveRecentSearchKeyword(String keyword);
  Future<bool> deleteRecentSearchKeyword();
  Future<String?> getRecentSearchKeyword();
}