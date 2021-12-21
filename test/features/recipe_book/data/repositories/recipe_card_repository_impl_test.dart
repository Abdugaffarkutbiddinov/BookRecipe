import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/network/network_info.dart';
import 'package:recipe_app/features/recipe_book/data/datasources/recipe_card_remote_data_source.dart';
import 'package:recipe_app/features/recipe_book/data/repositories/recipe_card_repository_impl.dart';
import 'package:mockito/annotations.dart';
import 'recipe_card_repository_impl_test.mocks.dart';

@GenerateMocks([RecipeCardRemoteDataSource, NetworkInfo])
void main() {
  final mockNetworkInfo = MockNetworkInfo();
  final mockRemoteDataSource = MockRemoteDataSource();
  final repository = RecipeCardRepositoryImpl(
      remoteDataSource: mockRemoteDataSource, networkInfo: mockNetworkInfo);
}
