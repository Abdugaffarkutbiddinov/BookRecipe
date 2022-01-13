import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/features/recipe_book/presentation/pages/recipe_card_page.dart';
import 'features/recipe_book/presentation/bloc/recipe_card_bloc.dart';
import 'injection_container.dart' as di;

import 'features/recipe_book/data/datasources/recipe_card_remote_data_source.dart';
import 'injection_container.dart';

void main() async {
  await di.init();
  runApp(
      const MyApp(key: null,)
  );
}

class MyApp extends StatelessWidget {
  const MyApp({required Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => sl<RecipeCardBloc>(),
        child: RecipeCardPage(),
      ),
    );
  }
}

