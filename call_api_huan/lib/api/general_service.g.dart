// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralService<T> _$GeneralServiceFromJson<T>(Map<String, dynamic> json) =>
    GeneralService<T>(
      results: _dataFromJson(json['results'] as Object),
      message: json['message'] as String?,
      status: json['status'] as int?,
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralServiceToJson<T>(GeneralService<T> instance) =>
    <String, dynamic>{
      'results': _dataToJson(instance.results),
      'message': instance.message,
      'status': instance.status,
      'pagination': instance.pagination,
    };

GeneralServices _$GeneralServicesFromJson(Map<String, dynamic> json) =>
    GeneralServices(
      results: _dataListFromJson(json['results'] as Object),
      message: json['message'] as String?,
      status: json['status'] as int?,
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralServicesToJson(GeneralServices instance) =>
    <String, dynamic>{
      'results': instance.results,
      'message': instance.message,
      'status': instance.status,
      'pagination': instance.pagination,
    };
