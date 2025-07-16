import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/ui/app_color.dart';

class RecipeThumbnail extends StatelessWidget {
  const RecipeThumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: const DecorationImage(
          image: NetworkImage(
            'https://cdn.pixabay.com/photo/2017/11/10/15/04/steak-2936531_1280.jpg',
          ),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColor.Black,
            AppColor.Black,
            AppColor.Black,
            AppColor.Black,
          ],
          stops: [0.0, 0.8, 0.9, 1.0],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Text('data')],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text('title', style: TextStyle(color: AppColor.White)),
                  Text('chef', style: TextStyle(color: AppColor.White)),
                ],
              ),
              Row(children: [Row()]),
            ],
          ),
        ],
      ),
    );
  }
}
