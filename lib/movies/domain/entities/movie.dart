import 'package:equatable/equatable.dart';
import 'package:movies_app_train/movies/data/models/movie_model.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String releaseDate;
  final String overview;
  final double voteAverage;

  const Movie({
    required this.id,
    required this.posterPath,
    required this.title,
    required this.releaseDate,
    required this.overview,
    required this.voteAverage,
  });

  MovieModel toModel() {
    return MovieModel(
      idM: id,
      titleM: title,
      overviewM: overview,
      posterPathM: posterPath,
      releaseDateM: releaseDate,
      voteAverageM: voteAverage,
    );
  }
  
  @override
  List<Object?> get props => [
    id,
    title,
    posterPath,
    releaseDate,
    overview,
    voteAverage,
  ];
}
