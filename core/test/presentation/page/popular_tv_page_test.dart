import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test/dummy_data/dummy_objects.dart';
import 'popular_tv_page_test.mocks.dart';

@GenerateMocks([GetPopularTvBloc])
void main() {
  late MockGetPopularTvBloc mockGetPopularTvBloc;

  setUp(() {
    mockGetPopularTvBloc = MockGetPopularTvBloc();
  });

  Widget _makeTestableWidget() {
    return BlocProvider<GetPopularTvBloc>(
      create: (_) => mockGetPopularTvBloc,
      child: const MaterialApp(
        home: PopularTvPage(),
      ),
    );
  }

  group('Popular Tv Page Test:', () {
    testWidgets('should show loading indicator when state status Loading',
        (WidgetTester tester) async {
      when(mockGetPopularTvBloc.state).thenAnswer((_) => GetPopularTvLoading());
      when(mockGetPopularTvBloc.stream)
          .thenAnswer((_) => Stream.value(GetPopularTvLoading()));

      final loadingBar = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget());

      expect(loadingBar, findsOneWidget);
    });

    testWidgets('should show error message when state status Error',
        (WidgetTester tester) async {
      when(mockGetPopularTvBloc.state)
          .thenAnswer((_) => const GetPopularTvError(''));
      when(mockGetPopularTvBloc.stream)
          .thenAnswer((_) => Stream.value(const GetPopularTvError('')));

      final errorMessage = find.byKey(const Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget());

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('should show DetailContent when state status HasData',
        (WidgetTester tester) async {
      when(mockGetPopularTvBloc.state)
          .thenAnswer((_) => GetPopularTvHasData(testTvList));
      when(mockGetPopularTvBloc.stream)
          .thenAnswer((_) => Stream.value(GetPopularTvHasData(testTvList)));

      final listView = find.byType(ListView);
      final card = find.byType(TvCard);

      await tester.pumpWidget(_makeTestableWidget());

      expect(listView, findsOneWidget);
      expect(card, findsOneWidget);
    });
  });
}
