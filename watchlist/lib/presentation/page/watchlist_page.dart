import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:watchlist/presentation/providers/watchlist_movie_notifier.dart';
import 'package:watchlist/presentation/providers/watchlist_tv_notifier.dart';

class WatchlistMoviesPage extends StatefulWidget {
  static const routeName = '/watchlist';

  const WatchlistMoviesPage({Key? key}) : super(key: key);

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistMoviesPage>
    with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<WatchlistMovieNotifier>(context, listen: false)
            .fetchWatchlistMovies());
    Future.microtask(() =>
        Provider.of<WatchlistTvNotifier>(context, listen: false)
            .fetchWatchlistTv());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    Provider.of<WatchlistMovieNotifier>(context, listen: false)
        .fetchWatchlistMovies();
    Provider.of<WatchlistTvNotifier>(context, listen: false).fetchWatchlistTv();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const TabBar(tabs: [
                Tab(text: 'Movies'),
                Tab(text: 'Tv Series'),
              ]),
              Expanded(
                child: TabBarView(children: [
                  Consumer<WatchlistMovieNotifier>(
                    builder: (context, data, child) {
                      if (data.watchlistState == RequestState.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (data.watchlistState == RequestState.isLoaded) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            final movie = data.watchlistMovies[index];
                            return MovieCard(movie: movie);
                          },
                          itemCount: data.watchlistMovies.length,
                        );
                      } else {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(data.message),
                        );
                      }
                    },
                  ),
                  Consumer<WatchlistTvNotifier>(
                    builder: (context, data, child) {
                      if (data.watchlistState == RequestState.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (data.watchlistState == RequestState.isLoaded) {
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            final movie = data.watchlistTv[index];
                            return TvCard(movie);
                          },
                          itemCount: data.watchlistTv.length,
                        );
                      } else {
                        return Center(
                          key: const Key('error_message'),
                          child: Text(data.message),
                        );
                      }
                    },
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }
}
