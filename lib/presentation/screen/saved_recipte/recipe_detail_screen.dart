import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/screen/saved_recipte/saved_recipes_viewmodel.dart';
import 'package:go_router/go_router.dart';
import '../../../data/model/user.dart';
import '../../../data/model/recipe.dart';

class RecipeDetailScreen extends StatefulWidget {
  final Recipe recipe;
  final User user;
  final SavedRecipesViewModel viewModel;

  const RecipeDetailScreen({
    super.key,
    required this.recipe,
    required this.user,
    required this.viewModel,
  });

  @override
  State<RecipeDetailScreen> createState() => _RecipeDetailScreenState();
}

class _RecipeDetailScreenState extends State<RecipeDetailScreen> {
  int _selectedTabIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: _buildInfoSection(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: _buildTabSwitcher(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 30.0,
                vertical: 20.0,
              ),
              child: _buildListHeader(),
            ),
            _buildContentList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              child: Image.network(
                widget.recipe.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 56,
            left: 30,
            child: CircleAvatar(
              backgroundColor: Colors.black.withOpacity(0.5),
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => context.pop(),
              ),
            ),
          ),
          Positioned(
            top: 56,
            right: 30,
            child: _buildDetailRatingBadge(widget.recipe.rating),
          ),
          Positioned(
            bottom: 20,
            right: 30,
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.access_time_rounded,
                        color: Colors.white,
                        size: 16,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        widget.recipe.cookingTime,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                ListenableBuilder(
                  listenable: widget.viewModel,
                  builder: (context, child) {
                    final currentRecipe = widget.recipe;

                    final isBookmarked =
                        currentRecipe.isBookmarked ??
                        widget.recipe.isBookmarked;
                    return CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(
                          isBookmarked
                              ? Icons.bookmark
                              : Icons.bookmark_border_outlined,
                          color: isBookmarked
                              ? Colors.green[600]
                              : Colors.grey[700],
                        ),
                        onPressed: () =>
                            widget.viewModel.toggleBookmark(widget.recipe.id),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRatingBadge(double? rating) {
    bool hasRating = rating != null && rating > 0;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: ShapeDecoration(
        color: hasRating
            ? const Color(0xFFFFE1B3)
            : Colors.black.withOpacity(0.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.star,
            size: 8,
            color: hasRating ? Colors.black : Colors.white,
          ),
          const SizedBox(width: 3),
          Text(
            hasRating ? rating.toString() : 'N/A',
            style: TextStyle(
              color: hasRating ? Colors.black : Colors.white,
              fontSize: 8,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                widget.recipe.recipeName,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Text(
              '(13k Reviews)',
              style: const TextStyle(
                color: Color(0xFFA9A9A9),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(widget.user.profileImageUrl),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.name,
                  style: const TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  widget.user.location,
                  style: const TextStyle(
                    color: Color(0xFFA9A9A9),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: 85,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF119475),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Follow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTabSwitcher() {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedTabIndex = 0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: ShapeDecoration(
                color: _selectedTabIndex == 0
                    ? const Color(0xFF119475)
                    : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Ingrident',
                  style: TextStyle(
                    color: _selectedTabIndex == 0
                        ? Colors.white
                        : const Color(0xFF71B1A1),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: GestureDetector(
            onTap: () => setState(() => _selectedTabIndex = 1),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: ShapeDecoration(
                color: _selectedTabIndex == 1
                    ? const Color(0xFF119475)
                    : Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                child: Text(
                  'Procedure',
                  style: TextStyle(
                    color: _selectedTabIndex == 1
                        ? Colors.white
                        : const Color(0xFF71B1A1),
                    fontSize: 11,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const Icon(
              Icons.groups_outlined,
              color: Color(0xFFA9A9A9),
              size: 17,
            ),
            const SizedBox(width: 5),
            Text(
              '1 serve',
              style: const TextStyle(
                color: Color(0xFFA9A9A9),
                fontSize: 11,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
        Text(
          _selectedTabIndex == 0
              ? '${widget.recipe.ingredients.length} Items'
              : '${widget.recipe.procedures.length} Steps',
          style: const TextStyle(
            color: Color(0xFFA9A9A9),
            fontSize: 11,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildContentList() {
    if (_selectedTabIndex == 0) {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        itemCount: widget.recipe.ingredients.length,
        itemBuilder: (context, index) {
          final ingredient = widget.recipe.ingredients[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12),
            decoration: ShapeDecoration(
              color: const Color(0xFFD9D9D9).withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Center(
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: ShapeDecoration(
                        image: DecorationImage(
                          image: NetworkImage(ingredient.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Text(
                  ingredient.name,
                  style: const TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Text(
                  ingredient.amount,
                  style: const TextStyle(
                    color: Color(0xFFA9A9A9),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        },
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        itemCount: widget.recipe.procedures.length,
        itemBuilder: (context, index) {
          final step = widget.recipe.procedures[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(16.0),
            decoration: ShapeDecoration(
              color: const Color(0xFFD9D9D9).withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Step ${index + 1}',
                  style: const TextStyle(
                    color: Color(0xFF121212),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  step,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
