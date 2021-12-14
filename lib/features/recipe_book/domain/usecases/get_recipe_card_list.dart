import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failures.dart';
import 'package:recipe_app/core/usecases/usecase.dart';
import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';
import 'package:recipe_app/features/recipe_book/domain/repositories/recipe_card_repository.dart';

class GetRecipeCardList extends UseCase<List<RecipeCard>, NoParams> {
  final RecipeCardRepository repository;

  GetRecipeCardList(this.repository);

  @override
  Future<Either<Failure, List<RecipeCard>>> call(NoParams params) async {
    return await repository.getRecipeCardList();
  }
}