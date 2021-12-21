import 'package:recipe_app/features/recipe_book/data/models/recipe_card_model.dart';

abstract class RecipeCardRemoteDataSource {
  Future<RecipeCardModel> getRecipeCardList();
}
