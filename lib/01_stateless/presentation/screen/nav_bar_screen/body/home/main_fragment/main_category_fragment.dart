import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/model/recipe.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/displays/dish_card.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class MainCategoryFragment extends StatefulWidget {
  final List<String> tabs;
  final void Function(int i) onTabTap;
  final void Function(int i) onBookmarkTap;

  final List<Recipe> filteredRecipe;

  const MainCategoryFragment({
    super.key,
    required this.tabs,
    required this.onTabTap,
    required this.onBookmarkTap,
    required this.filteredRecipe,
  });

  @override
  State<MainCategoryFragment> createState() => _MainCategoryFragmentState();
}

class _MainCategoryFragmentState extends State<MainCategoryFragment> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(widget.tabs.length, (index) {
              final isSelected = (_selectedIndex == index);
              return GestureDetector(
                onTap: () => setState(() {
                  _selectedIndex = index;
                  widget.onTabTap(index);
                }),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: isSelected
                        ? AppColors.primary100
                        : Colors.transparent,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 7),
                    child: Text(
                      widget.tabs[index],
                      style: GoogleFonts.poppins(
                        textStyle: TextStyles.smallerTextBold,
                        color: isSelected ? Colors.white : AppColors.primary80,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ), // scrollable tabs
        const SizedBox(height: 15),
        SizedBox(
          height: 231,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: widget.filteredRecipe.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 15),
                child: DishCard(
                  recipe: widget.filteredRecipe[index],
                  onBookmark: widget.onBookmarkTap,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
