import 'package:ditonton/common/colors.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/ssl_pinning.dart';
import 'package:ditonton/common/utils.dart';
import 'package:ditonton/presentation/blocs/movies/detail_bloc.dart';
import 'package:ditonton/presentation/blocs/movies/get_watchlist_bloc.dart';
import 'package:ditonton/presentation/blocs/movies/now_playing_bloc.dart';
import 'package:ditonton/presentation/blocs/movies/popular_bloc.dart';
import 'package:ditonton/presentation/blocs/movies/search_bloc.dart';
import 'package:ditonton/presentation/blocs/movies/top_rated_bloc.dart';
import 'package:ditonton/presentation/blocs/movies/watchlist_status_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/airing_today_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/detail_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/get_watchlist_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/on_air_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/popular_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/search_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/top_rated_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/watchlist_status_bloc.dart';
import 'package:ditonton/presentation/page/about_page.dart';
import 'package:ditonton/presentation/page/home_movie_page.dart';
import 'package:ditonton/presentation/page/home_page.dart';
import 'package:ditonton/presentation/page/movie_detail_page.dart';
import 'package:ditonton/presentation/page/on_air_tv_page.dart';
import 'package:ditonton/presentation/page/popular_movies_page.dart';
import 'package:ditonton/presentation/page/popular_tv_page.dart';
import 'package:ditonton/presentation/page/search_page.dart';
import 'package:ditonton/presentation/page/top_rated_movies_page.dart';
import 'package:ditonton/presentation/page/top_rated_tv_page.dart';
import 'package:ditonton/presentation/page/tv_detail_page.dart';
import 'package:ditonton/presentation/page/watchlist_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ditonton/injection.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpSSLPinning.init();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<DetailMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistStatusMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetNowPlayingMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetPopularMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetTopRatedMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistStatusTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetAiringTodayTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetOnAirTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetPopularTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetTopRatedTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<SearchTvBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetWatchlistMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<GetWatchlistTvBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
          colorScheme: kColorScheme.copyWith(secondary: kMikadoYellow),
        ),
        home: HomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '/home':
              return MaterialPageRoute(builder: (_) => HomeMoviePage());
            case PopularMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.routeName:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case OnAirTvPage.routeName:
              return CupertinoPageRoute(builder: (_) => OnAirTvPage());
            case PopularTvPage.routeName:
              return CupertinoPageRoute(builder: (_) => PopularTvPage());
            case TopRatedTvPage.routeName:
              return CupertinoPageRoute(builder: (_) => TopRatedTvPage());
            case MovieDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case TvDetailPage.routeName:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.routeName:
              return CupertinoPageRoute(builder: (_) => SearchPage());
            case WatchlistPage.routeName:
              return MaterialPageRoute(builder: (_) => WatchlistPage());
            case AboutPage.routeName:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
