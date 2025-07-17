import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/component/bookmark_button_widget.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/component/start_rate_widget.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/ui/app_colors.dart';
import 'package:flutter_recipe_app/02_stateful/presentation/ui/text_styles.dart';

class RecipeListItem extends StatefulWidget {
  final String name;
  final String userName;
  final int time;
  final int rate;
  final String imgSrc;
  final bool isBookmarked;
  final double width;
  final void Function() onClick;

  const RecipeListItem({
    super.key,
    width,
    required this.name,
    required this.userName,
    required this.time,
    required this.rate,
    required this.imgSrc,
    required this.isBookmarked,
    required this.onClick,
  }) : width = width ?? double.infinity;

  @override
  State<RecipeListItem> createState() => _RecipeListItemState();
}

class _RecipeListItemState extends State<RecipeListItem> {
  late bool isBookmarked;

  @override
  void initState() {
    super.initState();
    isBookmarked = widget.isBookmarked; // 여기서 접근해야 안전함
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage(widget.imgSrc),
          fit: BoxFit.cover,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Container(
                    //width: 160,
                    height: 42,
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      widget.name,
                      style: TextStyles.smallTextBold.copyWith(
                        color: AppColors.white,
                      ),
                      maxLines: 2,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
                  child: Text(
                    widget.userName,
                    style: TextStyles.smallerTextRegular.copyWith(
                      color: AppColors.gray4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 10, 0),
                child: StarRateWidget(rating: widget.rate),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 5, 13.5),
                    child: Image.asset(
                      'assets/images/timer.png',
                      width: 17,
                      height: 17,
                      color: AppColors.gray4,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 13.5),
                    child: Text(
                      '20 min',
                      style: TextStyles.smallerTextRegular_recipeListItem
                          .copyWith(color: AppColors.gray4),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                    child: BookmarkButtonWidget(
                      isBookmarked: false,
                      onClick: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
