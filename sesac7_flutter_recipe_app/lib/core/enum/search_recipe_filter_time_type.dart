enum SearchRecipeFilterTimeType {
  all('All'),
  newest('Newest'),
  oldest('Oldest'),
  popularity('Popularity');

  final String value;

  const SearchRecipeFilterTimeType(this.value);
}