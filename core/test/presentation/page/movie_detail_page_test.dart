import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test/dummy_data/dummy_objects.dart';
import 'movie_detail_page_test.mocks.dart';

@GenerateMocks([DetailMovieBloc, WatchlistStatusMovieBloc])
void main() {
  late MockDetailMovieBloc mockDetailMovieBloc;
  late MockWatchlistStatusMovieBloc mockWatchlistStatusMovieBloc;

  setUp(() {
    mockDetailMovieBloc = MockDetailMovieBloc();
    mockWatchlistStatusMovieBloc = MockWatchlistStatusMovieBloc();
  });

  Widget _makeTestableWidget(Widget widget) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailMovieBloc>(create: (_) => mockDetailMovieBloc),
        BlocProvider<WatchlistStatusMovieBloc>(
            create: (_) => mockWatchlistStatusMovieBloc),
      ],
      child: MaterialApp(
        home: widget,
      ),
    );
  }

  group('Movie Detail Page Test:', () {
    testWidgets('should show loading indicator when state status Loading',
        (WidgetTester tester) async {
      when(mockDetailMovieBloc.state)
          .thenAnswer((_) => GetDetailMovieLoading());
      when(mockDetailMovieBloc.stream)
          .thenAnswer((_) => Stream.value(GetDetailMovieLoading()));
      when(mockWatchlistStatusMovieBloc.state)
          .thenAnswer((_) => InitWatchlistStatusMovie());
      when(mockWatchlistStatusMovieBloc.stream)
          .thenAnswer((_) => Stream.value(InitWatchlistStatusMovie()));

      final loadingBar = find.byType(CircularProgressIndicator);

      await tester
          .pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 0)));

      expect(loadingBar, findsOneWidget);
    });

    testWidgets('should show error message when state status Error',
        (WidgetTester tester) async {
      when(mockDetailMovieBloc.state)
          .thenAnswer((_) => const GetDetailMovieError(''));
      when(mockDetailMovieBloc.stream)
          .thenAnswer((_) => Stream.value(const GetDetailMovieError('')));
      when(mockWatchlistStatusMovieBloc.state)
          .thenAnswer((_) => const WatchlistStatusMovieError(''));
      when(mockWatchlistStatusMovieBloc.stream)
          .thenAnswer((_) => Stream.value(const WatchlistStatusMovieError('')));

      final errorMessage = find.byKey(const Key('error_message'));

      await tester
          .pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 0)));

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('should show DetailContent when state status HasData',
        (WidgetTester tester) async {
      when(mockDetailMovieBloc.state)
          .thenAnswer((_) => GetDetailMovieHasData(testMovieDetail, const []));
      when(mockDetailMovieBloc.stream).thenAnswer((_) =>
          Stream.value(GetDetailMovieHasData(testMovieDetail, const [])));
      when(mockWatchlistStatusMovieBloc.state)
          .thenAnswer((_) => const WatchlistStatusMovieHasData(false));
      when(mockWatchlistStatusMovieBloc.stream).thenAnswer(
          (_) => Stream.value(const WatchlistStatusMovieHasData(false)));

      final detailContent = find.byType(DetailContent);

      await tester
          .pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 0)));

      expect(detailContent, findsOneWidget);
    });

    testWidgets('should show watchlist button when state status HasData',
        (WidgetTester tester) async {
      when(mockDetailMovieBloc.state)
          .thenAnswer((_) => GetDetailMovieHasData(testMovieDetail, const []));
      when(mockDetailMovieBloc.stream).thenAnswer((_) =>
          Stream.value(GetDetailMovieHasData(testMovieDetail, const [])));
      when(mockWatchlistStatusMovieBloc.state)
          .thenAnswer((_) => const WatchlistStatusMovieHasData(false));
      when(mockWatchlistStatusMovieBloc.stream).thenAnswer(
          (_) => Stream.value(const WatchlistStatusMovieHasData(false)));

      final watchlistButton = find.byKey(const Key('watchlist_button'));

      await tester
          .pumpWidget(_makeTestableWidget(const MovieDetailPage(id: 0)));

      expect(watchlistButton, findsOneWidget);
    });
  });
}
