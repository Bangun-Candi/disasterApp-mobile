// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'idcard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdCardModel _$IdCardModelFromJson(Map<String, dynamic> json) => IdCardModel(
      address: json['address'] as String?,
      birthPlace: json['birthPlace'] as String?,
      birthdate: json['birthdate'] as String?,
      bloodGroup: json['bloodGroup'] as String?,
      gender: json['gender'] as String?,
      maritalStatus: json['maritalStatus'] as String?,
      name: json['name'] as String?,
      nationality: json['nationality'] as String?,
      nik: json['nik'] as String?,
      occupation: json['occupation'] as String?,
      religion: json['religion'] as String?,
      rtrw: json['rtrw'] as String?,
      subdistrict: json['subdistrict'] as String?,
      village: json['village'] as String?,
    );

Map<String, dynamic> _$IdCardModelToJson(IdCardModel instance) =>
    <String, dynamic>{
      'nik': instance.nik,
      'name': instance.name,
      'birthdate': instance.birthdate,
      'birthPlace': instance.birthPlace,
      'gender': instance.gender,
      'bloodGroup': instance.bloodGroup,
      'address': instance.address,
      'rtrw': instance.rtrw,
      'village': instance.village,
      'subdistrict': instance.subdistrict,
      'religion': instance.religion,
      'maritalStatus': instance.maritalStatus,
      'occupation': instance.occupation,
      'nationality': instance.nationality,
    };
