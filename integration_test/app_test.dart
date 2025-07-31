import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/data_source/api/recipe_data_source_impl.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/person_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/recipe_repository_impl.dart';
import 'package:flutter_recipe_app/01_stateless/domain/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/main/main_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/main/main_view_model.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/saved_recipes/saved_recipes_screen.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/saved_recipes/saved_recipes_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  late MainViewModel viewModel;

  setUpAll(() {
    viewModel = MainViewModel(
      personRepository: PersonRepositoryImpl(),
    );
  });

  testWidgets('SavedRecipes', (tester) async {
    final savedRecipesViewModel = SavedRecipesViewModel(
      _recipeRepository: RecipeRepositoryImpl(
        recipeDataSource: RecipeDataSourceImpl(
          baseUrl:
              'https://raw.githubusercontent.com/junsuk5/mock_json/refs/heads/main',
        ),
      ),
    );
    await savedRecipesViewModel.fetchRecipes();

    await tester.pumpWidget(
      MaterialApp(
        home: ListenableBuilder(
          listenable: savedRecipesViewModel,
          builder: (context, child) {
            return SavedRecipesScreen(
              viewModel: savedRecipesViewModel,
              onTapRecipe: (Recipe recipe) {},
            );
          },
        ),
      ),
    );

    await tester.pumpAndSettle();

    final recipeItem10Finder = find.textContaining('id: 10');

    await tester.scrollUntilVisible(
      recipeItem10Finder, // 찾으려는 위젯
      500.0, // 한 번에 스크롤할 양 (픽셀)
      scrollable: find.byType(Scrollable), // 스크롤 가능한 위젯의 타입
    );

    await tester.pumpAndSettle();

    expect(recipeItem10Finder, findsOneWidget);
  });

  testWidgets('dialog test', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return MainScreen(viewModel: viewModel);
          },
        ),
      ),
    );

    await tester.tap(find.byKey(Key('dialog_button')));
    await tester.pumpAndSettle(); // 애니메이션 끝날 때 까지 pump

    expect(find.text('제목'), findsOneWidget);
    expect(find.text('별점'), findsOneWidget);
  });

  testWidgets('버튼을 누르면 값이 증가한다', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ListenableBuilder(
          listenable: viewModel,
          builder: (context, child) {
            return MainScreen(viewModel: viewModel);
          },
        ),
      ),
    );

    expect(find.byKey(Key('count')), findsOneWidget);
    await tester.tap(find.byKey(Key('small_button')));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.byKey(Key('small_button')));
    await tester.pumpAndSettle();
    expect(find.text('2'), findsOneWidget);
  });
}
