import 'package:cached_network_image/cached_network_image.dart';
import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class TvDetailPage extends StatefulWidget {
  static const routeName = '/tvdetail';

  final int id;
  const TvDetailPage({Key? key, required this.id}) : super(key: key);

  @override
  _TvDetailPageState createState() => _TvDetailPageState();
}

class _TvDetailPageState extends State<TvDetailPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      context.read<DetailTvBloc>().add(GetDetailTv(widget.id));
      context
          .read<WatchlistStatusTvBloc>()
          .add(GetWatchlistStatusTv(widget.id));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DetailTvBloc, DetailTvState>(
        builder: (context, state) {
          if (state is GetDetailTvLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetDetailTvHasData) {
            final detailResult = state.detailResult;
            final recommendationResult = state.recommendationResult;
            return SafeArea(
              child: TvDetailContent(
                tvDetail: detailResult,
                recommendations: recommendationResult,
              ),
            );
          } else if (state is GetDetailTvError) {
            return Text(state.message);
          } else {
            return Container();
          }
        },
      ),
    );
  }
}

class TvDetailContent extends StatelessWidget {
  final TvDetail tvDetail;
  final List<TvSeries> recommendations;

  const TvDetailContent({
    Key? key,
    required this.tvDetail,
    required this.recommendations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return BlocListener<WatchlistStatusTvBloc, WatchlistStatusTvState>(
      listener: (context, state) {
        if (state is AddWatchlistTvSuccess) {
          final message = state.message;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        } else if (state is RemoveWatchlistTvSuccess) {
          final message = state.message;
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(message)));
        }
      },
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: 'https://image.tmdb.org/t/p/w500${tvDetail.posterPath}',
            width: screenWidth,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Container(
            margin: const EdgeInsets.only(top: 48 + 8),
            child: DraggableScrollableSheet(
              builder: (context, scrollController) {
                return Container(
                  decoration: const BoxDecoration(
                    color: kRichBlack,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(16)),
                  ),
                  padding: const EdgeInsets.only(
                    left: 16,
                    top: 16,
                    right: 16,
                  ),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 16),
                        child: SingleChildScrollView(
                          controller: scrollController,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                tvDetail.name,
                                style: kHeading5,
                              ),
                              BlocBuilder<WatchlistStatusTvBloc,
                                      WatchlistStatusTvState>(
                                  builder: (context, state) {
                                final status = state.props[0] as bool;
                                return ElevatedButton(
                                  onPressed: () async {
                                    if (!status) {
                                      context
                                          .read<WatchlistStatusTvBloc>()
                                          .add(AddTvToWatchlist(tvDetail));
                                    } else {
                                      context
                                          .read<WatchlistStatusTvBloc>()
                                          .add(RemoveTvFromWatchlist(tvDetail));
                                    }
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      status
                                          ? const Icon(Icons.check)
                                          : const Icon(Icons.add),
                                      const Text('Watchlist'),
                                    ],
                                  ),
                                );
                              }),
                              Text(
                                _showGenres(tvDetail.genres),
                              ),
                              Row(
                                children: [
                                  RatingBarIndicator(
                                    rating: tvDetail.voteAverage / 2,
                                    itemCount: 5,
                                    itemBuilder: (context, index) => const Icon(
                                      Icons.star,
                                      color: kMikadoYellow,
                                    ),
                                    itemSize: 24,
                                  ),
                                  Text('${tvDetail.voteAverage}')
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Overview',
                                style: kHeading6,
                              ),
                              Text(
                                tvDetail.overview.isNotEmpty
                                    ? tvDetail.overview
                                    : 'There is no overview for this TV show',
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Information Season',
                                style: kHeading6,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                    child: CachedNetworkImage(
                                      height: 125,
                                      imageUrl:
                                          'https://image.tmdb.org/t/p/w500${tvDetail.posterPath}',
                                      placeholder: (context, url) =>
                                          const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      tvDetail.firstAirDate.year !=
                                              tvDetail.lastAirDate.year
                                          ? Text(
                                              tvDetail.firstAirDate.year
                                                      .toString() +
                                                  ' - ' +
                                                  tvDetail.lastAirDate.year
                                                      .toString(),
                                              style: kHeading6,
                                            )
                                          : Text(
                                              tvDetail.firstAirDate.year
                                                  .toString(),
                                              style: kHeading6,
                                            ),
                                      Text(
                                        tvDetail.numberOfSeasons.toString() +
                                            ' Season | ' +
                                            tvDetail.numberOfEpisodes
                                                .toString() +
                                            ' Episode',
                                        style: kSubtitle,
                                      ),
                                      Text(
                                        'Status ' + tvDetail.status,
                                        style: kSubtitle,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),
                              Text(
                                'Recommendations',
                                style: kHeading6,
                              ),
                              SizedBox(
                                height: 150,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    final movie = recommendations[index];
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushReplacementNamed(
                                            context,
                                            TvDetailPage.routeName,
                                            arguments: movie.id,
                                          );
                                        },
                                        child: ClipRRect(
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(8),
                                          ),
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                                            placeholder: (context, url) =>
                                                const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    const Icon(Icons.error),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: recommendations.length,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: Colors.white,
                          height: 4,
                          width: 48,
                        ),
                      ),
                    ],
                  ),
                );
              },
              // initialChildSize: 0.5,
              minChildSize: 0.25,
              // maxChildSize: 1.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: kRichBlack,
              foregroundColor: Colors.white,
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  String _showGenres(List<Genre> genres) {
    String result = '';
    for (var genre in genres) {
      result += genre.name + ', ';
    }

    if (result.isEmpty) {
      return result;
    }

    return result.substring(0, result.length - 2);
  }
}
