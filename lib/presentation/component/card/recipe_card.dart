import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      width: 312,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text('rating'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('title\nsubtitle'),
                  SizedBox(height: 10,),
                  Text('chef'),
                ],
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Text('icon'),
                      SizedBox(width: 10,),
                      Text('minute'),
                    ],
                  ),
                  SizedBox(width: 10,),
                  Text('bookmark')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
