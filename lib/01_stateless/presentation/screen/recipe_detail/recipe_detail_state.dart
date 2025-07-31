enum RecipeTab { ingredient, procedure }

class RecipeDetailState {
  final RecipeTab selectedTab;
  final bool isBookmarked;
  final bool isFollowing;
  final bool isLoading;

  const RecipeDetailState({
    this.selectedTab = RecipeTab.ingredient,
    this.isBookmarked = false,
    this.isFollowing = false,
    this.isLoading = false,
  });

  RecipeDetailState copyWith({
    RecipeTab? selectedTab,
    bool? isBookmarked,
    bool? isFollowing,
    bool? isLoading,
  }) {
    return RecipeDetailState(
      selectedTab: selectedTab ?? this.selectedTab,
      isBookmarked: isBookmarked ?? this.isBookmarked,
      isFollowing: isFollowing ?? this.isFollowing,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
