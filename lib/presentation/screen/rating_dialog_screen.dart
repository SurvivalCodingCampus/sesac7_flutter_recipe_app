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
                  title: 'Rate recipe',
                  actionName: 'Send',
                  onChange: (int rating) {
                    print('Rating: $rating');
                  });
              },
            );
          },
          child: const Text('Show Rating Dialog : '),
        ),
      ),
    );
  }
}