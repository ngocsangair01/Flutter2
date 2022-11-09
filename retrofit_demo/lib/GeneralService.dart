


import 'package:json_annotation/json_annotation.dart';

import 'Pagination.dart';
part 'GeneralService.g.dart';
@JsonSerializable()
class GeneralService<T> {
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  dynamic data;
  String message;
  String code;
  String status;

  GeneralService({this.data, this.message, this.code, this.status});

  factory GeneralService.fromJson(Map<String, dynamic> json) => _$GeneralServiceFromJson<T>(json);

}

@JsonSerializable()
class GeneralServices {
  GeneralData data;
  String message;
  String code;
  String status;

  GeneralServices({this.data, this.message, this.code, this.status});

  factory GeneralServices.fromJson(dynamic json) => _$GeneralServicesFromJson(json);

}

@JsonSerializable()
class GeneralData {
  @JsonKey(fromJson: _dataListFromJson)
  dynamic records;
  Pagination pagination;

  GeneralData({this.pagination, this.records});
  factory GeneralData.fromJson(dynamic json) => _$GeneralDataFromJson(json);
}


dynamic _dataListFromJson(Object input){
  if (input != null) {

    return input ;
  }
}

Map<String, dynamic> _dataFromJson<T>(Map<String, dynamic> input) {
  if (input != null) {

    return input ;
  }
}

Map<String, dynamic> _dataToJson<T>(T input) =>
    {'value': input};