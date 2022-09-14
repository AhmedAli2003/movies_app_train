// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'production_company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductionCompanyModel _$ProductionCompanyModelFromJson(
        Map<String, dynamic> json) =>
    ProductionCompanyModel(
      idM: json['id'] as int?,
      nameM: json['name'] as String?,
      logoPathM: json['logo_path'] as String?,
      countryM: json['origin_country'] as String?,
    );

Map<String, dynamic> _$ProductionCompanyModelToJson(
        ProductionCompanyModel instance) =>
    <String, dynamic>{
      'id': instance.idM,
      'logo_path': instance.logoPathM,
      'name': instance.nameM,
      'origin_country': instance.countryM,
    };
