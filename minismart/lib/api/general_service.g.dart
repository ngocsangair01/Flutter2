// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_service.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralService<T> _$GeneralServiceFromJson<T>(Map<String, dynamic> json) =>
    GeneralService<T>(
      data: _dataFromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$GeneralServiceToJson<T>(GeneralService<T> instance) =>
    <String, dynamic>{
      'data': _dataToJson(instance.data),
      'message': instance.message,
      'success': instance.success,
    };

GeneralServices _$GeneralServicesFromJson(Map<String, dynamic> json) =>
    GeneralServices(
      data: json['data'] == null ? null : GeneralData.fromJson(json['data']),
      message: json['message'] as String?,
      success: json['success'] as bool?,
    );

Map<String, dynamic> _$GeneralServicesToJson(GeneralServices instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'success': instance.success,
    };

GeneralData _$GeneralDataFromJson(Map<String, dynamic> json) => GeneralData(
      pagination: json['pagination'],
      records: _dataListFromJson(json['records'] as Object),
    );

Map<String, dynamic> _$GeneralDataToJson(GeneralData instance) =>
    <String, dynamic>{
      'records': instance.records,
      'pagination': instance.pagination,
    };
