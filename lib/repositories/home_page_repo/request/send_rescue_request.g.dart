// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_rescue_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendRescueRequest _$SendRescueRequestFromJson(Map<String, dynamic> json) =>
    SendRescueRequest(
      userEmail: json['userEmail'] as String?,
      userName: json['userName'] as String?,
      userPhoneNumber: json['userPhoneNumber'] as String?,
      longitudeLocation: json['longitudeLocation'] as String?,
      latitudeLocation: json['latitudeLocation'] as String?,
      rescuersCode: json['rescuersCode'] as String?,
      disasterTypeCode: json['disasterTypeCode'] as String?,
      statusDisaster: json['statusDisaster'] as String?,
      statusDisasterCode: json['statusDisasterCode'] as String?,
    );

Map<String, dynamic> _$SendRescueRequestToJson(SendRescueRequest instance) =>
    <String, dynamic>{
      'userEmail': instance.userEmail,
      'userName': instance.userName,
      'userPhoneNumber': instance.userPhoneNumber,
      'longitudeLocation': instance.longitudeLocation,
      'latitudeLocation': instance.latitudeLocation,
      'rescuersCode': instance.rescuersCode,
      'disasterTypeCode': instance.disasterTypeCode,
      'statusDisaster': instance.statusDisaster,
      'statusDisasterCode': instance.statusDisasterCode,
    };
