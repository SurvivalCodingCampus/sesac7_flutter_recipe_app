import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/button/big_button.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/dialog/rating_dialog.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/small_button.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/main/main_view_model.dart';

import '../../../domain/model/person.dart';
import '../../../core/presentation/component/greeting.dart';

class MainScreen extends StatelessWidget {
  final MainViewModel viewModel;

  const MainScreen({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    final state = viewModel.state;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              key: Key('count'),
              '${state.count}',
            ),
            SmallButton(
              key: Key('small_button'),
              text: 'button',
              onClick: viewModel.incrementCount,
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('button'),
            ),
            Greeting(
              name: '홍길동의 화면',
              person: const Person(name: '홍길동', age: 20),
              onTap: (Person person) {
                print(person);
              },
            ),
            RatingDialog(
              title: 'title',
              actionName: 'actionName',
              onChange: (rating) {
                print(rating);
              },
            ),
            Text('별점 : ${state.score}'),
            ElevatedButton(
              key: Key('dialog_button'),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) {
                    return UnconstrainedBox(
                      child: RatingDialog(
                        score: state.score,
                        title: '제목',
                        actionName: '별점',
                        onChange: (int rating) {
                          print(rating);
                          viewModel.setScore(rating);
                          Navigator.pop(context);
                        },
                      ),
                    );
                  },
                );
              },
              child: Text('dialog'),
            ),
            BigButton(
              buttonText: '사람 정보',
              onTap: viewModel.fetchPersonData,
            ),
            Text(
              '${state.name}, ${state.age}',
              style: TextStyle(fontSize: 40),
            ),
            if (state.isLoading)
              Center(
                child: const CircularProgressIndicator(),
              ),
          ],
        ),
      ),
    );
  }
}
