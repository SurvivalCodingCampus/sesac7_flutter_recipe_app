import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/components/cards/procedure_card.dart';
import 'package:flutter_recipe_app/ui/app_colors.dart';
import 'package:flutter_recipe_app/ui/text_styles.dart';

class ProceduresTabScreen extends StatelessWidget {
  final List<String> procedures;

  const ProceduresTabScreen({super.key, required this.procedures});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.rice_bowl, color: AppColors.gray3),
                Text(
                  '1 serve',
                  style: TextStyles.smallerTextRegular.copyWith(
                    color: AppColors.gray3,
                  ),
                ),
              ],
            ),
            Text(
              '${procedures.length} Steps',
              style: TextStyles.smallerTextRegular.copyWith(
                color: AppColors.gray3,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: procedures.length,
            itemBuilder: (context, index) {
              final procedure = procedures[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ProcedureCard(procedure: procedure, index: index + 1,),
              );
            },
          ),
        ),
      ],
    );
  }
}

