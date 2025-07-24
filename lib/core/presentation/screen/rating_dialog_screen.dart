import 'package:flutter/material.dart';

import '../component/dialog/rating_dialog.dart';

class RatingDialogScreen extends StatelessWidget {
  const RatingDialogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return RatingDialog(
                  title: 'Rate saved_recipes',
                  actionName: 'Send',
                  onChange: (int rating) {
                    print('Rating: $rating');
                    Navigator.pop(context); // 여기서 처리해야함
                  });
              },
            );
          }, // 화면에 점수 보여주려면?
          child: const Text('Show Rating Dialog'),
        ),
      ),
    );
  }
}