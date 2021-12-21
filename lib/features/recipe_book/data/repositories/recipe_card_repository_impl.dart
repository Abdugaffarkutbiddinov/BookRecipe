import 'package:dartz/dartz.dart';
import 'package:recipe_app/core/error/failures.dart';
import 'package:recipe_app/core/network/network_info.dart';
import 'package:recipe_app/features/recipe_book/data/datasources/recipe_card_remote_data_source.dart';
import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';
import 'package:recipe_app/features/recipe_book/domain/repositories/recipe_card_repository.dart';

class RecipeCardRepositoryImpl implements RecipeCardRepository {
  final RecipeCardRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  RecipeCardRepositoryImpl(
      {required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, List<RecipeCard>>> getRecipeCardList() {
    // TODO: implement getRecipeCardList
    throw UnimplementedError();
  }
}
