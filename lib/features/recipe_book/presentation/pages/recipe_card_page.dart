import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';
import 'package:recipe_app/features/recipe_book/presentation/bloc/recipe_card_bloc.dart';
import 'package:recipe_app/features/recipe_book/presentation/widgets/list_row.dart';
import 'package:recipe_app/features/recipe_book/presentation/widgets/loading_custom.dart';
import 'package:recipe_app/features/recipe_book/presentation/widgets/message_display.dart';

import '../../../../injection_container.dart';

class RecipeCardPage extends StatefulWidget {
  const RecipeCardPage({Key? key}) : super(key: key);

  @override
  State<RecipeCardPage> createState() => _RecipeCardPageState();
}

class _RecipeCardPageState extends State<RecipeCardPage> {
  @override
  void initState() {
    // TODO: implement initState
    _loadAlbums();
  }

  _loadAlbums() async {
    context.read<RecipeCardBloc>().add(GetRecipeForCardList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }

  _body() {
    return Column(
      children: [
        BlocBuilder<RecipeCardBloc, RecipeCardState>(
            builder: (BuildContext context, RecipeCardState state) {
          if (state is Error) {
            return MessageDisplay(message: state.message);
          }
          if (state is Loaded) {
            List<RecipeCard> albums = state.recipeCardList;
            return _list(albums);
          }
          return LoadingCustom();
        }),
      ],
    );
  }

  Widget _list(List<RecipeCard> albums) {
    return Expanded(
      child: ListView.builder(itemBuilder: (_, index) {
        RecipeCard recipeCards = albums[index];
        return ListRow(recipeCards: recipeCards);
      }),
    );
  }
}
