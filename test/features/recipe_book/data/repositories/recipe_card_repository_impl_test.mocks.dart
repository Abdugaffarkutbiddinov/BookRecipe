// Mocks generated by Mockito 5.0.16 from annotations
// in recipe_app/test/features/recipe_book/data/repositories/recipe_card_repository_impl_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:mockito/mockito.dart' as _i1;
import 'package:recipe_app/core/network/network_info.dart' as _i5;
import 'package:recipe_app/features/recipe_book/data/datasources/recipe_card_remote_data_source.dart'
    as _i2;
import 'package:recipe_app/features/recipe_book/data/models/recipe_card_model.dart'
    as _i4;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [RecipeCardRemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRecipeCardRemoteDataSource extends _i1.Mock
    implements _i2.RecipeCardRemoteDataSource {
  MockRecipeCardRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<List<_i4.RecipeCardModel>> getRecipeCardList() =>
      (super.noSuchMethod(Invocation.method(#getRecipeCardList, []),
              returnValue: Future<List<_i4.RecipeCardModel>>.value(
                  <_i4.RecipeCardModel>[]))
          as _i3.Future<List<_i4.RecipeCardModel>>);
  @override
  String toString() => super.toString();
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i5.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Future<bool> get isConnected =>
      (super.noSuchMethod(Invocation.getter(#isConnected),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  String toString() => super.toString();
}