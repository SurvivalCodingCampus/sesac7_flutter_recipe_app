import 'package:flutter_recipe_app/01_stateless/data/data_source/db/dao/recipe_dao.dart';
import 'package:flutter_recipe_app/01_stateless/data/data_source/db/db_helper.dart';
import 'package:flutter_recipe_app/01_stateless/data/data_source/db/entity/recipe_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() {
  late Database db;
  late RecipeDao dao;

  setUp(() async {
    db = await databaseFactoryFfi.openDatabase(inMemoryDatabasePath);
    
    // 테이블 생성
    await db.execute(DbHelper.createTable);

    dao = RecipeDao(db);
  });

  tearDown(() async {
    await db.close();
  });

  group('RecipeDao Tests', () {
    test('insertRecipe should insert a recipe and return id', () async {
      // Given
      final recipe = RecipeEntity(
        category: 'Italian',
        name: 'Pasta',
        imageUrl: 'https://example.com/pasta.jpg',
        chef: 'Chef Mario',
        time: '30 min',
        rating: 4.5,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      // When
      final id = await dao.insertRecipe(recipe);

      // Then
      expect(id, isPositive);
    });

    test('getRecipeById should return recipe when id exists', () async {
      // Given
      final recipe = RecipeEntity(
        category: 'Italian',
        name: 'Pasta',
        imageUrl: 'https://example.com/pasta.jpg',
        chef: 'Chef Mario',
        time: '30 min',
        rating: 4.5,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      final id = await dao.insertRecipe(recipe);

      // When
      final result = await dao.findRecipeById(id);

      // Then
      expect(result, isNotNull);
      expect(result!.name, equals('Pasta'));
      expect(result.category, equals('Italian'));
      expect(result.chef, equals('Chef Mario'));
    });

    test('getRecipeById should return null when id does not exist', () async {
      // When
      final result = await dao.findRecipeById(999);

      // Then
      expect(result, isNull);
    });

    test('getAllRecipes should return all recipes', () async {
      // Given
      final recipe1 = RecipeEntity(
        category: 'Italian',
        name: 'Pasta',
        imageUrl: 'https://example.com/pasta.jpg',
        chef: 'Chef Mario',
        time: '30 min',
        rating: 4.5,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      final recipe2 = RecipeEntity(
        category: 'Asian',
        name: 'Ramen',
        imageUrl: 'https://example.com/ramen.jpg',
        chef: 'Chef Tanaka',
        time: '45 min',
        rating: 4.8,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      
      await dao.insertRecipe(recipe1);
      await dao.insertRecipe(recipe2);

      // When
      final result = await dao.getAllRecipes();

      // Then
      expect(result.length, equals(2));
      expect(result.any((r) => r.name == 'Pasta'), isTrue);
      expect(result.any((r) => r.name == 'Ramen'), isTrue);
    });

    test('getAllRecipes should return empty list when no recipes exist', () async {
      // When
      final result = await dao.getAllRecipes();

      // Then
      expect(result, isEmpty);
    });

    test('updateRecipe should update existing recipe', () async {
      // Given
      final recipe = RecipeEntity(
        category: 'Italian',
        name: 'Pasta',
        imageUrl: 'https://example.com/pasta.jpg',
        chef: 'Chef Mario',
        time: '30 min',
        rating: 4.5,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      final id = await dao.insertRecipe(recipe);
      
      final updatedRecipe = RecipeEntity(
        id: id,
        category: 'Italian',
        name: 'Spaghetti Carbonara',
        imageUrl: 'https://example.com/carbonara.jpg',
        chef: 'Chef Mario',
        time: '25 min',
        rating: 4.8,
        createdAt: recipe.createdAt,
      );

      // When
      final updateCount = await dao.updateRecipe(updatedRecipe);

      // Then
      expect(updateCount, equals(1));
      
      final result = await dao.findRecipeById(id);
      expect(result!.name, equals('Spaghetti Carbonara'));
      expect(result.rating, equals(4.8));
      expect(result.time, equals('25 min'));
    });

    test('updateRecipe should return 0 when recipe does not exist', () async {
      // Given
      final recipe = RecipeEntity(
        id: 999,
        category: 'Italian',
        name: 'Pasta',
        imageUrl: 'https://example.com/pasta.jpg',
        chef: 'Chef Mario',
        time: '30 min',
        rating: 4.5,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );

      // When
      final updateCount = await dao.updateRecipe(recipe);

      // Then
      expect(updateCount, equals(0));
    });

    test('deleteRecipe should delete existing recipe', () async {
      // Given
      final recipe = RecipeEntity(
        category: 'Italian',
        name: 'Pasta',
        imageUrl: 'https://example.com/pasta.jpg',
        chef: 'Chef Mario',
        time: '30 min',
        rating: 4.5,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      final id = await dao.insertRecipe(recipe);

      // When
      final deleteCount = await dao.deleteRecipe(id);

      // Then
      expect(deleteCount, equals(1));
      
      final result = await dao.findRecipeById(id);
      expect(result, isNull);
    });

    test('deleteRecipe should return 0 when recipe does not exist', () async {
      // When
      final deleteCount = await dao.deleteRecipe(999);

      // Then
      expect(deleteCount, equals(0));
    });
  });
}