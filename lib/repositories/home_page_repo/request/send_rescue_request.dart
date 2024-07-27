import 'package:json_annotation/json_annotation.dart';

part 'send_rescue_request.g.dart';

@JsonSerializable()
class SendRescueRequest {
  String? userEmail;
  String? userName;
  String? userPhoneNumber;
  String? longitudeLocation;
  String? latitudeLocation;
  String? rescuersCode;
  String? disasterTypeCode;
  String? statusDisaster;
  String? statusDisasterCode;

  SendRescueRequest({
    this.userEmail,
    this.userName,
    this.userPhoneNumber,
    this.longitudeLocation,
    this.latitudeLocation,
    this.rescuersCode,
    this.disasterTypeCode,
    this.statusDisaster,
    this.statusDisasterCode,
  });

  factory SendRescueRequest.fromJson(Map<String, dynamic> json) =>
      _$SendRescueRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendRescueRequestToJson(this);
}
