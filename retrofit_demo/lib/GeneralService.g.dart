// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GeneralService.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralService<T> _$GeneralServiceFromJson<T>(Map<String, dynamic> json) {
  return GeneralService<T>(
    data: _dataFromJson(json['data'] as Map<String, dynamic>),
    message: json['message'] as String,
    code: json['code'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$GeneralServiceToJson<T>(GeneralService<T> instance) =>
    <String, dynamic>{
      'data': _dataToJson(instance.data),
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };

GeneralServices _$GeneralServicesFromJson(Map<String, dynamic> json) {
  return GeneralServices(
    data: json['data'] == null ? null : GeneralData.fromJson(json['data']),
    message: json['message'] as String,
    code: json['code'] as String,
    status: json['status'] as String,
  );
}

Map<String, dynamic> _$GeneralServicesToJson(GeneralServices instance) =>
    <String, dynamic>{
      'data': instance.data,
      'message': instance.message,
      'code': instance.code,
      'status': instance.status,
    };

GeneralData _$GeneralDataFromJson(Map<String, dynamic> json) {
  return GeneralData(
    pagination: json['pagination'] == null
        ? null
        : Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
    records: _dataListFromJson(json['records']),
  );
}

Map<String, dynamic> _$GeneralDataToJson(GeneralData instance) =>
    <String, dynamic>{
      'records': instance.records,
      'pagination': instance.pagination,
    };
