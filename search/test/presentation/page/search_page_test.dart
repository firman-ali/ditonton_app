import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:search/search.dart';

import 'search_page_test.mocks.dart';

@GenerateMocks([SearchMovies, SearchTv])
void main() {
  late SearchMoviesBloc searchMoviesBloc;
  late MockSearchMovies mockSearchMovies;
  late SearchTvBloc searchTvBloc;
  late MockSearchTv mockSearchTv;

  late String tQuery = 'spiderman';

  setUp(() {
    mockSearchMovies = MockSearchMovies();
    searchMoviesBloc = SearchMoviesBloc(mockSearchMovies);
    mockSearchTv = MockSearchTv();
    searchTvBloc = SearchTvBloc(mockSearchTv);
  });

  tearDown(() {
    searchMoviesBloc.close();
    searchTvBloc.close();
  });

  Widget _makeTestableWidget() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchMoviesBloc>(create: (_) => searchMoviesBloc),
        BlocProvider<SearchTvBloc>(create: (_) => searchTvBloc),
      ],
      child: const MaterialApp(
        home: SearchPage(),
      ),
    );
  }

  group('Search Page Test:', () {
    testWidgets('page should show empty textfield',
        (WidgetTester tester) async {
      expect(searchMoviesBloc.state, WaitingSearchMovie());
      await tester.pumpWidget(_makeTestableWidget());

      final searchField = find.byType(TextField);
      final searchText = find.text('Search title');

      expect(searchField, findsOneWidget);
      expect(searchText, findsOneWidget);
    });

    testWidgets('page should show fill textfield', (WidgetTester tester) async {
      expect(searchMoviesBloc.state, WaitingSearchMovie());
      await tester.pumpWidget(_makeTestableWidget());

      final searchField = find.byType(TextField);
      final searchText = find.text(tQuery);

      await tester.enterText(searchField, tQuery);

      expect(searchField, findsOneWidget);
      expect(searchText, findsOneWidget);
    });

    testWidgets('search query should call bloc success',
        (WidgetTester tester) async {
      when(mockSearchMovies.execute(tQuery)).thenAnswer((_) async => Right([]));
      when(mockSearchTv.execute(tQuery)).thenAnswer((_) async => Right([]));

      await tester.pumpWidget(_makeTestableWidget());
      await tester.enterText(find.byType(TextField), tQuery);
      await tester.testTextInput.receiveAction(TextInputAction.done);

      verify(mockSearchMovies.execute(tQuery)).called(1);
    });
  });
}
