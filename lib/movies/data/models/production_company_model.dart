import 'package:json_annotation/json_annotation.dart';
import 'package:movies_app_train/app/constants/app_urls.dart';
import 'package:movies_app_train/app/constants/app_values.dart';
import 'package:movies_app_train/movies/domain/entities/production_company.dart';

part 'production_company_model.g.dart';

@JsonSerializable()
class ProductionCompanyModel extends ProductionCompany {
  @JsonKey(name: AppJsonKeys.id)
  final int? idM;
  @JsonKey(name: AppJsonKeys.logoPath)
  final String? logoPathM;
  @JsonKey(name: AppJsonKeys.name)
  final String? nameM;
  @JsonKey(name: AppJsonKeys.country)
  final String? countryM;

  const ProductionCompanyModel({required this.idM, required this.nameM, required this.logoPathM, required this.countryM})
      : super(
          country: countryM ?? AppValues.strOrNull,
          id: idM ?? AppValues.intOrNull,
          logoPath: logoPathM ?? AppValues.strOrNull,
          name: nameM ?? AppValues.strOrNull,
        );

  factory ProductionCompanyModel.fromJson(Map<String, dynamic> json) => _$ProductionCompanyModelFromJson(json);
  Map<String, dynamic> toJson() => _$ProductionCompanyModelToJson(this);
}
