import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test/dummy_data/dummy_objects.dart';
import 'on_air_tv_page_test.mocks.dart';

@GenerateMocks([GetOnAirTvBloc])
void main() {
  late MockGetOnAirTvBloc mockGetOnAirTvBloc;

  setUp(() {
    mockGetOnAirTvBloc = MockGetOnAirTvBloc();
  });

  Widget _makeTestableWidget() {
    return BlocProvider<GetOnAirTvBloc>(
      create: (_) => mockGetOnAirTvBloc,
      child: const MaterialApp(
        home: OnAirTvPage(),
      ),
    );
  }

  group('On Air Tv Page Test:', () {
    testWidgets('should show loading indicator when state status Loading',
        (WidgetTester tester) async {
      when(mockGetOnAirTvBloc.state).thenAnswer((_) => GetOnAirTvLoading());
      when(mockGetOnAirTvBloc.stream)
          .thenAnswer((_) => Stream.value(GetOnAirTvLoading()));

      final loadingBar = find.byType(CircularProgressIndicator);

      await tester.pumpWidget(_makeTestableWidget());

      expect(loadingBar, findsOneWidget);
    });

    testWidgets('should show error message when state status Error',
        (WidgetTester tester) async {
      when(mockGetOnAirTvBloc.state)
          .thenAnswer((_) => const GetOnAirTvError(''));
      when(mockGetOnAirTvBloc.stream)
          .thenAnswer((_) => Stream.value(const GetOnAirTvError('')));

      final errorMessage = find.byKey(const Key('error_message'));

      await tester.pumpWidget(_makeTestableWidget());

      expect(errorMessage, findsOneWidget);
    });

    testWidgets('should show DetailContent when state status HasData',
        (WidgetTester tester) async {
      when(mockGetOnAirTvBloc.state)
          .thenAnswer((_) => GetOnAirTvHasData(testTvList));
      when(mockGetOnAirTvBloc.stream)
          .thenAnswer((_) => Stream.value(GetOnAirTvHasData(testTvList)));

      final listView = find.byType(ListView);
      final card = find.byType(TvCard);

      await tester.pumpWidget(_makeTestableWidget());

      expect(listView, findsOneWidget);
      expect(card, findsOneWidget);
    });
  });
}
