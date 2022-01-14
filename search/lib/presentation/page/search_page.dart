import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search/presentation/bloc/movies/search_bloc.dart';
import 'package:search/presentation/bloc/tv/search_bloc.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search';

  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onSubmitted: (query) {
                  context
                      .read<SearchMoviesBloc>()
                      .add(OnMoviesQueryChanged(query));
                  context.read<SearchTvBloc>().add(OnTvsQueryChanged(query));
                },
                decoration: const InputDecoration(
                  hintText: 'Search title',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
                textInputAction: TextInputAction.search,
              ),
              const SizedBox(height: 16),
              const TabBar(tabs: [
                Tab(key: Key('movie_tab'), text: 'Result Movies'),
                Tab(key: Key('tv_tab'), text: 'Result Tv Series'),
              ]),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocBuilder<SearchMoviesBloc, SearchMoviesState>(
                      builder: (context, state) {
                        if (state is SearchMoviesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SearchMoviesHasData) {
                          final result = state.result;
                          return ListView.builder(
                            key: const Key('list_movie_search'),
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final movie = result[index];
                              return MovieCard(movie: movie);
                            },
                            itemCount: result.length,
                          );
                        } else if (state is SearchMoviesError) {
                          return Center(
                            key: const Key('error_movie_message'),
                            child: Text(state.message),
                          );
                        } else if (state is SearchMoviesEmpty) {
                          return const Center(
                            key: Key('empty_movie_message'),
                            child: Text('Your Movie Was Not Found'),
                          );
                        } else {
                          return const Center(
                            key: Key('waiting_movie_message'),
                            child: Text('Search Your Movie'),
                          );
                        }
                      },
                    ),
                    BlocBuilder<SearchTvBloc, SearchTvsState>(
                      builder: (context, state) {
                        if (state is SearchTvsLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is SearchTvsHasData) {
                          final result = state.result;
                          return ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final movie = result[index];
                              return TvCard(movie);
                            },
                            itemCount: result.length,
                          );
                        } else if (state is SearchTvsError) {
                          return Center(
                            key: const Key('error_tv_message'),
                            child: Text(state.message),
                          );
                        } else if (state is SearchTvsEmpty) {
                          return const Center(
                            key: Key('empty_tv_message'),
                            child: Text('Your Tv Series Was Not Found'),
                          );
                        } else {
                          return const Center(
                            key: Key('waiting_tv_message'),
                            child: Text('Search Your Tv Series'),
                          );
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
