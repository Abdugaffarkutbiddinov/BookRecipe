import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';

part 'recipe_card_event.dart';
part 'recipe_card_state.dart';

class RecipeCardBloc extends Bloc<RecipeCardEvent, RecipeCardState> {
  final GetRecipeCardList getRecipeCardList;
  RecipeCardBloc({required this.getRecipeCardList}) : super(RecipeCardInitial()) {
    on<RecipeCardEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
