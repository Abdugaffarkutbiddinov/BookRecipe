import 'package:data_connection_checker_tv/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/features/recipe_book/data/datasources/recipe_card_remote_data_source.dart';
import 'package:recipe_app/features/recipe_book/data/repositories/recipe_card_repository_impl.dart';
import 'package:recipe_app/features/recipe_book/domain/repositories/recipe_card_repository.dart';
import 'package:recipe_app/features/recipe_book/domain/usecases/get_recipe_card_list.dart';
import 'package:recipe_app/features/recipe_book/presentation/bloc/recipe_card_bloc.dart';
import 'package:http/http.dart' as http;
import 'core/network/network_info.dart';

final sl = GetIt.instance;

 init() {
  // Features - Number Trivia
  //Bloc
  sl.registerFactory(() => RecipeCardBloc(getRecipeCardList: sl()
     ));

  // Use Cases
  sl.registerLazySingleton(() => GetRecipeCardList(sl()));

  // Repository
  sl.registerLazySingleton<RecipeCardRepository>(() =>
      RecipeCardRepositoryImpl(
          remoteDataSource: sl(), networkInfo: sl()));
  // Data sources
  sl.registerLazySingleton<RecipeCardRemoteDataSource>(
          () => RecipeCardRemoteDataSourceImpl(client: sl()));
  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
