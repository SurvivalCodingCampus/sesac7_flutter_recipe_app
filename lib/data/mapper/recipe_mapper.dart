
import '../dto/recipe_dto.dart';

extension RecipeMapper on RecipeDto{
  Recipes toModel(){
    return Recipes(
      id: (id ?? -1).toInt(),
      name: name ?? 'no name',
      category: category ?? 'no category',
      image: image ?? '',
      chef: chef ?? 'no chef',
      time: time ?? '',
      rating: (rating ?? 0.0).toDouble(),
    );
  }
}
