// Mocks generated by Mockito 5.0.17 from annotations
// in core/test/presentation/blocs/movies/watchlist_status/watchlist_status_bloc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:core/domain/entities/movie_detail.dart' as _i8;
import 'package:core/domain/repositories/movie_repository.dart' as _i2;
import 'package:core/domain/usecases/get_movie_watchlist_status.dart' as _i4;
import 'package:core/domain/usecases/remove_movie_watchlist.dart' as _i9;
import 'package:core/domain/usecases/save_movie_watchlist.dart' as _i6;
import 'package:core/utils/failure.dart' as _i7;
import 'package:dartz/dartz.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeMovieRepository_0 extends _i1.Fake implements _i2.MovieRepository {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [GetMovieWatchlistStatus].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetMovieWatchlistStatus extends _i1.Mock
    implements _i4.GetMovieWatchlistStatus {
  MockGetMovieWatchlistStatus() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_0()) as _i2.MovieRepository);
  @override
  _i5.Future<bool> execute(int? id) =>
      (super.noSuchMethod(Invocation.method(#execute, [id]),
          returnValue: Future<bool>.value(false)) as _i5.Future<bool>);
}

/// A class which mocks [SaveMovieWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockSaveMovieWatchlist extends _i1.Mock
    implements _i6.SaveMovieWatchlist {
  MockSaveMovieWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_0()) as _i2.MovieRepository);
  @override
  _i5.Future<_i3.Either<_i7.Failure, String>> execute(_i8.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#execute, [movie]),
              returnValue: Future<_i3.Either<_i7.Failure, String>>.value(
                  _FakeEither_1<_i7.Failure, String>()))
          as _i5.Future<_i3.Either<_i7.Failure, String>>);
}

/// A class which mocks [RemoveMovieWatchlist].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoveMovieWatchlist extends _i1.Mock
    implements _i9.RemoveMovieWatchlist {
  MockRemoveMovieWatchlist() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.MovieRepository get repository =>
      (super.noSuchMethod(Invocation.getter(#repository),
          returnValue: _FakeMovieRepository_0()) as _i2.MovieRepository);
  @override
  _i5.Future<_i3.Either<_i7.Failure, String>> execute(_i8.MovieDetail? movie) =>
      (super.noSuchMethod(Invocation.method(#execute, [movie]),
              returnValue: Future<_i3.Either<_i7.Failure, String>>.value(
                  _FakeEither_1<_i7.Failure, String>()))
          as _i5.Future<_i3.Either<_i7.Failure, String>>);
}
