class AppUrls {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String _movieEndPoint = '/movie';
  static const String movieBaseUrl = '$baseUrl$_movieEndPoint';
  static const String apiKey = '4ca6210c4c36c339b58667aa2777140c';
  static const String nowPlayingMovies = '/now_playing';
  static const String popularMovies = '/popular';
  static const String topRatedMovies = '/top_rated';
  static const String upcomingMovies = '/upcoming';
  static const String apiKeyQuery = 'api_key';
  static const String languageQuery = 'language';
  static const String pageQuery = 'page';
  static const int firstPage = 1;
  static const String _baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String url) => '$_baseImageUrl$url';
}

class AppJsonKeys {
  static const String id = 'id';
  static const String genereIds = 'genre_ids';
  static const String originalLanguage = 'original_language';
  static const String overview = 'overview';
  static const String posterPath = 'poster_path';
  static const String releaseDate = 'release_date';
  static const String title = 'title';
  static const String voteAverage = 'vote_average';
  static const String currentPage = 'page';
  static const String totalPages = 'total_pages';
  static const String totalMovies = 'total_results';
  static const String movies = 'results';
}
