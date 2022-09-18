class AppUrls {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String _movieEndPoint = '/movie';
  static const String movieBaseUrl = '$baseUrl$_movieEndPoint';
  static const String apiKey = '4ca6210c4c36c339b58667aa2777140c';
  static const String nowPlayingMovies = '/now_playing';
  static const String popularMovies = '/popular';
  static const String topRatedMovies = '/top_rated';
  static const String upcomingMovies = '/upcoming';
  static const String similargMovies = '/similar';
  static const String apiKeyQuery = 'api_key';
  static const String languageQuery = 'language';
  static const String pageQuery = 'page';
  static const int firstPage = 1;
  static const String _baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String url) => '$_baseImageUrl$url';
}

class AppJsonKeys {
  static const String id = 'id';
  static const String originalLanguage = 'original_language';
  static const String overview = 'overview';
  static const String posterPath = 'poster_path';
  static const String releaseDate = 'release_date';
  static const String title = 'title';
  static const String name = 'name';
  static const String voteAverage = 'vote_average';
  static const String currentPage = 'page';
  static const String totalPages = 'total_pages';
  static const String totalMovies = 'total_results';
  static const String movies = 'results';
  static const String logoPath = 'logo_path';
  static const String country = 'origin_country';
  static const String adult = 'adult';
  static const String collection = 'belongs_to_collection';
  static const String budget = 'budget';
  static const String genres = 'genres';
  static const String homepage = 'homepage';
  static const String productionCompanies = 'production_companies';
  static const String revenue = 'revenue';
  static const String runtime = 'runtime';
  static const String status = 'status';
  static const String username = 'username';
  static const String email = 'email';
  static const String password = 'password';
  static const String favorites = 'favorites';
  static const String watched = 'watched';
  static const String wantToWatch = 'want_to_watch';
  static const String dontWantToWatch = 'dont_want_to_watch';
}
