import 'package:json_annotation/json_annotation.dart';

part 'get_my_location_request.g.dart';

@JsonSerializable()
class GetMyLocationRequest {
  String? userEmail;
  String? userName;
  String? longitudeLocation;
  String? latitudeLocation;

  GetMyLocationRequest({
    this.userEmail,
    this.userName,
    this.longitudeLocation,
    this.latitudeLocation,
  });

  factory GetMyLocationRequest.fromJson(Map<String, dynamic> json) =>
      _$GetMyLocationRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyLocationRequestToJson(this);
}
