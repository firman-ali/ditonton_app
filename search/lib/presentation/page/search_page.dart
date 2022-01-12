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
                Tab(text: 'Result Movies'),
                Tab(text: 'Result Tv Series'),
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
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final movie = result[index];
                              return MovieCard(movie: movie);
                            },
                            itemCount: result.length,
                          );
                        } else if (state is SearchMoviesError) {
                          return Expanded(
                            child: Center(
                              child: Text(state.message),
                            ),
                          );
                        } else {
                          return Container();
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
                          return Expanded(
                            child: Center(
                              child: Text(state.message),
                            ),
                          );
                        } else {
                          return Container();
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
