import 'package:dio/dio.dart';
import 'package:movies_app_train/app/constants/app_constants.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:retrofit/retrofit.dart';
import '../models/movies_info_model.dart';
import '../models/detailed_movie_model.dart';

part 'movie_remote_data_source.g.dart';

@RestApi(baseUrl: AppUrls.movieBaseUrl)
abstract class MovieRemoteDataSource {
  factory MovieRemoteDataSource(Dio dio, {String baseUrl}) = _MovieRemoteDataSource;

  @GET(AppUrls.nowPlayingMovies)
  Future<MovieInfoModel> getNowPlayingMovies({
    @Query(AppUrls.apiKeyQuery) String apiKey = AppUrls.apiKey,
    @Query(AppUrls.languageQuery) String language = AppConstants.language,
    @Query(AppUrls.pageQuery) int page = AppUrls.firstPage,
  });

  @GET(AppUrls.popularMovies)
  Future<MovieInfoModel> getPopularMovies({
    @Query(AppUrls.apiKeyQuery) String apiKey = AppUrls.apiKey,
    @Query(AppUrls.languageQuery) String language = AppConstants.language,
    @Query(AppUrls.pageQuery) int page = AppUrls.firstPage,
  });
  
  @GET(AppUrls.topRatedMovies)
  Future<MovieInfoModel> getTopRatedMovies({
    @Query(AppUrls.apiKeyQuery) String apiKey = AppUrls.apiKey,
    @Query(AppUrls.languageQuery) String language = AppConstants.language,
    @Query(AppUrls.pageQuery) int page = AppUrls.firstPage,
  });

  @GET(AppUrls.upcomingMovies)
  Future<MovieInfoModel> getUpcomingMovies({
    @Query(AppUrls.apiKeyQuery) String apiKey = AppUrls.apiKey,
    @Query(AppUrls.languageQuery) String language = AppConstants.language,
    @Query(AppUrls.pageQuery) int page = AppUrls.firstPage,
  });

  @GET('/{id}')
  Future<DetailedMovieModel> getMovieDetails({
    @Path() required int id,
    @Query(AppUrls.apiKeyQuery) String apiKey = AppUrls.apiKey,
    @Query(AppUrls.languageQuery) String language = AppConstants.language,
  });

  @GET('/{id}/${AppUrls.similargMovies}')
  Future<MovieInfoModel> getSimilarMovies({
    @Path() required int id,
    @Query(AppUrls.apiKeyQuery) String apiKey = AppUrls.apiKey,
    @Query(AppUrls.languageQuery) String language = AppConstants.language,
    @Query(AppUrls.pageQuery) int page = AppUrls.firstPage,
  });
}
