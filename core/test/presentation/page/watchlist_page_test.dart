import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test/dummy_data/dummy_objects.dart';
import 'watchlist_page_test.mocks.dart';

@GenerateMocks([GetWatchlistMoviesBloc, GetWatchlistTvBloc])
void main() {
  late MockGetWatchlistMoviesBloc mockGetWatchlistMoviesBloc;
  late MockGetWatchlistTvBloc mockGetWatchlistTvBloc;

  setUp(() {
    mockGetWatchlistMoviesBloc = MockGetWatchlistMoviesBloc();
    mockGetWatchlistTvBloc = MockGetWatchlistTvBloc();
  });

  Widget _makeTestableWidget() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GetWatchlistMoviesBloc>(
            create: (_) => mockGetWatchlistMoviesBloc),
        BlocProvider<GetWatchlistTvBloc>(create: (_) => mockGetWatchlistTvBloc),
      ],
      child: const MaterialApp(
        home: WatchlistPage(),
      ),
    );
  }

  group('Watchlist Page Test:', () {
    testWidgets('should show loading indicator when state status Loading',
        (WidgetTester tester) async {
      when(mockGetWatchlistMoviesBloc.state)
          .thenAnswer((_) => GetWatchlistMoviesLoading());
      when(mockGetWatchlistMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(GetWatchlistMoviesLoading()));
      when(mockGetWatchlistTvBloc.state)
          .thenAnswer((_) => GetWatchlistTvLoading());
      when(mockGetWatchlistTvBloc.stream)
          .thenAnswer((_) => Stream.value(GetWatchlistTvLoading()));

      final loadingBar = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget());

      expect(loadingBar, findsOneWidget);
    });

    testWidgets('should show empty message when state status Empty',
        (WidgetTester tester) async {
      when(mockGetWatchlistMoviesBloc.state)
          .thenAnswer((_) => GetWatchlistMoviesEmpty());
      when(mockGetWatchlistMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(GetWatchlistMoviesEmpty()));
      when(mockGetWatchlistTvBloc.state)
          .thenAnswer((_) => GetWatchlistTvEmpty());
      when(mockGetWatchlistTvBloc.stream)
          .thenAnswer((_) => Stream.value(GetWatchlistTvEmpty()));

      final emptyMovieMsg = find.byKey(const Key('empty_movies_message'));
      final emptyTvMsg = find.byKey(const Key('empty_tv_message'));

      await tester.pumpWidget(_makeTestableWidget());

      expect(emptyMovieMsg, findsOneWidget);

      await tester.tap(find.byKey(const Key('tv_tab')));
      await tester.pumpAndSettle();

      expect(emptyTvMsg, findsOneWidget);
    });

    testWidgets('should show error message when state status Error',
        (WidgetTester tester) async {
      when(mockGetWatchlistMoviesBloc.state)
          .thenAnswer((_) => const GetWatchlistMoviesError(''));
      when(mockGetWatchlistMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(const GetWatchlistMoviesError('')));
      when(mockGetWatchlistTvBloc.state)
          .thenAnswer((_) => const GetWatchlistTvError(''));
      when(mockGetWatchlistTvBloc.stream)
          .thenAnswer((_) => Stream.value(const GetWatchlistTvError('')));

      final errorMovieMsg = find.byKey(const Key('error_movies_message'));
      final errorTvMsg = find.byKey(const Key('error_tv_message'));

      await tester.pumpWidget(_makeTestableWidget());

      expect(errorMovieMsg, findsOneWidget);

      await tester.tap(find.byKey(const Key('tv_tab')));
      await tester.pumpAndSettle();

      expect(errorTvMsg, findsOneWidget);
    });

    testWidgets('should show card when state status HasData',
        (WidgetTester tester) async {
      when(mockGetWatchlistMoviesBloc.state)
          .thenAnswer((_) => GetWatchlistMoviesHasData(testMovieList));
      when(mockGetWatchlistMoviesBloc.stream).thenAnswer(
          (_) => Stream.value(GetWatchlistMoviesHasData(testMovieList)));
      when(mockGetWatchlistTvBloc.state)
          .thenAnswer((_) => GetWatchlistTvHasData(testTvList));
      when(mockGetWatchlistTvBloc.stream)
          .thenAnswer((_) => Stream.value(GetWatchlistTvHasData(testTvList)));

      final movieCard = find.byType(MovieCard);

      await tester.pumpWidget(_makeTestableWidget());

      expect(movieCard, findsOneWidget);
    });
  });
}
