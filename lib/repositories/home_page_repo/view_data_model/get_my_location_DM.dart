import 'package:json_annotation/json_annotation.dart';

part 'get_my_location_DM.g.dart';

@JsonSerializable()
class GetMyLocationDM {
  String? locationName;
  String? statusLocation;
  String? statusDisasterCode;
  String? sendRescueStatus;
  String? disasterName;
  String? disasterNameCode;

  GetMyLocationDM({
    this.locationName,
    this.statusLocation,
    this.statusDisasterCode,
    this.sendRescueStatus,
    this.disasterName,
    this.disasterNameCode,
  });

  factory GetMyLocationDM.fromJson(Map<String, dynamic> json) =>
      _$GetMyLocationDMFromJson(json);

  Map<String, dynamic> toJson() => _$GetMyLocationDMToJson(this);
}
