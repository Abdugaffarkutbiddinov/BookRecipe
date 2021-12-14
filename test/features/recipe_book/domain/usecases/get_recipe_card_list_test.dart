
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/usecases/usecase.dart';
import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';
import 'package:recipe_app/features/recipe_book/domain/repositories/recipe_card_repository.dart';
import 'package:recipe_app/features/recipe_book/domain/usecases/get_recipe_card_list.dart';
// new imports
import 'package:mockito/annotations.dart';
import 'get_recipe_card_list_test.mocks.dart';

// new annotation
@GenerateMocks([RecipeCardRepository])
void main() {
  // initialization outside of setUp
  final tRecipeCardOne = RecipeCard(images: 'test1.url', totalTime: '20min', rating: '3.5', name: 'Plov');
  final tRecipeCardTwo = RecipeCard(images: 'test2.url', totalTime: '25min', rating: '4.5', name: 'Salmon');
  final tListRecipeCard = [tRecipeCardOne,tRecipeCardTwo];
  final mockRecipeCardRepository = MockRecipeCardRepository();
  final GetRecipeCardList usecase = GetRecipeCardList(mockRecipeCardRepository);

  test('should get recipe card list from the repo', () async {
    // arrange
    when(mockRecipeCardRepository.getRecipeCardList()).thenAnswer((_) async => Right(tListRecipeCard));
    // act
    final result = await usecase.call(NoParams());
    // assert
    expect(result, Right(tListRecipeCard));
    verify(mockRecipeCardRepository.getRecipeCardList());
    verifyNoMoreInteractions(mockRecipeCardRepository);
  },);
}
