// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralService<T> _$GeneralServiceFromJson<T>(Map<String, dynamic> json) =>
    GeneralService<T>(
      data: _dataFromJson(json['data'] as Object),
      status: json['status'] as String?,
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralServiceToJson<T>(GeneralService<T> instance) =>
    <String, dynamic>{
      'data': _dataToJson(instance.data),
      'status': instance.status,
      'pagination': instance.pagination,
    };

GeneralServices _$GeneralServicesFromJson(Map<String, dynamic> json) =>
    GeneralServices(
      data: _dataListFromJson(json['data'] as Object),
      status: json['status'] as String?,
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GeneralServicesToJson(GeneralServices instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
      'pagination': instance.pagination,
    };

GeneralService2<T> _$GeneralService2FromJson<T>(Map<String, dynamic> json) =>
    GeneralService2<T>(
      data: _dataFromJson2(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GeneralService2ToJson<T>(GeneralService2<T> instance) =>
    <String, dynamic>{
      'data': _dataToJson(instance.data),
      'status': instance.status,
    };

GeneralServices2 _$GeneralServices2FromJson(Map<String, dynamic> json) =>
    GeneralServices2(
      data: json['data'] == null ? null : GeneralData.fromJson(json['data']),
      status: json['status'] as String?,
    );

Map<String, dynamic> _$GeneralServices2ToJson(GeneralServices2 instance) =>
    <String, dynamic>{
      'data': instance.data,
      'status': instance.status,
    };

GeneralData _$GeneralDataFromJson(Map<String, dynamic> json) => GeneralData(
      pagination: json['pagination'] == null
          ? null
          : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      items: _dataListFromJson(json['items'] as Object),
    );

Map<String, dynamic> _$GeneralDataToJson(GeneralData instance) =>
    <String, dynamic>{
      'items': instance.items,
      'pagination': instance.pagination,
    };
