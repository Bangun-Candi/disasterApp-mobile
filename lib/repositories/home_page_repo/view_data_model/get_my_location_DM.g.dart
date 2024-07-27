// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_location_DM.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyLocationDM _$GetMyLocationDMFromJson(Map<String, dynamic> json) =>
    GetMyLocationDM(
      locationName: json['locationName'] as String?,
      statusLocation: json['statusLocation'] as String?,
      statusDisasterCode: json['statusDisasterCode'] as String?,
      sendRescueStatus: json['sendRescueStatus'] as String?,
      disasterName: json['disasterName'] as String?,
      disasterNameCode: json['disasterNameCode'] as String?,
    );

Map<String, dynamic> _$GetMyLocationDMToJson(GetMyLocationDM instance) =>
    <String, dynamic>{
      'locationName': instance.locationName,
      'statusLocation': instance.statusLocation,
      'statusDisasterCode': instance.statusDisasterCode,
      'sendRescueStatus': instance.sendRescueStatus,
      'disasterName': instance.disasterName,
      'disasterNameCode': instance.disasterNameCode,
    };
