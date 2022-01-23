import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test/dummy_data/dummy_objects.dart';
import 'top_rated_tv_page_test.mocks.dart';

@GenerateMocks([GetTopRatedTvBloc])
void main() {
  late MockGetTopRatedTvBloc mockGetTopRatedTvBloc;

  setUp(() {
    mockGetTopRatedTvBloc = MockGetTopRatedTvBloc();
  });

  Widget _makeTestableWidget() {
    return BlocProvider<GetTopRatedTvBloc>(
      create: (_) => mockGetTopRatedTvBloc,
      child: const MaterialApp(
        home: TopRatedTvPage(),
      ),
    );
  }

  group('Top rated Tv Page Test:', () {
    testWidgets('should show loading indicator when state status Loading',
        (WidgetTester tester) async {
      when(mockGetTopRatedTvBloc.state)
          .thenAnswer((_) => GetTopRatedTvLoading());
      when(mockGetTopRatedTvBloc.stream)
          .thenAnswer((_) => Stream.value(GetTopRatedTvLoading()));

      final loadingBar = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget());

      expect(loadingBar, findsOneWidget);
    });

    testWidgets('should show error message when state status Error',
        (WidgetTester tester) async {
      when(mockGetTopRatedTvBloc.state)
          .thenAnswer((_) => const GetTopRatedTvError(''));
      when(mockGetTopRatedTvBloc.stream)
          .thenAnswer((_) => Stream.value(const GetTopRatedTvError('')));

      final errorMessage = find.byKey(const Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget());

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('should show DetailContent when state status HasData',
        (WidgetTester tester) async {
      when(mockGetTopRatedTvBloc.state)
          .thenAnswer((_) => GetTopRatedTvHasData(testTvList));
      when(mockGetTopRatedTvBloc.stream)
          .thenAnswer((_) => Stream.value(GetTopRatedTvHasData(testTvList)));

      final listView = find.byType(ListView);
      final card = find.byType(TvCard);

      await tester.pumpWidget(_makeTestableWidget());

      expect(listView, findsOneWidget);
      expect(card, findsOneWidget);
    });
  });
}
