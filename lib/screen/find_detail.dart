import 'package:flutter/material.dart';
import 'package:flutter_pet/data/animal.dart';
import 'package:flutter_pet/widget/animal_detail_view.dart';

import '../constants.dart';

class FindDetail extends StatefulWidget {
  @override
  _FindDetailState createState() => _FindDetailState();
}

class _FindDetailState extends State<FindDetail> {
  @override
  Widget build(BuildContext context) {
    final Animal animalArgs = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(Constants.APP_NAME)),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => _onTapImage(animalArgs.popfile),
              child: Image.network(
                animalArgs.popfile,
                width: double.infinity,
                height: 300,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
              child: Text(
                animalArgs.kindCd,
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown[700]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.transparent, style: BorderStyle.solid),
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, top: 5.0, right: 10.0, bottom: 5.0),
                  child: Text(
                    animalArgs.processState,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
              child: AnimalDetailView('색상 / 성별',
                  '${animalArgs.colorCd} / ${Constants.changeSex(animalArgs.sexCd)}'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView('나이', '${animalArgs.age}'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView(
                '무게',
                '${animalArgs.weight}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView(
                '중성화여부',
                '${_getNeuter(animalArgs.age)}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView(
                '특징',
                '${animalArgs.specialMark}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0, bottom: 20.0),
              child: AnimalDetailView(
                '유기번호',
                '${animalArgs.desertionNo}',
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
              child: AnimalDetailView(
                '보호소 명',
                '${animalArgs.careNm}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView(
                '보호 장소',
                '${animalArgs.careAddr}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView(
                '보호소 연락처',
                '${animalArgs.careTel}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView(
                '담당자',
                '${animalArgs.chargeNm}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 12.0, bottom: 20.0),
              child: AnimalDetailView(
                '담당자 연락처',
                '${animalArgs.officetel}',
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.grey[300],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 20.0, right: 10.0),
              child: AnimalDetailView(
                '접수일',
                '${Constants.appendDate(animalArgs.happenDt)}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView(
                '발견장소',
                '${animalArgs.happenPlace}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView(
                '공고번호',
                '${animalArgs.noticeNo}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView(
                '공고기간',
                '${Constants.appendDate(animalArgs.noticeSdt)} ~ ${Constants.appendDate(animalArgs.noticeEdt)}',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, top: 12.0, right: 10.0),
              child: AnimalDetailView(
                '관할기관',
                '${animalArgs.orgNm}',
              ),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  String _getNeuter(String neuter) {
    if (neuter == 'Y') return 'O';
    if (neuter == 'N') return 'N';
    return '모름';
  }

  void _onTapImage(String url) {
    Navigator.pushNamed(context, Constants.FIND_DETAIL_PHOTO, arguments: url);
  }
}
