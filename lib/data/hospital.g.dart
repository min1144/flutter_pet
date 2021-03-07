// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hospital.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hospitals _$HospitalsFromJson(Map<String, dynamic> json) {
  return Hospitals((json['hospitals'] as List)
      ?.map((e) =>
          e == null ? null : Hospital.fromJson(e as Map<String, dynamic>))
      ?.toList());
}

Map<String, dynamic> _$HospitalsToJson(Hospitals instance) =>
    <String, dynamic>{'hospitals': instance.hospitals};

Hospital _$HospitalFromJson(Map<String, dynamic> json) {
  return Hospital(
      json['id'] as int,
      json['address'] as String,
      json['image'] as String,
      (json['lat'] as num)?.toDouble(),
      (json['lng'] as num)?.toDouble(),
      json['name'] as String,
      json['phone'] as String,
      json['site'] as String);
}

Map<String, dynamic> _$HospitalToJson(Hospital instance) => <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'image': instance.image,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'phone': instance.phone,
      'site': instance.site
    };
