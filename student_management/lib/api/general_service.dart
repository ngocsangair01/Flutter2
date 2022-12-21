


import 'package:json_annotation/json_annotation.dart';

import './pagination.dart';

part 'general_service.g.dart';

// ==============Call api dạng list========================
@JsonSerializable()
class GeneralService<T> {
  @JsonKey(fromJson: _dataFromJson, toJson: _dataToJson)
  dynamic data;
  String? status;
  Pagination? pagination;
  GeneralService({this.data, this.status, this.pagination});

  factory GeneralService.fromJson(Map<String, dynamic> json) => _$GeneralServiceFromJson<T>(json);

}

@JsonSerializable()
class GeneralServices {
  @JsonKey(fromJson: _dataListFromJson)
  dynamic data;
  String? status;
  Pagination? pagination;
  GeneralServices({this.data, this.status,this.pagination});

  factory GeneralServices.fromJson(dynamic json) => _$GeneralServicesFromJson(json);

}


dynamic _dataFromJson<T>(Object input) {
  return input ;
}
//================================Call api dạng body=============================

@JsonSerializable()
class GeneralService2<T> {
  @JsonKey(fromJson: _dataFromJson2, toJson: _dataToJson)
  dynamic data;
  String? status;

  GeneralService2({this.data, this.status,});

  factory GeneralService2.fromJson(Map<String, dynamic> json) => _$GeneralService2FromJson<T>(json);

}

@JsonSerializable()
class GeneralServices2 {
  GeneralData? data;
  String? status;

  GeneralServices2({this.data, this.status});

  factory GeneralServices2.fromJson(dynamic json) => _$GeneralServices2FromJson(json);

}
@JsonSerializable()
class GeneralData {
  @JsonKey(fromJson: _dataListFromJson)
  dynamic items;
  Pagination? pagination;

  GeneralData({this.pagination, this.items});
  factory GeneralData.fromJson(dynamic json) => _$GeneralDataFromJson(json);
}

Map<String, dynamic> _dataFromJson2<T>(Map<String, dynamic> input) {
  return input ;
}

//====================================Dùng chung========================
dynamic _dataListFromJson(Object input){
  return input ;
}
Map<String, dynamic> _dataToJson<T>(T input) =>
    {'value': input};
