import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:recipe_app/core/error/exception.dart';
import 'package:recipe_app/features/recipe_book/data/datasources/recipe_card_remote_data_source.dart';
import 'package:recipe_app/features/recipe_book/data/models/recipe_card_model.dart';
import 'recipe_card_remote_data_source_test.mocks.dart';
import 'package:http/http.dart' as http;

@GenerateMocks([], customMocks: [
  MockSpec<http.Client>(as: #MockClient, returnNullOnMissingStub: true),
])
void main() {
  final mockHttpClient = MockClient();
  final dataSource = RecipeCardRemoteDataSourceImpl(client: mockHttpClient);

  group('getRecipeCardList', () {
    final tRecipeCardListModel =
    RecipeCardModel.recipesFromSnapshot([]);
    test('returns an Album if the http call completes successfully', () async {
      when(
        mockHttpClient.get(
          Uri.parse(
            'yummly2.p.rapidapi.com/feeds/list',
          ),
          headers: {
            "x-rapidapi-host": "yummly2.p.rapidapi.com",
            "x-rapidapi-key":
                "6d0dfac699mshddda70281f455dcp133bb7jsnea5daa885baf"
          },
        ),
      ).thenAnswer(
          (_) async => http.Response('{"userId": 1, "id": 2, "title": "mock"}', 200));

      final result = await dataSource.getRecipeCardList();
      expect(result, equals(tRecipeCardListModel));
    });
    test('should throw a ServerException when the response code is 404 or other', () async {
      when(
        mockHttpClient.get(
          Uri.parse(
            'yummly2.p.rapidapi.com/feeds/list',
          ),
          headers: {
            "x-rapidapi-host": "yummly2.p.rapidapi.com",
            "x-rapidapi-key":
            "6d0dfac699mshddda70281f455dcp133bb7jsnea5daa885baf"
          },
        ),
      ).thenAnswer(
              (_) async => http.Response("Something went wrong", 404));
      final call = await dataSource.getRecipeCardList();
      expect(() => call, throwsA(TypeMatcher<ServerException>()));
    });

  });
}
