import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/core/domain/model/recipe/ingredient.dart';
import 'package:flutter_recipe_app/core/presentation/component/button/small_button.dart';
import 'package:flutter_recipe_app/core/presentation/component/list_item/ingredient_item.dart';
import 'package:flutter_recipe_app/core/presentation/component/tab/two_tabs.dart';
import 'package:flutter_recipe_app/feature/ingredient/domain/model/ingredient_tab_type.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_recipe_card.dart';
import 'package:flutter_recipe_app/feature/ingredient/presentation/ingredient_view_model.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class IngredientScreen extends StatelessWidget {
  final IngredientViewModel viewModel;
  final VoidCallback onBackTap;
  final VoidCallback onMenuTap;

  const IngredientScreen({
    super.key,
    required this.viewModel,
    required this.onBackTap,
    required this.onMenuTap,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 54, 30, 0),
        child: Column(
          spacing: 10,
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: onBackTap,
                  child: Icon(
                    Icons.arrow_back,
                    size: 20,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: onMenuTap,
                  child: Icon(
                    Icons.more_horiz,
                    size: 24,
                  ),
                ),
              ],
            ),
            Builder(
              builder: (context) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.errorMessage.isNotEmpty) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }

                return Column(
                  children: [
                    Column(
                      spacing: 10,
                      children: [
                        IngredientRecipeCard(
                          recipe: state.recipe,
                          onBookmarkTap: () {},
                        ),
                        Row(
                          spacing: 18,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Flexible(
                              child: Text(
                                state.recipe.name,
                                style: TextStyles.smallTextBold,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '(${state.reviewCount} Reviews)',
                              style: TextStyles.smallTextRegular.copyWith(
                                color: AppColors.gray3,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          spacing: 10,
                          children: [
                            CircleAvatar(
                              radius: 20,
                            ),
                            Column(
                              spacing: 2,
                              children: [
                                Text(
                                  state.recipe.creator,
                                  style: TextStyles.smallTextBold,
                                ),
                                Row(
                                  spacing: 1,
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: 17,
                                      color: AppColors.primary80,
                                    ),
                                    Text(
                                      'Lagos, Nigeria',
                                      style: TextStyles.smallerTextRegular
                                          .copyWith(
                                            color: AppColors.gray3,
                                          ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            SmallButton(
                              text: 'Follow',
                              onClick: () {},
                              width: 85,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    TwoTabs(
                      labels: ['Ingredient', 'Procedure'],
                      selectedIndex: state.tabType.index,
                      onValueChange: viewModel.tabChange,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    Row(
                      spacing: 5,
                      children: [
                        Icon(
                          Icons.room_service,
                          size: 17,
                          color: AppColors.gray3,
                        ),
                        Text(
                          '${state.recipe.serve} serve',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: AppColors.gray3,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${state.ingredients.length} Items',
                          style: TextStyles.smallerTextRegular.copyWith(
                            color: AppColors.gray3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: Builder(
                        builder: (context) {
                          return switch (state.tabType) {
                            IngredientTabType.ingredient => _IngredientList(
                              ingredients: state.ingredients,
                            ),
                            IngredientTabType.procedure => _ProcedureList(
                              procedure: state.procedure,
                            ),
                          };
                        },
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _IngredientList extends StatelessWidget {
  final List<Ingredient> ingredients;

  const _IngredientList({required this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: ingredients.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) {
        return IngredientItem(ingredient: ingredients[index]);
      },
    );
  }
}

class _ProcedureList extends StatelessWidget {
  final List<String> procedure;

  const _ProcedureList({required this.procedure});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.zero,
      itemCount: procedure.length,
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.gray4,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            spacing: 5,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Step ${index + 1}',
                style: TextStyles.smallerTextBold,
              ),
              Text(
                procedure[index],
                style: TextStyles.smallerTextRegular.copyWith(
                  color: AppColors.gray3,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
