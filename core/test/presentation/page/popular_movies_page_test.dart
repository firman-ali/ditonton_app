import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test/dummy_data/dummy_objects.dart';
import 'popular_movies_page_test.mocks.dart';

@GenerateMocks([GetPopularMovieBloc])
void main() {
  late MockGetPopularMovieBloc mockGetPopularMovieBloc;

  setUp(() {
    mockGetPopularMovieBloc = MockGetPopularMovieBloc();
  });

  Widget _makeTestableWidget() {
    return BlocProvider<GetPopularMovieBloc>(
      create: (_) => mockGetPopularMovieBloc,
      child: const MaterialApp(
        home: PopularMoviesPage(),
      ),
    );
  }

  group('Popular Movies Page Test:', () {
    testWidgets('should show loading indicator when state status Loading',
        (WidgetTester tester) async {
      when(mockGetPopularMovieBloc.state)
          .thenAnswer((_) => GetPopularMoviesLoading());
      when(mockGetPopularMovieBloc.stream)
          .thenAnswer((_) => Stream.value(GetPopularMoviesLoading()));

      final loadingBar = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget());

      expect(loadingBar, findsOneWidget);
    });

    testWidgets('should show error message when state status Error',
        (WidgetTester tester) async {
      when(mockGetPopularMovieBloc.state)
          .thenAnswer((_) => const GetPopularMoviesError(''));
      when(mockGetPopularMovieBloc.stream)
          .thenAnswer((_) => Stream.value(const GetPopularMoviesError('')));

      final errorMessage = find.byKey(const Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget());

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('should show DetailContent when state status HasData',
        (WidgetTester tester) async {
      when(mockGetPopularMovieBloc.state)
          .thenAnswer((_) => GetPopularMoviesHasData(testMovieList));
      when(mockGetPopularMovieBloc.stream).thenAnswer(
          (_) => Stream.value(GetPopularMoviesHasData(testMovieList)));

      final listView = find.byType(ListView);
      final card = find.byType(MovieCard);

      await tester.pumpWidget(_makeTestableWidget());

      expect(listView, findsOneWidget);
      expect(card, findsOneWidget);
    });
  });
}
