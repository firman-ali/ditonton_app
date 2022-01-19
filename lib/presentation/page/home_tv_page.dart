import 'package:cached_network_image/cached_network_image.dart';
import 'package:ditonton/common/constants.dart';
import 'package:ditonton/common/text_styles.dart';
import 'package:ditonton/domain/entities/tv_series.dart';
import 'package:ditonton/presentation/blocs/tv/airing_today_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/on_air_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/popular_bloc.dart';
import 'package:ditonton/presentation/blocs/tv/top_rated_bloc.dart';
import 'package:ditonton/presentation/page/on_air_tv_page.dart';
import 'package:ditonton/presentation/page/popular_tv_page.dart';
import 'package:ditonton/presentation/page/top_rated_tv_page.dart';
import 'package:ditonton/presentation/page/tv_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeTvPage extends StatefulWidget {
  const HomeTvPage({Key? key}) : super(key: key);

  @override
  _HomeTvPageState createState() => _HomeTvPageState();
}

class _HomeTvPageState extends State<HomeTvPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Airing Today',
            style: kHeading6,
          ),
          BlocBuilder<GetAiringTodayTvBloc, AiringTodayTvState>(
              builder: (context, state) {
            if (state is GetAiringTodayTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetAiringTodayTvHasData) {
              final result = state.result;
              return TvList(movies: result);
            } else {
              return const Text('Failed');
            }
          }),
          _buildSubHeading(
            title: 'On The Air',
            onTap: () => Navigator.pushNamed(context, OnAirTvPage.routeName),
          ),
          BlocBuilder<GetOnAirTvBloc, OnAirTvState>(builder: (context, state) {
            if (state is GetOnAirTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetOnAirTvHasData) {
              final result = state.result;
              return TvList(movies: result);
            } else {
              return const Text('Failed');
            }
          }),
          _buildSubHeading(
            title: 'Popular',
            onTap: () => Navigator.pushNamed(context, PopularTvPage.routeName),
          ),
          BlocBuilder<GetPopularTvBloc, PopularTvState>(
              builder: (context, state) {
            if (state is GetPopularTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetPopularTvHasData) {
              final result = state.result;
              return TvList(movies: result);
            } else {
              return const Text('Failed');
            }
          }),
          _buildSubHeading(
            title: 'Top Rated',
            onTap: () => Navigator.pushNamed(context, TopRatedTvPage.routeName),
          ),
          BlocBuilder<GetTopRatedTvBloc, TopRatedTvState>(
              builder: (context, state) {
            if (state is GetTopRatedTvLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetTopRatedTvHasData) {
              final result = state.result;
              return TvList(movies: result);
            } else {
              return const Text('Failed');
            }
          }),
        ],
      ),
    );
  }

  Row _buildSubHeading({required String title, required Function() onTap}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: kHeading6,
        ),
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: const [Text('See More'), Icon(Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ],
    );
  }
}

class TvList extends StatelessWidget {
  final List<TvSeries> movies;

  const TvList({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Container(
            padding: const EdgeInsets.all(8),
            child: InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TvDetailPage.routeName,
                  arguments: movie.id,
                );
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(16)),
                child: CachedNetworkImage(
                  imageUrl: '$baseImageUrl${movie.posterPath}',
                  placeholder: (context, url) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        itemCount: movies.length,
      ),
    );
  }
}
