import 'package:mockito/annotations.dart';
import 'package:recipe_app/features/recipe_book/domain/usecases/get_recipe_card_list.dart';
import 'package:recipe_app/features/recipe_book/presentation/bloc/recipe_card_bloc.dart';
import 'recipe_card_bloc_test.mocks.dart';


@GenerateMocks([GetRecipeCardList])
void main() {
  final mockGetRecipeCardList = MockGetRecipeCardList();
  final bloc = RecipeCardBloc(getRecipeCardList: mockGetRecipeCardList);
}