import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/data/repository/person_repository.dart';

class MainViewModel with ChangeNotifier {
  PersonRepository _personRepository;

  MainViewModel({
    required PersonRepository personRepository,
  }) : _personRepository = personRepository;

  int _count = 0;
  int _score = 0;
  int _age = 0;
  String _name = '이름 없음';
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  String get name => _name;

  int get count => _count;

  int get score => _score;

  int get age => _age;

  // ViewModel 에서는 리턴 하지 마라. get 말고 fetch
  Future<void> fetchPersonData() async {
    _isLoading = true;
    notifyListeners();

    _name = await _personRepository.getName();
    _age = await _personRepository.getAge();
    _isLoading = false;
    notifyListeners();
  }

  void setScore(int score) {
    _score = score;
    notifyListeners();
  }

  void incrementCount() {
    _count++;
    notifyListeners();
  }
}
