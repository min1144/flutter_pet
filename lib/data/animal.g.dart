// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'animal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimalResponse _$AnimalResponseFromJson(Map<String, dynamic> json) {
  return AnimalResponse(
      json['numOfRows'] as String,
      json['pageNo'] as String,
      json['totalCount'] as String,
      (json['items'] as List)
          ?.map((e) =>
              e == null ? null : Animal.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$AnimalResponseToJson(AnimalResponse instance) =>
    <String, dynamic>{
      'numOfRows': instance.numOfRows,
      'pageNo': instance.pageNo,
      'totalCount': instance.totalCount,
      'items': instance.items
    };

Animal _$AnimalFromJson(Map<String, dynamic> json) {
  return Animal(
      json['age'] as String,
      json['careAddr'] as String,
      json['careNm'] as String,
      json['careTel'] as String,
      json['chargeNm'] as String,
      json['colorCd'] as String,
      json['desertionNo'] as String,
      json['filename'] as String,
      json['happenDt'] as String,
      json['happenPlace'] as String,
      json['kindCd'] as String,
      json['neuterYn'] as String,
      json['noticeEdt'] as String,
      json['noticeNo'] as String,
      json['noticeSdt'] as String,
      json['officetel'] as String,
      json['orgNm'] as String,
      json['popfile'] as String,
      json['processState'] as String,
      json['sexCd'] as String,
      json['specialMark'] as String,
      json['weight'] as String);
}

Map<String, dynamic> _$AnimalToJson(Animal instance) => <String, dynamic>{
      'age': instance.age,
      'careAddr': instance.careAddr,
      'careNm': instance.careNm,
      'careTel': instance.careTel,
      'chargeNm': instance.chargeNm,
      'colorCd': instance.colorCd,
      'desertionNo': instance.desertionNo,
      'filename': instance.filename,
      'happenDt': instance.happenDt,
      'happenPlace': instance.happenPlace,
      'kindCd': instance.kindCd,
      'neuterYn': instance.neuterYn,
      'noticeEdt': instance.noticeEdt,
      'noticeNo': instance.noticeNo,
      'noticeSdt': instance.noticeSdt,
      'officetel': instance.officetel,
      'orgNm': instance.orgNm,
      'popfile': instance.popfile,
      'processState': instance.processState,
      'sexCd': instance.sexCd,
      'specialMark': instance.specialMark,
      'weight': instance.weight
    };
