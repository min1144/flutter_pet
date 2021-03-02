import 'package:json_annotation/json_annotation.dart';
part 'animal.g.dart';

@JsonSerializable()
class AnimalResponse {

  final String numOfRows;
  final String pageNo;
  final String totalCount;
  final List<Animal> items;

  AnimalResponse.fromJson(Map<String, dynamic> json)
      :  numOfRows = json['numOfRows'],
         pageNo = json['pageNo'],
         totalCount = json['totalCount'],
         items = (json['items']['item'] as List).map((i) => Animal.fromJson(i)).toList();

  AnimalResponse(this.numOfRows, this.pageNo, this.totalCount, this.items);

  Map<String, dynamic> toJson() => _$AnimalResponseToJson(this);
}

@JsonSerializable()
class Animal {

  final String age;
  final String careAddr;
  final String careNm;
  final String careTel;
  final String chargeNm;
  final String colorCd;
  final String desertionNo;
  final String filename;
  final String happenDt;
  final String happenPlace;
  final String kindCd;
  final String neuterYn;
  final String noticeEdt;
  final String noticeNo;
  final String noticeSdt;
  final String officetel;
  final String orgNm;
  final String popfile;
  final String processState;
  final String sexCd;
  final String specialMark;
  final String weight;

  Animal(
      this.age,
      this.careAddr,
      this.careNm,
      this.careTel,
      this.chargeNm,
      this.colorCd,
      this.desertionNo,
      this.filename,
      this.happenDt,
      this.happenPlace,
      this.kindCd,
      this.neuterYn,
      this.noticeEdt,
      this.noticeNo,
      this.noticeSdt,
      this.officetel,
      this.orgNm,
      this.popfile,
      this.processState,
      this.sexCd,
      this.specialMark,
      this.weight);

    factory Animal.fromJson(Map<String, dynamic> json) => _$AnimalFromJson(json);
    Map<String, dynamic> toJson() => _$AnimalToJson(this);
}