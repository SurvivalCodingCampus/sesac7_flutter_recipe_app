import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/domain/model/person.dart';
import 'package:flutter_recipe_app/01_stateless/core/presentation/component/greeting.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Greeting 위젯 테스트', (tester) async {
    // given
    final name = '홍길동';

    final greeting = Greeting(
      name: name,
      person: Person(name: name, age: 10),
    );

    await tester.pumpWidget(
      MaterialApp(
        home: greeting,
      ),
    );

    // when
    final Finder textFinder = find.text('Hello $name');

    // then
    expect(textFinder, findsOneWidget);

    final Finder personFinder = find.byKey(const Key('value'));
    expect(personFinder, findsOneWidget);

  });
}
