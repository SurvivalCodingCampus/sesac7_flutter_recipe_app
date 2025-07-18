import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/person_repository.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/main/main_state.dart';

class MainViewModel with ChangeNotifier {
  final PersonRepository _personRepository;

  MainViewModel({
    required PersonRepository personRepository,
  }) : _personRepository = personRepository;

  // 변수
  MainState _state = const MainState();

  MainState get state => _state;

  // ViewModel 에서는 리턴 하지 마라. get 말고 fetch
  Future<void> fetchPersonData() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    _state = state.copyWith(
      name: await _personRepository.getName(),
      age: await _personRepository.getAge(),
      isLoading: false,
    );
    notifyListeners();
  }

  void setScore(int score) {
    _state = state.copyWith(score: score);
    notifyListeners();
  }

  void incrementCount() {
    _state = state.copyWith(count: state.count + 1);
    notifyListeners();
  }
}
