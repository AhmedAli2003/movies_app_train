import 'package:equatable/equatable.dart';

class ProductionCompany extends Equatable {
  final int id;
  final String logoPath;
  final String name;
  final String country;

  const ProductionCompany({
    required this.id,
    required this.logoPath,
    required this.name,
    required this.country,
  });

  @override
  List<Object?> get props => [id, logoPath, name, country];
}
