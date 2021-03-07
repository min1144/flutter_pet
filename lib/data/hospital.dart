import 'package:json_annotation/json_annotation.dart';
part 'hospital.g.dart';

@JsonSerializable()
class Hospitals {
  final List<Hospital> hospitals;

  Hospitals(this.hospitals);

  Hospitals.fromJson(Map<String, dynamic> json)
      : hospitals = (json['hospitals'] as List).map((i) => Hospital.fromJson(i)).toList();
}

@JsonSerializable()
class Hospital {

  final int id;
  final String address;
  final String image;
  final double lat;
  final double lng;
  final String name;
  final String phone;
  final String site;

  Hospital(this.id, this.address, this.image, this.lat, this.lng, this.name,
      this.phone, this.site);

  factory Hospital.fromJson(Map<String, dynamic> json) => _$HospitalFromJson(json);
  Map<String, dynamic> toJson() => _$HospitalToJson(this);
}