import 'package:core/presentation/widgets/movie_card_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/search.dart';

import '../../.,/../../../test/dummy_data/dummy_objects.dart';
import 'search_page_test.mocks.dart';

@GenerateMocks([SearchMoviesBloc, SearchTvBloc])
void main() {
  late MockSearchMoviesBloc mockSearchMoviesBloc;
  late MockSearchTvBloc mockSearchTvBloc;

  const String tQuery = 'spiderman';

  setUp(() {
    mockSearchMoviesBloc = MockSearchMoviesBloc();
    mockSearchTvBloc = MockSearchTvBloc();
  });

  Widget _makeTestableWidget() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchMoviesBloc>(create: (_) => mockSearchMoviesBloc),
        BlocProvider<SearchTvBloc>(create: (_) => mockSearchTvBloc),
      ],
      child: const MaterialApp(
        home: SearchPage(),
      ),
    );
  }

  group('Search Page Test:', () {
    testWidgets('page should show empty textfield',
        (WidgetTester tester) async {
      when(mockSearchMoviesBloc.state).thenAnswer((_) => WaitingSearchMovie());
      when(mockSearchMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(WaitingSearchMovie()));
      when(mockSearchTvBloc.state).thenAnswer((_) => WaitingSearchTv());
      when(mockSearchTvBloc.stream)
          .thenAnswer((_) => Stream.value(WaitingSearchTv()));

      await tester.pumpWidget(_makeTestableWidget());

      final searchField = find.byType(TextField);
      final searchText = find.text('Search title');

      expect(searchField, findsOneWidget);
      expect(searchText, findsOneWidget);
    });

    testWidgets('page should show fill textfield', (WidgetTester tester) async {
      when(mockSearchMoviesBloc.state).thenAnswer((_) => WaitingSearchMovie());
      when(mockSearchMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(WaitingSearchMovie()));
      when(mockSearchTvBloc.state).thenAnswer((_) => WaitingSearchTv());
      when(mockSearchTvBloc.stream)
          .thenAnswer((_) => Stream.value(WaitingSearchTv()));

      await tester.pumpWidget(_makeTestableWidget());

      final searchField = find.byType(TextField);
      final searchText = find.text(tQuery);

      await tester.enterText(searchField, tQuery);

      expect(searchField, findsOneWidget);
      expect(searchText, findsOneWidget);
    });

    testWidgets('page should not show waiting message when textfield submitted',
        (WidgetTester tester) async {
      when(mockSearchMoviesBloc.state).thenAnswer((_) => WaitingSearchMovie());
      when(mockSearchMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(WaitingSearchMovie()));
      when(mockSearchTvBloc.state).thenAnswer((_) => WaitingSearchTv());
      when(mockSearchTvBloc.stream)
          .thenAnswer((_) => Stream.value(WaitingSearchTv()));

      final searchField = find.byType(TextField);
      final waitingMsg = find.byKey(const Key('waiting_movie_message'));

      await tester.pumpWidget(_makeTestableWidget());

      await tester.enterText(searchField, tQuery);
      await tester.testTextInput.receiveAction(TextInputAction.done);
      await tester.pumpAndSettle();

      expect(searchField, findsOneWidget);
      expect(waitingMsg, findsOneWidget);
    });

    testWidgets('should show empty message when state status Waiting',
        (WidgetTester tester) async {
      when(mockSearchMoviesBloc.state).thenAnswer((_) => WaitingSearchMovie());
      when(mockSearchMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(WaitingSearchMovie()));
      when(mockSearchTvBloc.state).thenAnswer((_) => WaitingSearchTv());
      when(mockSearchTvBloc.stream)
          .thenAnswer((_) => Stream.value(WaitingSearchTv()));

      final waitingMsg = find.byKey(const Key('waiting_movie_message'));

      await tester.pumpWidget(_makeTestableWidget());

      expect(waitingMsg, findsOneWidget);
    });

    testWidgets('should show loading indicator when state status Loading',
        (WidgetTester tester) async {
      when(mockSearchMoviesBloc.state).thenAnswer((_) => SearchMoviesLoading());
      when(mockSearchMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(SearchMoviesLoading()));
      when(mockSearchTvBloc.state).thenAnswer((_) => SearchTvsLoading());
      when(mockSearchTvBloc.stream)
          .thenAnswer((_) => Stream.value(SearchTvsLoading()));

      final loadingBar = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget());

      expect(loadingBar, findsOneWidget);
    });

    testWidgets('should show empty message when state status Empty',
        (WidgetTester tester) async {
      when(mockSearchMoviesBloc.state).thenAnswer((_) => SearchMoviesEmpty());
      when(mockSearchMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(SearchMoviesEmpty()));
      when(mockSearchTvBloc.state).thenAnswer((_) => SearchTvsEmpty());
      when(mockSearchTvBloc.stream)
          .thenAnswer((_) => Stream.value(SearchTvsEmpty()));

      final emptyMovieMsg = find.byKey(const Key('empty_movie_message'));
      final emptyTvMsg = find.byKey(const Key('empty_tv_message'));

      await tester.pumpWidget(_makeTestableWidget());

      expect(emptyMovieMsg, findsOneWidget);

      await tester.tap(find.byKey(const Key('tv_tab')));
      await tester.pumpAndSettle();

      expect(emptyTvMsg, findsOneWidget);
    });

    testWidgets('should show error message when state status Error',
        (WidgetTester tester) async {
      when(mockSearchMoviesBloc.state)
          .thenAnswer((_) => const SearchMoviesError(''));
      when(mockSearchMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(const SearchMoviesError('')));
      when(mockSearchTvBloc.state).thenAnswer((_) => const SearchTvsError(''));
      when(mockSearchTvBloc.stream)
          .thenAnswer((_) => Stream.value(const SearchTvsError('')));

      final errorMovieMsg = find.byKey(const Key('error_movie_message'));
      final errorTvMsg = find.byKey(const Key('error_tv_message'));

      await tester.pumpWidget(_makeTestableWidget());

      expect(errorMovieMsg, findsOneWidget);

      await tester.tap(find.byKey(const Key('tv_tab')));
      await tester.pumpAndSettle();

      expect(errorTvMsg, findsOneWidget);
    });

    testWidgets('should show list movie card when state status HasData',
        (WidgetTester tester) async {
      when(mockSearchMoviesBloc.state)
          .thenAnswer((_) => SearchMoviesHasData([testMovie]));
      when(mockSearchMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(SearchMoviesHasData([testMovie])));
      when(mockSearchTvBloc.state)
          .thenAnswer((_) => const SearchTvsHasData([]));
      when(mockSearchTvBloc.stream)
          .thenAnswer((_) => Stream.value(const SearchTvsHasData([])));

      final listView = find.byType(ListView);
      final movieCard = find.byType(MovieCard);

      await tester.pumpWidget(_makeTestableWidget());

      expect(listView, findsOneWidget);
      expect(movieCard, findsOneWidget);
    });

    testWidgets('should show list tv card when state status HasData',
        (WidgetTester tester) async {
      when(mockSearchMoviesBloc.state)
          .thenAnswer((_) => const SearchMoviesHasData([]));
      when(mockSearchMoviesBloc.stream)
          .thenAnswer((_) => Stream.value(const SearchMoviesHasData([])));
      when(mockSearchTvBloc.state)
          .thenAnswer((_) => const SearchTvsHasData([]));
      when(mockSearchTvBloc.stream)
          .thenAnswer((_) => Stream.value(const SearchTvsHasData([])));

      final listView = find.byType(ListView);

      await tester.pumpWidget(_makeTestableWidget());
      await tester.tap(find.byKey(const Key('tv_tab')));
      await tester.pumpAndSettle();

      expect(listView, findsOneWidget);
    });
  });
}
