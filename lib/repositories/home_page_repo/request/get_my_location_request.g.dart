// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_my_location_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetMyLocationRequest _$GetMyLocationRequestFromJson(
        Map<String, dynamic> json) =>
    GetMyLocationRequest(
      userEmail: json['userEmail'] as String?,
      userName: json['userName'] as String?,
      longitudeLocation: json['longitudeLocation'] as String?,
      latitudeLocation: json['latitudeLocation'] as String?,
    );

Map<String, dynamic> _$GetMyLocationRequestToJson(
        GetMyLocationRequest instance) =>
    <String, dynamic>{
      'userEmail': instance.userEmail,
      'userName': instance.userName,
      'longitudeLocation': instance.longitudeLocation,
      'latitudeLocation': instance.latitudeLocation,
    };
