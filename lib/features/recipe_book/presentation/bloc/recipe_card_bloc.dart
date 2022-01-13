import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/core/error/failures.dart';
import 'package:recipe_app/core/usecases/usecase.dart';
import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';
import 'package:recipe_app/features/recipe_book/domain/usecases/get_recipe_card_list.dart';

part 'recipe_card_event.dart';

part 'recipe_card_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';

class RecipeCardBloc extends Bloc<RecipeCardEvent, RecipeCardState> {
  final GetRecipeCardList getRecipeCardList;

  RecipeCardBloc({required this.getRecipeCardList})
      : super(RecipeCardInitial()) {
    on<RecipeCardEvent>((event, emit) async {
      emit(Loading());
      final failureOrRecipeCardList = await getRecipeCardList(NoParams());
       emit(_eitherLoadedOrErrorState(failureOrRecipeCardList));
    });
  }

  RecipeCardState _eitherLoadedOrErrorState(
    Either<Failure, List<RecipeCard>> failureOrRecipeCardList,
  ) {
    return failureOrRecipeCardList.fold(
        (failure) => Error(message: _mapFailureToMessage(failure)),
        (recipeCardList) => Loaded(recipeCardList: recipeCardList));
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      default:
        return 'HEYOOOOOOOOOO';
    }
  }
}
