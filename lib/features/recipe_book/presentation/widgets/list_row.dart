
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';

class ListRow extends StatelessWidget {
  final RecipeCard recipeCards;

  const ListRow({Key? key, required this.recipeCards}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(recipeCards.name,style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),),
        ],
      ),
    );
  }
}
