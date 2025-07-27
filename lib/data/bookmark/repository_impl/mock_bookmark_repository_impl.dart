import 'package:flutter_recipe_app/core/data/recipe/mapper/recipe_mapper.dart';
import 'package:flutter_recipe_app/data/bookmark/data_source/bookmark_data_source.dart';
import 'package:flutter_recipe_app/data/bookmark/data_source/mock_bookmark_data_source_impl.dart';

import '../../../core/data/recipe/domain/model/recipe.dart';
import '../domain/repository/bookmark_repository.dart';

class MockBookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkDataSource _dataSource;

  MockBookmarkRepositoryImpl({required BookmarkDataSource dataSource})
    : _dataSource = dataSource;

  @override
  Future<List<Recipe>> getSavedRecipes() async {
    final result = await _dataSource.getSavedRecipes();

    return result.map((e) => e.toModel(e.recipes?.first.id as int)).toList();
  }
}

void main() async {
  final BookmarkRepository bookmarkRepository = MockBookmarkRepositoryImpl(
    dataSource: MockBookmarkDataSourceImpl(),
  );

  final result = await bookmarkRepository.getSavedRecipes();

  print(result);
}
