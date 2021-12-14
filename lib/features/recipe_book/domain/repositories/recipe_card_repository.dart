import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failures.dart';
import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';

abstract class RecipeCardRepository {
  Future<Either<Failure, List<RecipeCard>>> getRecipeCardList();
}