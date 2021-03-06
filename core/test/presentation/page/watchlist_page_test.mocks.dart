// Mocks generated by Mockito 5.0.17 from annotations
// in core/test/presentation/page/watchlist_page_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;

import 'package:core/core.dart' as _i2;
import 'package:flutter_bloc/flutter_bloc.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeGetWatchlistMoviesState_0 extends _i1.Fake
    implements _i2.GetWatchlistMoviesState {}

class _FakeGetWatchlistTvState_1 extends _i1.Fake
    implements _i2.GetWatchlistTvState {}

/// A class which mocks [GetWatchlistMoviesBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistMoviesBloc extends _i1.Mock
    implements _i2.GetWatchlistMoviesBloc {
  MockGetWatchlistMoviesBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetWatchlistMoviesState get state =>
      (super.noSuchMethod(Invocation.getter(#state),
              returnValue: _FakeGetWatchlistMoviesState_0())
          as _i2.GetWatchlistMoviesState);
  @override
  _i3.Stream<_i2.GetWatchlistMoviesState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i2.GetWatchlistMoviesState>.empty())
          as _i3.Stream<_i2.GetWatchlistMoviesState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void add(_i2.GetWatchlistMoviesEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i2.GetWatchlistMoviesEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i2.GetWatchlistMoviesState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i2.GetWatchlistMoviesEvent>(
          _i4.EventHandler<E, _i2.GetWatchlistMoviesState>? handler,
          {_i4.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i4.Transition<_i2.GetWatchlistMoviesEvent,
                  _i2.GetWatchlistMoviesState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  void onChange(_i4.Change<_i2.GetWatchlistMoviesState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
}

/// A class which mocks [GetWatchlistTvBloc].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetWatchlistTvBloc extends _i1.Mock
    implements _i2.GetWatchlistTvBloc {
  MockGetWatchlistTvBloc() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.GetWatchlistTvState get state => (super.noSuchMethod(
      Invocation.getter(#state),
      returnValue: _FakeGetWatchlistTvState_1()) as _i2.GetWatchlistTvState);
  @override
  _i3.Stream<_i2.GetWatchlistTvState> get stream =>
      (super.noSuchMethod(Invocation.getter(#stream),
              returnValue: Stream<_i2.GetWatchlistTvState>.empty())
          as _i3.Stream<_i2.GetWatchlistTvState>);
  @override
  bool get isClosed =>
      (super.noSuchMethod(Invocation.getter(#isClosed), returnValue: false)
          as bool);
  @override
  void add(_i2.GetWatchlistTvEvent? event) =>
      super.noSuchMethod(Invocation.method(#add, [event]),
          returnValueForMissingStub: null);
  @override
  void onEvent(_i2.GetWatchlistTvEvent? event) =>
      super.noSuchMethod(Invocation.method(#onEvent, [event]),
          returnValueForMissingStub: null);
  @override
  void emit(_i2.GetWatchlistTvState? state) =>
      super.noSuchMethod(Invocation.method(#emit, [state]),
          returnValueForMissingStub: null);
  @override
  void on<E extends _i2.GetWatchlistTvEvent>(
          _i4.EventHandler<E, _i2.GetWatchlistTvState>? handler,
          {_i4.EventTransformer<E>? transformer}) =>
      super.noSuchMethod(
          Invocation.method(#on, [handler], {#transformer: transformer}),
          returnValueForMissingStub: null);
  @override
  void onTransition(
          _i4.Transition<_i2.GetWatchlistTvEvent, _i2.GetWatchlistTvState>?
              transition) =>
      super.noSuchMethod(Invocation.method(#onTransition, [transition]),
          returnValueForMissingStub: null);
  @override
  _i3.Future<void> close() => (super.noSuchMethod(Invocation.method(#close, []),
      returnValue: Future<void>.value(),
      returnValueForMissingStub: Future<void>.value()) as _i3.Future<void>);
  @override
  void onChange(_i4.Change<_i2.GetWatchlistTvState>? change) =>
      super.noSuchMethod(Invocation.method(#onChange, [change]),
          returnValueForMissingStub: null);
  @override
  void addError(Object? error, [StackTrace? stackTrace]) =>
      super.noSuchMethod(Invocation.method(#addError, [error, stackTrace]),
          returnValueForMissingStub: null);
  @override
  void onError(Object? error, StackTrace? stackTrace) =>
      super.noSuchMethod(Invocation.method(#onError, [error, stackTrace]),
          returnValueForMissingStub: null);
}
