// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_location_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyLocationResponse _$GetMyLocationResponseFromJson(
        Map<String, dynamic> json) =>
    GetMyLocationResponse(
      locationName: json['locationName'] as String?,
      statusLocation: json['statusLocation'] as String?,
      statusDisasterCode: json['statusDisasterCode'] as String?,
      sendRescueStatus: json['sendRescueStatus'] as String?,
      disasterName: json['disasterName'] as String?,
      disasterNameCode: json['disasterNameCode'] as String?,
    );

Map<String, dynamic> _$GetMyLocationResponseToJson(
        GetMyLocationResponse instance) =>
    <String, dynamic>{
      'locationName': instance.locationName,
      'statusLocation': instance.statusLocation,
      'statusDisasterCode': instance.statusDisasterCode,
      'sendRescueStatus': instance.sendRescueStatus,
      'disasterName': instance.disasterName,
      'disasterNameCode': instance.disasterNameCode,
    };
