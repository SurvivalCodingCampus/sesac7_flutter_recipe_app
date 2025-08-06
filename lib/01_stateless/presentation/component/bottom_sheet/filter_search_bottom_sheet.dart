import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/bottom_sheet/bottom_sheet_action.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/filter_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/rating_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/component/buttons/small_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_state.dart';
import 'package:flutter_recipe_app/01_stateless/ui/app_colors.dart';
import 'package:flutter_recipe_app/01_stateless/ui/text_styles.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterSearchBottomSheet extends StatelessWidget {
  final void Function(BottomSheetAction action) onAction;
  final SearchRecipesState state;

  const FilterSearchBottomSheet({
    super.key,
    required this.onAction,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 31),
            Center(
              child: Text(
                'Filter Search',
                style: GoogleFonts.poppins(
                  textStyle: TextStyles.smallTextBold,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // time : all, newest, oldest
              children: [
                Text(
                  'Time',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyles.smallTextBold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: [
                    FilterButton(
                      text: 'All',
                      isSelected: true,
                      onTap: () =>
                          onAction(BottomSheetAction.selectTime('All')),
                    ),
                    FilterButton(
                      text: 'Newest',
                      isSelected: false,
                      onTap: () =>
                          onAction(BottomSheetAction.selectTime('Newest')),
                    ),
                    FilterButton(
                      text: 'Oldest',
                      isSelected: false,
                      onTap: () =>
                          onAction(BottomSheetAction.selectTime('Oldest')),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Rate : 5~1
              children: [
                Text(
                  'Rate',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyles.smallTextBold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: [
                    RatingButton(
                      text: '5',
                      isSelected: state.rate == 5,
                      onTap: () => onAction(BottomSheetAction.selectRate(5)),
                    ),
                    RatingButton(
                      text: '4',
                      isSelected: state.rate == 4,
                      onTap: () => onAction(BottomSheetAction.selectRate(4)),
                    ),
                    RatingButton(
                      text: '3',
                      isSelected: state.rate == 3,
                      onTap: () => onAction(BottomSheetAction.selectRate(3)),
                    ),
                    RatingButton(
                      text: '2',
                      isSelected: state.rate == 2,
                      onTap: () => onAction(BottomSheetAction.selectRate(2)),
                    ),
                    RatingButton(
                      text: '1',
                      isSelected: state.rate == 1,
                      onTap: () => onAction(BottomSheetAction.selectRate(1)),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // Category: all, Korean, chinese, japanese
              children: [
                Text(
                  'Category',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyles.smallTextBold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 10,
                  children: [
                    FilterButton(
                      text: 'All',
                      isSelected: state.categories.isEmpty,
                      onTap: () =>
                          onAction(BottomSheetAction.selectCategory('All')),
                    ),
                    FilterButton(
                      text: 'Korean',
                      isSelected: state.categories.contains('Korean'),
                      onTap: () => onAction(
                        BottomSheetAction.selectCategory('Korean'),
                      ),
                    ),
                    FilterButton(
                      text: 'Japanese',
                      isSelected: state.categories.contains('Japanese'),
                      onTap: () => onAction(
                        BottomSheetAction.selectCategory('Japanese'),
                      ),
                    ),
                    FilterButton(
                      text: 'Chinese',
                      isSelected: state.categories.contains('Chinese'),
                      onTap: () => onAction(
                        BottomSheetAction.selectCategory('Chinese'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: SmallButton(
                width: 174,
                height: 37,
                color: AppColors.primary100,
                text: 'Filter',
                onClick: () => onAction(BottomSheetAction.clickOnFilter()),
                isEnabled: true,
              ),
            ),
            const SizedBox(height: 22),
          ],
        ),
      ),
    );
  }
}
