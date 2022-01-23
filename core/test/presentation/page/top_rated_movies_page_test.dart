import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test/dummy_data/dummy_objects.dart';
import 'top_rated_movies_page_test.mocks.dart';

@GenerateMocks([GetTopRatedMovieBloc])
void main() {
  late MockGetTopRatedMovieBloc mockGetTopRatedMovieBloc;

  setUp(() {
    mockGetTopRatedMovieBloc = MockGetTopRatedMovieBloc();
  });

  Widget _makeTestableWidget() {
    return BlocProvider<GetTopRatedMovieBloc>(
      create: (_) => mockGetTopRatedMovieBloc,
      child: const MaterialApp(
        home: TopRatedMoviesPage(),
      ),
    );
  }

  group('Top Rated Movies Page Test:', () {
    testWidgets('should show loading indicator when state status Loading',
        (WidgetTester tester) async {
      when(mockGetTopRatedMovieBloc.state)
          .thenAnswer((_) => GetTopRatedMoviesLoading());
      when(mockGetTopRatedMovieBloc.stream)
          .thenAnswer((_) => Stream.value(GetTopRatedMoviesLoading()));

      final loadingBar = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget());

      expect(loadingBar, findsOneWidget);
    });

    testWidgets('should show error message when state status Error',
        (WidgetTester tester) async {
      when(mockGetTopRatedMovieBloc.state)
          .thenAnswer((_) => const GetTopRatedMoviesError(''));
      when(mockGetTopRatedMovieBloc.stream)
          .thenAnswer((_) => Stream.value(const GetTopRatedMoviesError('')));

      final errorMessage = find.byKey(const Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget());

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('should show DetailContent when state status HasData',
        (WidgetTester tester) async {
      when(mockGetTopRatedMovieBloc.state)
          .thenAnswer((_) => GetTopRatedMoviesHasData(testMovieList));
      when(mockGetTopRatedMovieBloc.stream).thenAnswer(
          (_) => Stream.value(GetTopRatedMoviesHasData(testMovieList)));

      final listView = find.byType(ListView);
      final card = find.byType(MovieCard);

      await tester.pumpWidget(_makeTestableWidget());

      expect(listView, findsOneWidget);
      expect(card, findsOneWidget);
    });
  });
}
