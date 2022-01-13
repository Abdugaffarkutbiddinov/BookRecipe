import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/error/exception.dart';
import 'package:recipe_app/core/error/failures.dart';
import 'package:recipe_app/core/network/network_info.dart';
import 'package:recipe_app/features/recipe_book/data/datasources/recipe_card_remote_data_source.dart';
import 'package:recipe_app/features/recipe_book/data/models/recipe_card_model.dart';
import 'package:recipe_app/features/recipe_book/data/repositories/recipe_card_repository_impl.dart';
import 'package:recipe_app/features/recipe_book/domain/entities/recipe_card.dart';
import 'package:mockito/annotations.dart';
import 'recipe_card_repository_impl_test.mocks.dart';

@GenerateMocks([RecipeCardRemoteDataSource, NetworkInfo])
void main() {
  final mockNetworkInfo = MockNetworkInfo();
  final mockRemoteDataSource = MockRecipeCardRemoteDataSource();
  final repository = RecipeCardRepositoryImpl(
      remoteDataSource: mockRemoteDataSource, networkInfo: mockNetworkInfo);

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }
  group('getRecipeCardList', () {
    final tRecipeCardModelOne = RecipeCardModel(images: 'test1.url', totalTime: '20min', rating: 3.5, name: 'Plov');
    final tRecipeCardModelTwo = RecipeCardModel(images: 'test2.url', totalTime: '25min', rating: 4.5, name: 'Salmon');
    final tRecipeCardModelList = [tRecipeCardModelOne,tRecipeCardModelTwo];
    final List<RecipeCard> tRecipeCardList = tRecipeCardModelList;

    // test('should check if the device is online', () async {
    //   when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
    //   repository.getRecipeCardList();
    //   verify(mockNetworkInfo.isConnected);
    // });
    runTestsOnline(() {

      test(
          'should return remote data when the call to remote data source is successful',
              () async {
            when(mockRemoteDataSource.getRecipeCardList())
                .thenAnswer((_) async => tRecipeCardModelList);
            final result = await repository.getRecipeCardList();
            verify(mockRemoteDataSource.getRecipeCardList());
            expect(result, equals(Right(tRecipeCardList)));
          });

      test(
          'should return remote data when the call to remote data source is successful',
              () async {
            when(mockRemoteDataSource.getRecipeCardList())
                .thenAnswer((_) async => tRecipeCardModelList);
            await repository.getRecipeCardList();
            verify(mockRemoteDataSource.getRecipeCardList());
          });

      test(
          'should return server failure when the call to remote data source is unsuccessful',
              () async {
            when(mockRemoteDataSource.getRecipeCardList())
                .thenThrow(ServerException());
            final result = await repository.getRecipeCardList();
            verify(mockRemoteDataSource.getRecipeCardList());
            expect(result, equals(Left(ServerFailure())));
          });
    });
  });

}

