import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/presentation/ui/app_color.dart';

class SmallRecipeCard extends StatelessWidget {
  final String userName;
  final String firstLine;
  final double rating;
  final String imageUrl;
  final VoidCallback? onTapList;

  const SmallRecipeCard({
    super.key,
    required this.userName,
    required this.firstLine,
    this.rating = 0.0,
    required this.imageUrl,
    this.onTapList,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapList,
      child: Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                // rating 버튼
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}