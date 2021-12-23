import 'package:recipe_app/core/error/exception.dart';
import 'package:recipe_app/features/recipe_book/data/models/recipe_card_model.dart';
import 'package:http/http.dart' as http;
abstract class RecipeCardRemoteDataSource {
  Future<List<RecipeCardModel>> getRecipeCardList();
}

class RecipeCardRemoteDataSourceImpl implements RecipeCardRemoteDataSource {
  final http.Client client;
  RecipeCardRemoteDataSourceImpl({required this.client});

  static const _baseUrl = 'yummly2.p.rapidapi.com';
  static const String _GET_RECIPE_CARD_LIST = '/feeds/list';
  @override
  Future<List<RecipeCardModel>> getRecipeCardList() async{
    var uri = Uri.https(_baseUrl, _GET_RECIPE_CARD_LIST,{"limit": "18", "start": "0", "tag": "list.recipe.popular"});
    final response = await client.get(
      uri,headers: {
      "x-rapidapi-host": "yummly2.p.rapidapi.com",
      "x-rapidapi-key": "6d0dfac699mshddda70281f455dcp133bb7jsnea5daa885baf"
    }
    );
    if (response.statusCode == 200) {
      return recipeCardListModelFromJson(response.body);
    } else {
      throw ServerException();
    }
  }

}