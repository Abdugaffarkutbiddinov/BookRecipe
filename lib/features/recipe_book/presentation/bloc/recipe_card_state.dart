part of 'recipe_card_bloc.dart';

abstract class RecipeCardState extends Equatable {
  const RecipeCardState();
}

class RecipeCardInitial extends RecipeCardState {
  @override
  List<Object> get props => [];
}

class Loading extends RecipeCardState {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class Loaded extends RecipeCardEvent {
  final List<RecipeCard> recipeCardList;
  Loaded({required this.recipeCardList});
  @override
  List<Object?> get props => [recipeCardList];
}

class Error extends RecipeCardEvent {
  final String message;
  Error({required this.message});
  @override
  // TODO: implement props
  List<Object?> get props => [message];

}
