import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
// TODO Should i add List<BookRecipeCard>
class RecipeCard extends Equatable {
  final String name;
  final String images;
  final String rating;
  final String totalTime;

  RecipeCard(
      {required this.name,
      required this.images,
      required this.rating,
      required this.totalTime});

  @override
  // TODO: implement props
  List<Object> get props => [name, images, rating, totalTime];
}
