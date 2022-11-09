


import 'package:json_annotation/json_annotation.dart';

import 'Pagination.dart';

part 'general_service.g.dart';

@JsonSerializable()
class GeneralService<T> {
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  dynamic data;
  String? message;
  bool? success;

  GeneralService({this.data, this.message, this.success});

  factory GeneralService.fromJson(Map<String, dynamic> json) => _$GeneralServiceFromJson<T>(json);

}

@JsonSerializable()
class GeneralServices {
  GeneralData? data;
  String? message;
  bool? success;

  GeneralServices({this.data, this.message, this.success});

  factory GeneralServices.fromJson(dynamic json) => _$GeneralServicesFromJson(json);

}

@JsonSerializable()
class GeneralData {
  @JsonKey(fromJson: _dataListFromJson)
  dynamic records;
  Pagination? pagination;

  GeneralData({this.pagination, this.records});
  factory GeneralData.fromJson(dynamic json) => _$GeneralDataFromJson(json);
}


dynamic _dataListFromJson(Object input){
  return input ;
}

Map<String, dynamic> _dataFromJson<T>(Map<String, dynamic> input) {
  return input ;
}

Map<String, dynamic> _dataToJson<T>(T input) =>
    {'value': input};