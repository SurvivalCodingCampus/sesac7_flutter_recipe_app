import 'package:flutter_recipe_app/01_stateless/domain/repository/person_repository.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/main/main_view_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'main_view_model_test.mocks.dart';

@GenerateMocks([PersonRepository])
void main() {
  late MainViewModel viewModel;
  late PersonRepository personRepository;

  setUp(() {
    personRepository = MockPersonRepository();
    viewModel = MainViewModel(personRepository: personRepository);
  });

  test('카운트가 1 증가해야 한다', () {
    viewModel.incrementCount();
    expect(viewModel.count, 1);
  });

  test('점수가 설정되어야 한다', () {
    const score = 99;
    viewModel.setScore(score);
    expect(viewModel.score, score);
  });

  group('사용자 정보 가져오기', () {
    test('로딩 상태가 true에서 false로 변경되어야 한다', () async {
      when(personRepository.getName()).thenAnswer((_) async => '홍길동');
      when(personRepository.getAge()).thenAnswer((_) async => 30);

      final future = viewModel.fetchPersonData();

      expect(viewModel.isLoading, isTrue);

      await future;

      expect(viewModel.isLoading, isFalse);
    });

    test('이름과 나이를 가져와야 한다', () async {
      const name = '홍길동';
      const age = 30;
      when(personRepository.getName()).thenAnswer((_) async => name);
      when(personRepository.getAge()).thenAnswer((_) async => age);

      await viewModel.fetchPersonData();

      expect(viewModel.name, name);
      expect(viewModel.age, age);
    });

    test('로딩 상태가 변경될 때 리스너에게 알려야 한다', () async {
      when(personRepository.getName()).thenAnswer((_) async => '홍길동');
      when(personRepository.getAge()).thenAnswer((_) async => 30);

      final listenerCallCount = <int>[];
      viewModel.addListener(() {
        listenerCallCount.add(viewModel.isLoading ? 1 : 0);
      });

      await viewModel.fetchPersonData();

      expect(listenerCallCount, [1, 0]);
    });
  });
}