import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PopularMoviesPage extends StatelessWidget {
  static const routeName = '/popular-movie';

  const PopularMoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<GetPopularMovieBloc, PopularMoviesState>(
          builder: (context, state) {
            if (state is GetPopularMoviesLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetPopularMoviesHasData) {
              final result = state.result;
              return ListView.builder(
                itemBuilder: (context, index) {
                  final movie = result[index];
                  return MovieCard(movie: movie);
                },
                itemCount: result.length,
              );
            } else if (state is GetPopularMoviesError) {
              return Center(
                key: const Key('error_message'),
                child: Text(state.message),
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
