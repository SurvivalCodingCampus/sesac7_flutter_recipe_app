import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class BigRecipeCard extends StatelessWidget {
  final String userName;
  final String firstLine;
  final double rating;
  final int minutes;
  final String imageUrl;
  final VoidCallback? onTapList;
  final VoidCallback? onTapBookmark;

  const BigRecipeCard({
    super.key,
    required this.userName,
    required this.firstLine,
    this.rating = 0.0,
    this.minutes = 0,
    required this.imageUrl,
    this.onTapList,
    this.onTapBookmark,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapList,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Center(
                      child: Icon(Icons.broken_image, color: Colors.grey[600]),
                    ),
                  );
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black54,
                      Colors.black87,
                    ],
                    stops: [0.0, 0.4, 1.0],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 7),
                        decoration: BoxDecoration(
                          color: AppColor.Secondary20,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: AppColor.Rating, size: 7.5),
                            SizedBox(width: 3),
                            Text('$rating', style: TextStyle(fontSize: 8, height: 1.5)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 180,
                            child: Text(
                              firstLine,
                              style: TextStyle(
                                color: AppColor.White,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Text(
                            'By $userName',
                            style: TextStyle(color: AppColor.White, fontSize: 8),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 3.5),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: AppColor.White,
                                  size: 17,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  '$minutes min',
                                  style: TextStyle(color: AppColor.White, fontSize: 11),
                                ),
                              ],
                            ),
                            SizedBox(width: 10,),
                            GestureDetector(
                              onTap: onTapBookmark,
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                decoration: BoxDecoration(
                                  color: AppColor.White,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Icon(Icons.bookmark_border_rounded, color: AppColor.Primary80, size: 24),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}