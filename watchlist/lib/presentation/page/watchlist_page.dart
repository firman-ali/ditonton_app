import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watchlist/presentation/blocs/movies/get_watchlist_bloc.dart';
import 'package:watchlist/presentation/blocs/tv/get_watchlist_bloc.dart';

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
                  BlocBuilder<GetWatchlistMoviesBloc, WatchlistMoviesState>(
                    builder: (context, state) {
                      if (state is WatchlistMoviesLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is WatchlistMoviesHasData) {
                        final result = state.result;
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            final movie = result[index];
                            return MovieCard(movie: movie);
                          },
                          itemCount: result.length,
                        );
                      } else if (state is WatchlistMoviesError) {
                        return Expanded(
                          child: Center(
                            key: const Key('error_message'),
                            child: Text(state.message),
                          ),
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                  BlocBuilder<GetWatchlistTvBloc, WatchlistTvState>(
                    builder: (context, state) {
                      if (state is WatchlistTvLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (state is WatchlistTvHasData) {
                        final result = state.result;
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            final movie = result[index];
                            return TvCard(movie);
                          },
                          itemCount: result.length,
                        );
                      }
                      if (state is WatchlistTvError) {
                        return Expanded(
                          child: Center(
                            key: const Key('error_message'),
                            child: Text(state.message),
                          ),
                        );
                      } else {
                        return Container();
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
