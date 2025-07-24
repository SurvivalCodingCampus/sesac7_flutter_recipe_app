import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipte/saved_recipes_viewmodel.dart';
import 'package:go_router/go_router.dart';
import '../../../data/model/recipe.dart';
import '../../../data/model/user.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  final User user;
  final SavedRecipesViewModel viewModel;

  const RecipeCard({
    super.key,
    required this.recipe,
    required this.user,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/detail/${recipe.id}'),
      child: Container(
        height: 150,
        width: 315,
        clipBehavior: Clip.antiAlias,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                recipe.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: ShapeDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.50, -0.00),
                    end: const Alignment(0.50, 1.00),
                    colors: [Colors.black.withOpacity(0), Colors.black],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            if (recipe.rating != null && recipe.rating! > 0)
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 2,
                  ),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFFE1B3),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, size: 8, color: Colors.black),
                      const SizedBox(width: 3),
                      Text(
                        recipe.rating.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 8,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Positioned(
              left: 15,
              bottom: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      recipe.recipeName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'By ${user.name}',
                    style: const TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 8,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 10,
              bottom: 10,
              child: Row(
                children: [
                  const Icon(
                    Icons.timer_outlined,
                    color: Color(0xFFD9D9D9),
                    size: 17,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    recipe.cookingTime,
                    style: const TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 11,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  _buildBookmarkButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBookmarkButton() {
    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) {
        final currentRecipe = viewModel.state.recipes.firstWhere(
          (r) => r.id == recipe.id,
          orElse: () => recipe,
        );
        final isBookmarked = currentRecipe.isBookmarked;
        return GestureDetector(
          onTap: () => viewModel.toggleBookmark(recipe.id),
          child: Container(
            width: 24,
            height: 24,
            decoration: const ShapeDecoration(
              color: Colors.white,
              shape: CircleBorder(),
            ),
            child: Icon(
              isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              color: isBookmarked ? Colors.green[600] : Colors.grey[700],
              size: 16,
            ),
          ),
        );
      },
    );
  }
}
