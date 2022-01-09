import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:search/presentation/providers/movie_search_notifier.dart';
import 'package:search/presentation/providers/tv_search_notifier.dart';

class SearchPage extends StatelessWidget {
  static const ROUTE_NAME = '/search';

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
                  Provider.of<MovieSearchNotifier>(context, listen: false)
                      .fetchMovieSearch(query);
                  Provider.of<TvSearchNotifier>(context, listen: false)
                      .fetchTvSearch(query);
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
                    Consumer<MovieSearchNotifier>(
                      builder: (context, data, child) {
                        if (data.state == RequestState.Loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (data.state == RequestState.Loaded) {
                          final result = data.searchResult;
                          return ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final movie = data.searchResult[index];
                              return MovieCard(movie);
                            },
                            itemCount: result.length,
                          );
                        } else {
                          return Container();
                        }
                      },
                    ),
                    Consumer<TvSearchNotifier>(
                      builder: (context, data, child) {
                        if (data.state == RequestState.Loading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (data.state == RequestState.Loaded) {
                          final result = data.searchResult;
                          return ListView.builder(
                            padding: const EdgeInsets.all(8),
                            itemBuilder: (context, index) {
                              final movie = data.searchResult[index];
                              return TvCard(movie);
                            },
                            itemCount: result.length,
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
