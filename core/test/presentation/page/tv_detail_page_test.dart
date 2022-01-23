import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test/dummy_data/dummy_objects.dart';
import 'tv_detail_page_test.mocks.dart';

@GenerateMocks([DetailTvBloc, WatchlistStatusTvBloc])
void main() {
  late MockDetailTvBloc mockDetailTvBloc;
  late MockWatchlistStatusTvBloc mockWatchlistStatusTvBloc;

  setUp(() {
    mockDetailTvBloc = MockDetailTvBloc();
    mockWatchlistStatusTvBloc = MockWatchlistStatusTvBloc();
  });

  Widget _makeTestableWidget(Widget widget) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DetailTvBloc>(create: (_) => mockDetailTvBloc),
        BlocProvider<WatchlistStatusTvBloc>(
            create: (_) => mockWatchlistStatusTvBloc),
      ],
      child: MaterialApp(
        home: widget,
      ),
    );
  }

  group('Tv Detail Page Test:', () {
    testWidgets('should show loading indicator when state status Loading',
        (WidgetTester tester) async {
      when(mockDetailTvBloc.state).thenAnswer((_) => GetDetailTvLoading());
      when(mockDetailTvBloc.stream)
          .thenAnswer((_) => Stream.value(GetDetailTvLoading()));
      when(mockWatchlistStatusTvBloc.state)
          .thenAnswer((_) => InitWatchlistStatusTv());
      when(mockWatchlistStatusTvBloc.stream)
          .thenAnswer((_) => Stream.value(InitWatchlistStatusTv()));

      final loadingBar = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget(const TvDetailPage(id: 0)));

      expect(loadingBar, findsOneWidget);
    });

    testWidgets('should show error message when state status Error',
        (WidgetTester tester) async {
      when(mockDetailTvBloc.state)
          .thenAnswer((_) => const GetDetailTvError(''));
      when(mockDetailTvBloc.stream)
          .thenAnswer((_) => Stream.value(const GetDetailTvError('')));
      when(mockWatchlistStatusTvBloc.state)
          .thenAnswer((_) => const WatchlistStatusTvError(''));
      when(mockWatchlistStatusTvBloc.stream)
          .thenAnswer((_) => Stream.value(const WatchlistStatusTvError('')));

      final errorMessage = find.byKey(const Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget(const TvDetailPage(id: 0)));

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('should show DetailContent when state status HasData',
        (WidgetTester tester) async {
      when(mockDetailTvBloc.state)
          .thenAnswer((_) => GetDetailTvHasData(testTvDetail, const []));
      when(mockDetailTvBloc.stream).thenAnswer(
          (_) => Stream.value(GetDetailTvHasData(testTvDetail, const [])));
      when(mockWatchlistStatusTvBloc.state)
          .thenAnswer((_) => const WatchlistStatusTvHasData(false));
      when(mockWatchlistStatusTvBloc.stream).thenAnswer(
          (_) => Stream.value(const WatchlistStatusTvHasData(false)));

      final detailContent = find.byType(TvDetailContent);

      await tester.pumpWidget(_makeTestableWidget(const TvDetailPage(id: 0)));

      expect(detailContent, findsOneWidget);
    });

    testWidgets('should show watchlist button when state status HasData',
        (WidgetTester tester) async {
      when(mockDetailTvBloc.state)
          .thenAnswer((_) => GetDetailTvHasData(testTvDetail, const []));
      when(mockDetailTvBloc.stream).thenAnswer(
          (_) => Stream.value(GetDetailTvHasData(testTvDetail, const [])));
      when(mockWatchlistStatusTvBloc.state)
          .thenAnswer((_) => const WatchlistStatusTvHasData(false));
      when(mockWatchlistStatusTvBloc.stream).thenAnswer(
          (_) => Stream.value(const WatchlistStatusTvHasData(false)));

      final watchlistButton = find.byKey(const Key('watchlist_button'));

      await tester.pumpWidget(_makeTestableWidget(const TvDetailPage(id: 0)));

      expect(watchlistButton, findsOneWidget);
    });
  });
}
