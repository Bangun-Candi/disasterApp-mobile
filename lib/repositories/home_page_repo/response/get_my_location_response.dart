import 'package:json_annotation/json_annotation.dart';

part 'get_my_location_response.g.dart';

@JsonSerializable()
class GetMyLocationResponse {
  String? locationName;
  String? statusLocation;
  String? statusDisasterCode;
  String? sendRescueStatus;
  String? disasterName;
  String? disasterNameCode;

  GetMyLocationResponse({
    this.locationName,
    this.statusLocation,
    this.statusDisasterCode,
    this.sendRescueStatus,
    this.disasterName,
    this.disasterNameCode,
  });

  factory GetMyLocationResponse.fromJson(Map<String, dynamic> json) =>
      _$GetMyLocationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyLocationResponseToJson(this);
}
