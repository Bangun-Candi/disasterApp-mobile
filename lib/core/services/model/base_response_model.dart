import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel {
  String? statusCode;
  bool? isError;
  String? message;
  dynamic data;

  BaseResponseModel({
    this.statusCode,
    this.isError,
    this.message,
    this.data,
  });

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseModelToJson(this);
}
