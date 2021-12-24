import 'dart:convert';

import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';

List<RecipeCardModel> recipeCardListModelFromJson(String str) =>
    List<RecipeCardModel>.from(
        json.decode(str).map((x) => RecipeCardModel.fromJson(x)));

String recipeCardListToJson(List<RecipeCardModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// TODO Convert images to json
class RecipeCardModel extends RecipeCard {
  RecipeCardModel(
      {required name, required images, required rating, required totalTime})
      : super(images: images, name: name, rating: rating, totalTime: totalTime);

  factory RecipeCardModel.fromJson(Map<String, dynamic> json) {
    return RecipeCardModel(
      name: json['name'] as String,
      images: json['images'][0]['hostedLargeUrl'] as String,
      rating: json['rating'] as double,
      totalTime: json['totalTime'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        "name": name,
        "images": images,
        "rating": rating,
        "totalTime": totalTime,
      };

  static List<RecipeCardModel> recipesFromSnapshot(List snapshot) {
    return snapshot.map((data) {
      return RecipeCardModel.fromJson(data);
    }).toList();
  }
}
