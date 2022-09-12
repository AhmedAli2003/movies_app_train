import 'package:equatable/equatable.dart';

class Movie extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final String originalLanguage;
  final String releaseDate;
  final double voteAverage;
  final List<int> genreIds;

  const Movie({
    required this.id,
    required this.originalLanguage,
    required this.genreIds,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
  });
  
  @override
  List<Object?> get props => [
    id,
    title,
    posterPath,
    overview,
    originalLanguage,
    releaseDate,
    voteAverage,
    genreIds,
  ];
}