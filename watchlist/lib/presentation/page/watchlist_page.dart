import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/presentation/blocs/movies/get_watchlist_bloc.dart';
import 'package:watchlist/presentation/blocs/tv/get_watchlist_bloc.dart';

class WatchlistPage extends StatefulWidget {
  static const routeName = '/watchlist';

  const WatchlistPage({Key? key}) : super(key: key);

  @override
  _WatchlistMoviesPageState createState() => _WatchlistMoviesPageState();
}

class _WatchlistMoviesPageState extends State<WatchlistPage> with RouteAware {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        context.read<GetWatchlistMoviesBloc>().add(GetAllWatchlistMovies()));
    Future.microtask(
        () => context.read<GetWatchlistTvBloc>().add(GetAllWatchlistTv()));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)!);
  }

  @override
  void didPopNext() {
    context.read<GetWatchlistMoviesBloc>().add(GetAllWatchlistMovies());
    context.read<GetWatchlistTvBloc>().add(GetAllWatchlistTv());
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
                  BlocBuilder<GetWatchlistMoviesBloc, GetWatchlistMoviesState>(
                    builder: (context, state) {
                      if (state is GetWatchlistMoviesLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GetWatchlistMoviesHasData) {
                        final result = state.result;
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            final movie = result[index];
                            return MovieCard(movie: movie);
                          },
                          itemCount: result.length,
                        );
                      } else if (state is GetWatchlistMoviesError) {
                        return Center(
                          key: const Key('error_movies_message'),
                          child: Text(state.message),
                        );
                      } else {
                        return const Center(
                          key: Key('empty_movies_message'),
                          child: Text('You Don`t Have A Watchlist Movies'),
                        );
                      }
                    },
                  ),
                  BlocBuilder<GetWatchlistTvBloc, GetWatchlistTvState>(
                    builder: (context, state) {
                      if (state is GetWatchlistTvLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is GetWatchlistTvHasData) {
                        final result = state.result;
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            final movie = result[index];
                            return TvCard(movie);
                          },
                          itemCount: result.length,
                        );
                      }
                      if (state is GetWatchlistTvError) {
                        return Expanded(
                          child: Center(
                            key: const Key('error_tv_message'),
                            child: Text(state.message),
                          ),
                        );
                      } else {
                        return const Expanded(
                          child: Center(
                            key: Key('empty_tv_message'),
                            child: Text('You Don`t Have A Watchlist Tv Series'),
                          ),
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
