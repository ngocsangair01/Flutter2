


import 'package:json_annotation/json_annotation.dart';

import './pagination.dart';

part 'general_service.g.dart';

@JsonSerializable()
class GeneralService<T> {
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  dynamic results;
  String? message;
  int? status;
  Pagination? pagination;
  GeneralService({this.results, this.message, this.status, this.pagination});

  factory GeneralService.fromJson(Map<String, dynamic> json) => _$GeneralServiceFromJson<T>(json);

}

@JsonSerializable()
class GeneralServices {
  @JsonKey(fromJson: _dataListFromJson)
  dynamic results;
  String? message;
  int? status;
  Pagination? pagination;
  GeneralServices({this.results, this.message, this.status,this.pagination});

  factory GeneralServices.fromJson(dynamic json) => _$GeneralServicesFromJson(json);

}

// @JsonSerializable()
// class GeneralData {
//   @JsonKey(fromJson: _dataListFromJson)
//   dynamic records;
//   Pagination? pagination;
//
//   GeneralData({this.pagination, this.records});
//   factory GeneralData.fromJson(dynamic json) => _$GeneralDataFromJson(json);
// }


dynamic _dataListFromJson(Object input){
  return input ;
}

dynamic _dataFromJson<T>(Object input) {
  return input ;
}

Map<String, dynamic> _dataToJson<T>(T input) =>
    {'value': input};