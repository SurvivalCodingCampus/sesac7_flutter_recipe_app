import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// =============================================================
// Main Entry Point
// =============================================================
void main() {
  runApp(const MyApp());
}

// =============================================================
// App Root Widget
// =============================================================
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp.router를 사용하여 GoRouter와 연동
    return MaterialApp.router(
      routerConfig: router, // 라우터 설정을 전달
      debugShowCheckedModeBanner: false,
      title: 'Recipe App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

// =============================================================
// Data Models
// =============================================================
class Recipe {
  final String imageUrl;
  final String recipeName;
  final String chefName;
  final double? rating;
  final String cookingTime;

  Recipe({
    required this.imageUrl,
    required this.recipeName,
    required this.chefName,
    this.rating,
    required this.cookingTime,
  });
}

// =============================================================
// State Class
// =============================================================
class SavedRecipesState {
  final List<Recipe> recipes;

  SavedRecipesState({this.recipes = const []});

  SavedRecipesState copyWith({List<Recipe>? recipes}) {
    return SavedRecipesState(
      recipes: recipes ?? this.recipes,
    );
  }
}

// =============================================================
// ViewModel
// =============================================================
class SavedRecipesViewModel extends ChangeNotifier {
  SavedRecipesState _state = SavedRecipesState();

  SavedRecipesState get state => _state;

  void fetchRecipes() {
    final newRecipes = [
      Recipe(
        imageUrl:
            'https://images.unsplash.com/photo-1615937691194-97dbd3f3dc29?q=80&w=1964&auto=format&fit=crop',
        recipeName: 'Traditional spare ribs baked',
        chefName: 'By Chef John',
        rating: 4.0,
        cookingTime: '20 min',
      ),
      Recipe(
        imageUrl:
            'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?q=80&w=1981&auto=format&fit=crop',
        recipeName: 'Spice roasted chicken with flavored rice',
        chefName: 'By Maria Kelvin',
        rating: 4.5,
        cookingTime: '30 min',
      ),
      Recipe(
        imageUrl:
            'https://images.unsplash.com/photo-1512621776951-a57141f2eefd?q=80&w=2070&auto=format&fit=crop',
        recipeName: 'Spicy fried rice mix chicken bali',
        chefName: 'By Spicy Nelly',
        rating: null,
        cookingTime: '25 min',
      ),
      Recipe(
        imageUrl:
            'https://images.unsplash.com/photo-1484723050470-6b1d3b2a3a2b?q=80&w=2070&auto=format&fit=crop',
        recipeName: 'Lamb chops with fruity couscous',
        chefName: 'By Fruity Lamb',
        rating: 3.0,
        cookingTime: '35 min',
      ),
    ];
    _state = _state.copyWith(recipes: newRecipes);
    notifyListeners();
  }
}

// =============================================================
// Reusable Widgets
// =============================================================
class RecipeCard extends StatefulWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  bool _isBookmarked = false;

  Widget _buildRatingBadge() {
    final rating = widget.recipe.rating;
    if (rating != null && rating > 0) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: Colors.amber,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.star, color: Colors.white, size: 16),
            const SizedBox(width: 4),
            Text(
              rating.toString(),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      );
    }
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(Icons.star_border, color: Colors.white, size: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameParts = widget.recipe.recipeName.split(' ');
    final recipeTitle = nameParts.length > 2
        ? nameParts.sublist(0, nameParts.length - 1).join(' ')
        : widget.recipe.recipeName;
    final recipeSubtitle = nameParts.length > 2 ? nameParts.last : '';
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0)),
      elevation: 5.0,
      child: AspectRatio(
        aspectRatio: 16 / 10.5,
        child: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                widget.recipe.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.broken_image, color: Colors.grey),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.9)],
                    stops: const [0.4, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(top: 16.0, right: 16.0, child: _buildRatingBadge()),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipeTitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      recipeSubtitle,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.recipe.chefName,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14.0,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        const Spacer(),
                        const Icon(
                          Icons.access_time_rounded,
                          color: Colors.white,
                          size: 22,
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          widget.recipe.cookingTime,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        GestureDetector(
                          onTap: () =>
                              setState(() => _isBookmarked = !_isBookmarked),
                          child: Container(
                            padding: const EdgeInsets.all(10.0),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              _isBookmarked
                                  ? Icons.bookmark
                                  : Icons.bookmark_border_outlined,
                              color: _isBookmarked
                                  ? Colors.green[600]
                                  : Colors.grey[700],
                              size: 26.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// =============================================================
// Screens
// =============================================================
class SavedRecipesScreen extends StatefulWidget {
  final SavedRecipesViewModel viewModel;

  const SavedRecipesScreen({super.key, required this.viewModel});

  @override
  State<SavedRecipesScreen> createState() => _SavedRecipesScreenState();
}

class _SavedRecipesScreenState extends State<SavedRecipesScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewModel.fetchRecipes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved recipes'),
      ),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (BuildContext context, Widget? child) {
          final recipes = widget.viewModel.state.recipes;
          return ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: recipes.length,
            itemBuilder: (BuildContext context, int index) {
              final recipe = recipes[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: RecipeCard(recipe: recipe),
              );
            },
          );
        },
      ),
    );
  }
}

class ShellScreen extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const ShellScreen({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            activeIcon: Icon(Icons.bookmark),
            label: 'Saved',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            activeIcon: Icon(Icons.notifications),
            label: 'Alerts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        selectedItemColor: Colors.green[600],
        unselectedItemColor: Colors.grey[600],
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}

// =============================================================
// Router Configuration
// =============================================================
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final savedRecipesViewModel = SavedRecipesViewModel();

final router = GoRouter(
  initialLocation: '/saved',
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ShellScreen(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/home',
              builder: (context, state) =>
                  const Center(child: Text('Home Screen')),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/saved',
              builder: (context, state) {
                return SavedRecipesScreen(viewModel: savedRecipesViewModel);
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/notifications',
              builder: (context, state) =>
                  const Center(child: Text('Notifications Screen')),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) =>
                  const Center(child: Text('Profile Screen')),
            ),
          ],
        ),
      ],
    ),
  ],
);
