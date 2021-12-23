import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/features/recipe_book/data/datasources/recipe_card_remote_data_source.dart';
import 'package:recipe_app/features/recipe_book/data/models/recipe_card_model.dart';
import '../../../../fixtures/fixture_reader.dart';
import '../repositories/recipe_card_repository_impl_test.mocks.dart';
import 'recipe_card_remote_data_source_test.mocks.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([http.Client])
void main() {
  final mockHttpClient = MockClient();
  final dataSource = RecipeCardRemoteDataSourceImpl(client: mockHttpClient);

  group('getRecipeCardList', () {
    final tRecipeCardListModel = recipeCardListModelFromJson(fixture('recipe_card_list.json'));
    test('returns an Album if the http call completes successfully', () async {

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(mockHttpClient
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async =>
          http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      expect(await dataSource(mockHttpClient), isA<Album>());
    });

    test('throws an exception if the http call completes with an error', () {

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(mockHttpClient
          .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      expect(fetchAlbum(mockHttpClient), throwsException);
    });
  });


}