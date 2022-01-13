part of 'recipe_card_bloc.dart';

abstract class RecipeCardEvent extends Equatable {
  const RecipeCardEvent();
}

class GetRecipeForCardList implements RecipeCardEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}