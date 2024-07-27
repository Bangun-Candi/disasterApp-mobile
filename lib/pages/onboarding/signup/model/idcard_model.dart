import 'package:json_annotation/json_annotation.dart';

part 'idcard_model.g.dart';

@JsonSerializable()
class IdCardModel {
  String? nik;
  String? name;
  String? birthdate;
  String? birthPlace;
  String? gender;
  String? bloodGroup;
  String? address;
  String? rtrw;
  String? village;
  String? subdistrict;
  String? religion;
  String? maritalStatus;
  String? occupation;
  String? nationality;

  IdCardModel({
    this.address,
    this.birthPlace,
    this.birthdate,
    this.bloodGroup,
    this.gender,
    this.maritalStatus,
    this.name,
    this.nationality,
    this.nik,
    this.occupation,
    this.religion,
    this.rtrw,
    this.subdistrict,
    this.village,
  });

  factory IdCardModel.fromJson(Map<String, dynamic> json) =>
      _$IdCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$IdCardModelToJson(this);
}
