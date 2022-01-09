library core;

export 'styles/colors.dart';
export 'styles/text_styles.dart';
export 'utils/constants.dart';
export 'utils/exception.dart';
export 'utils/failure.dart';
export 'utils/state_enum.dart';
export 'utils/routes.dart';
export 'utils/utils.dart';

export 'data/repositories/movie_repository_impl.dart';
export 'data/repositories/tv_repository_impl.dart';

export 'data/datasources/db/database_helper.dart';

export 'data/datasources/movie_local_data_source.dart';
export 'data/datasources/movie_remote_data_source.dart';
export 'data/datasources/tv_local_data_source.dart';
export 'data/datasources/tv_remote_data_source.dart';

export 'domain/repositories/movie_repository.dart';
export 'domain/repositories/tv_repository.dart';

export 'domain/entities/genre.dart';
export 'domain/entities/movie_detail.dart';
export 'domain/entities/movie.dart';
export 'domain/entities/season.dart';
export 'domain/entities/tv_detail.dart';
export 'domain/entities/tv_series.dart';

export 'domain/usecases/get_airing_today_tv.dart';
export 'domain/usecases/get_movie_detail.dart';
export 'domain/usecases/get_movie_recommendations.dart';
export 'domain/usecases/get_now_playing_movies.dart';
export 'domain/usecases/get_on_air_tv.dart';
export 'domain/usecases/get_popular_movies.dart';
export 'domain/usecases/get_popular_tv.dart';
export 'domain/usecases/get_top_rated_movies.dart';
export 'domain/usecases/get_top_rated_tv.dart';
export 'domain/usecases/get_tv_detail.dart';
export 'domain/usecases/get_tv_recommendations.dart';
export 'domain/usecases/get_tv_watchlist_status.dart';
export 'domain/usecases/get_watchlist_status.dart';
export 'domain/usecases/remove_tv_watchlist.dart';
export 'domain/usecases/remove_watchlist.dart';
export 'domain/usecases/save_tv_watchlist.dart';
export 'domain/usecases/save_watchlist.dart';

export 'presentation/widgets/movie_card_list.dart';
export 'presentation/widgets/tv_card_list.dart';

export 'presentation/pages/home_movie_page.dart';
export 'presentation/pages/home_page.dart';
export 'presentation/pages/home_tv_page.dart';
export 'presentation/pages/movie_detail_page.dart';
export 'presentation/pages/on_air_tv_page.dart';
export 'presentation/pages/popular_movies_page.dart';
export 'presentation/pages/popular_tv_page.dart';
export 'presentation/pages/top_rated_movies_page.dart';
export 'presentation/pages/top_rated_tv_page.dart';
export 'presentation/pages/tv_detail_page.dart';

export 'presentation/provider/movie_detail_notifier.dart';
export 'presentation/provider/movie_list_notifier.dart';
export 'presentation/provider/on_air_tv_notifier.dart';
export 'presentation/provider/popular_movies_notifier.dart';
export 'presentation/provider/popular_tv_notifier.dart';
export 'presentation/provider/top_rated_movies_notifier.dart';
export 'presentation/provider/top_rated_tv_notifier.dart';
export 'presentation/provider/tv_detail_notifier.dart';
export 'presentation/provider/tv_list_notifier.dart';

export 'data/models/genre_model.dart';
export 'data/models/movie_detail_model.dart';
export 'data/models/movie_model.dart';
export 'data/models/movie_response.dart';
export 'data/models/movie_table.dart';
export 'data/models/season_model.dart';
export 'data/models/tv_detail_model.dart';
export 'data/models/tv_model.dart';
export 'data/models/tv_response.dart';
export 'data/models/tv_table.dart';