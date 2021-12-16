import 'dart:convert';

import 'package:recipe_app/features/recipe_book/data/models/recipe_card_model.dart';
import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tRecipeCardModel = RecipeCardModel(
      images: 'test1.url', totalTime: '20min', rating: 3.5, name: 'Plov');

  test(
    'should be a subclass of NumberTrivia entity',
    () async {
      // assert
      expect(tRecipeCardModel, isA<RecipeCard>());
    },
  );

  group('fromJson', () {
    // test('Should return a valid model when the JSON number is an integer', () async{
    //   final Map<String,dynamic> jsonMap = json.decode(fixture('recipe_card.json'));
    //   final result = RecipeCardModel.fromJson(jsonMap);
    //   expect(result, tRecipeCardModel);
    // });
    test('Should return a valid model when the JSON number is a double', () async{
      final Map<String,dynamic> jsonMap = json.decode(fixture('recipe_card.json'));
      final result = RecipeCardModel.fromJson(jsonMap);
      expect(result, tRecipeCardModel);
    });
  });
  group('toJson', () {test('should return Json containing proper data', () async{
    final result = tRecipeCardModel.toJson();
    final expectedMap = {
      "name": "Plov",
      "images":"test1.url",
      "rating":  3.5,
      "totalTime": "20min"
    };
    expect(result, expectedMap);
  }); });
}
