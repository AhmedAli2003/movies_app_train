import 'package:equatable/equatable.dart';

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
  
  @override
  List<Object?> get props => [
    id,
    title,
    posterPath,
  ];
}
