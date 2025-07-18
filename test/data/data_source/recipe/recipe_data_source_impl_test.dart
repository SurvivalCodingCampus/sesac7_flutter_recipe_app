import 'package:flutter_test/flutter_test.dart';

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_recipe_app/data/data_source/recipe/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/data/dto/recipe/recipe_dto.dart';
import 'package:http/testing.dart' as http;

void main() {
  final sampleJsonString = jsonEncode({
    "recipes": [
      {
        "category": "Indian",
        "id": 1,
        "name": "Traditional spare ribs baked",
        "image":
            "https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg",
        "chef": "Chef John",
        "time": "20 min",
        "rating": 4.0,
        "ingredients": [
          {
            "ingredient": {
              "id": 3,
              "name": "Pork",
              "image":
                  "https://cdn.pixabay.com/photo/2019/12/20/14/44/meat-4708596_1280.jpg",
            },
            "amount": 500,
          },
          {
            "ingredient": {
              "id": 9,
              "name": "Onion",
              "image":
                  "https://cdn.pixabay.com/photo/2013/02/21/19/14/onion-bulbs-84722_1280.jpg",
            },
            "amount": 50,
          },
          {
            "ingredient": {
              "id": 8,
              "name": "Pepper",
              "image":
                  "https://cdn.pixabay.com/photo/2016/03/05/22/31/pepper-1239308_1280.jpg",
            },
            "amount": 10,
          },
          {
            "ingredient": {
              "id": 1,
              "name": "Tomato",
              "image":
                  "https://cdn.pixabay.com/photo/2017/10/06/17/17/tomato-2823826_1280.jpg",
            },
            "amount": 100,
          },
        ],
      },
      {
        "id": 2,
        "category": "Asian",
        "name": "Spice roasted chicken with flavored rice",
        "image":
            "https://cdn.pixabay.com/photo/2018/12/04/16/49/tandoori-3856045_1280.jpg",
        "chef": "Mark Kelvin",
        "time": "20 min",
        "rating": 4.0,
        "ingredients": [
          {
            "ingredient": {
              "id": 6,
              "name": "Chicken",
              "image":
                  "https://cdn.pixabay.com/photo/2010/12/10/08/chicken-1140_1280.jpg",
            },
            "amount": 300,
          },
          {
            "ingredient": {
              "id": 4,
              "name": "Rice",
              "image":
                  "https://cdn.pixabay.com/photo/2016/02/29/05/46/brown-rice-1228099_1280.jpg",
            },
            "amount": 200,
          },
        ],
      },
    ],
  });

  group('fetchAllRecipes', () {
    test(
      'fetchAllRecipes returns a list of RecipeDto on successful response',
      () async {
        final mockClient = http.MockClient((request) async {
          if (request.url == Uri.parse(RecipeDataSourceImpl.baseUrl) &&
              request.headers.toString() ==
                  RecipeDataSourceImpl.headers.toString()) {
            return http.Response(
              sampleJsonString,
              200,
            );
          } else {
            return http.Response('{}', 404);
          }
        });
        final dataSource = RecipeDataSourceImpl(client: mockClient);
        final result = await dataSource.fetchAllRecipes();

        expect(result.statusCode, 200);
        expect(result.body, isA<List<RecipeDto>>());
        expect(result.body.length, 2);
        expect(result.body.first.name, "Traditional spare ribs baked");
      },
    );

    test('fetchAllRecipes returns an empty list on 404 response', () async {
      final mockClient = http.MockClient((request) async {
        return http.Response('{}', 404);
      });
      final dataSource = RecipeDataSourceImpl(client: mockClient);

      final result = await dataSource.fetchAllRecipes();

      expect(result.statusCode, 404);
      expect(result.body, isEmpty);
    });

    test(
      'fetchAllRecipes returns an empty list when recipes are empty',
      () async {
        final mockClient = http.MockClient((request) async {
          return http.Response(jsonEncode({'recipes': []}), 200);
        });
        final dataSource = RecipeDataSourceImpl(client: mockClient);

        final result = await dataSource.fetchAllRecipes();

        expect(result.statusCode, 200);
        expect(result.body, isEmpty);
      },
    );

    test(
      'fetchAllRecipes throws an exception when an error occurs during the request',
      () async {
        final mockClient = http.MockClient((request) async {
          throw Exception('Network error');
        });
        final dataSource = RecipeDataSourceImpl(client: mockClient);

        expect(
          () async => await dataSource.fetchAllRecipes(),
          throwsA(isA<Exception>()),
        );
      },
    );

    test('fetchAllRecipes returns an empty list on 500 response', () async {
      final mockClient = http.MockClient((request) async {
        return http.Response('{}', 500);
      });
      final dataSource = RecipeDataSourceImpl(client: mockClient);

      final result = await dataSource.fetchAllRecipes();

      expect(result.statusCode, 500);
      expect(result.body, isEmpty);
    });

    test('fetchAllRecipes throws ClientException on network error', () async {
      final mockClient = http.MockClient((request) async {
        throw http.ClientException('Failed to connect to the server');
      });
      final dataSource = RecipeDataSourceImpl(client: mockClient);

      expect(
        () async => await dataSource.fetchAllRecipes(),
        throwsA(isA<http.ClientException>()),
      );
    });
  });
}
