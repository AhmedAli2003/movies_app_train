import 'package:equatable/equatable.dart';
import 'package:movies_app_train/app/constants/app_values.dart';

class MovieCollection extends Equatable {
  final int id;
  final String name;
  final String posterPath;

  const MovieCollection({
    required this.id,
    required this.name,
    required this.posterPath,
  });

  const MovieCollection.empty({
    this.id = AppValues.zero,
    this.name = AppValues.empty,
    this.posterPath = AppValues.empty,
  });

  @override
  List<Object?> get props => [id];
}
