import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/01_stateless/presentation/screen/search_recipes/search_recipes_state.dart';

import '../../../data/model/recipe.dart';

class SearchRecipesViewModel with ChangeNotifier {
  SearchRecipesState _state = SearchRecipesState(
    originalRecipes: [
      Recipe(
        category: '한식',
        id: 1,
        name: '김치찌개',
        imageUrl: 'https://images.unsplash.com/photo-1576577883395-c4a45a103c5a',
        chef: '백종원',
        time: '30분',
        rating: 5,
      ),
      Recipe(
        category: '양식',
        id: 2,
        name: '까르보나라 파스타',
        imageUrl: 'https://images.unsplash.com/photo-1588013273468-4113a4ea1b21',
        chef: '고든 램지',
        time: '25분',
        rating: 4,
      ),
      Recipe(
        category: '중식',
        id: 3,
        name: '마파두부',
        imageUrl: 'https://images.unsplash.com/photo-1599320872118-634a1c62f283',
        chef: '이연복',
        time: '20분',
        rating: 5,
      ),
      Recipe(
        category: '일식',
        id: 4,
        name: '초밥',
        imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c',
        chef: '지브리 스튜디오',
        time: '1시간',
        rating: 5,
      ),
      Recipe(
        category: '멕시칸',
        id: 5,
        name: '타코',
        imageUrl: 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b',
        chef: '마리아',
        time: '40분',
        rating: 4,
      ),
      Recipe(
        category: '베이킹',
        id: 6,
        name: '초코칩 쿠키',
        imageUrl: 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e',
        chef: '파티시에 유민주',
        time: '1시간 30분',
        rating: 5,
      ),
      Recipe(
        category: '샐러드',
        id: 7,
        name: '리코타 치즈 샐러드',
        imageUrl: 'https://images.unsplash.com/photo-1551248429-40974aa41727',
        chef: '제이미 올리버',
        time: '15분',
        rating: 4,
      ),
      Recipe(
        category: '분식',
        id: 8,
        name: '떡볶이',
        imageUrl: 'https://images.unsplash.com/photo-1622234991054-005d5e3f4f1d',
        chef: '김밥천국',
        time: '20분',
        rating: 5,
      ),
      Recipe(
        category: '동남아',
        id: 9,
        name: '팟타이',
        imageUrl: 'https://images.unsplash.com/photo-1563245372-f217240f075d',
        chef: '차차',
        time: '30분',
        rating: 4,
      ),
      Recipe(
        category: '건강식',
        id: 10,
        name: '닭가슴살 현미밥',
        imageUrl: 'https://images.unsplash.com/photo-1511690656952-34342bb7c2f2',
        chef: '헬스트레이너 핏블리',
        time: '35분',
        rating: 3,
      ),
    ],
    filteredRecipes: [
      Recipe(
        category: '한식',
        id: 1,
        name: '김치찌개',
        imageUrl: 'https://images.unsplash.com/photo-1576577883395-c4a45a103c5a',
        chef: '백종원',
        time: '30분',
        rating: 5,
      ),
      Recipe(
        category: '양식',
        id: 2,
        name: '까르보나라 파스타',
        imageUrl: 'https://images.unsplash.com/photo-1588013273468-4113a4ea1b21',
        chef: '고든 램지',
        time: '25분',
        rating: 4,
      ),
      Recipe(
        category: '중식',
        id: 3,
        name: '마파두부',
        imageUrl: 'https://images.unsplash.com/photo-1599320872118-634a1c62f283',
        chef: '이연복',
        time: '20분',
        rating: 5,
      ),
      Recipe(
        category: '일식',
        id: 4,
        name: '초밥',
        imageUrl: 'https://images.unsplash.com/photo-1579871494447-9811cf80d66c',
        chef: '지브리 스튜디오',
        time: '1시간',
        rating: 5,
      ),
      Recipe(
        category: '멕시칸',
        id: 5,
        name: '타코',
        imageUrl: 'https://images.unsplash.com/photo-1551504734-5ee1c4a1479b',
        chef: '마리아',
        time: '40분',
        rating: 4,
      ),
      Recipe(
        category: '베이킹',
        id: 6,
        name: '초코칩 쿠키',
        imageUrl: 'https://images.unsplash.com/photo-1499636136210-6f4ee915583e',
        chef: '파티시에 유민주',
        time: '1시간 30분',
        rating: 5,
      ),
      Recipe(
        category: '샐러드',
        id: 7,
        name: '리코타 치즈 샐러드',
        imageUrl: 'https://images.unsplash.com/photo-1551248429-40974aa41727',
        chef: '제이미 올리버',
        time: '15분',
        rating: 4,
      ),
      Recipe(
        category: '분식',
        id: 8,
        name: '떡볶이',
        imageUrl: 'https://images.unsplash.com/photo-1622234991054-005d5e3f4f1d',
        chef: '김밥천국',
        time: '20분',
        rating: 5,
      ),
      Recipe(
        category: '동남아',
        id: 9,
        name: '팟타이',
        imageUrl: 'https://images.unsplash.com/photo-1563245372-f217240f075d',
        chef: '차차',
        time: '30분',
        rating: 4,
      ),
      Recipe(
        category: '건강식',
        id: 10,
        name: '닭가슴살 현미밥',
        imageUrl: 'https://images.unsplash.com/photo-1511690656952-34342bb7c2f2',
        chef: '헬스트레이너 핏블리',
        time: '35분',
        rating: 3,
      ),
    ],
  );

  SearchRecipesState get state => _state;

  void search(String query) {
    final filteredRecipes = state.originalRecipes
        .where(
          (e) =>
              e.name.toLowerCase().contains(query.toLowerCase()) ||
              e.chef.toLowerCase().contains(query.toLowerCase()),
        )
        .toList();

    _state = state.copyWith(
      query: query,
      searchLabel: state.originalRecipes.length == filteredRecipes.length
          ? 'Recent Search'
          : 'Search Result',
      filteredRecipes: filteredRecipes,
      resultLabel: '${filteredRecipes.length} results',
    );
    notifyListeners();
  }
}
