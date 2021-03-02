import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pet/constants.dart';
import 'package:flutter_pet/data/animal.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class FindAnimal extends StatefulWidget {
  @override
  _FindAnimalState createState() => _FindAnimalState();
}

class _FindAnimalState extends State<FindAnimal> {
  List<Animal> animalList;
  int _pageNo = 1;

  static const int _numOfPages = 30;

  @override
  void initState() {
    super.initState();
    _requestAnimalList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: Text(Constants.APP_NAME)),
        body: ListView.builder(
            itemCount: (animalList == null) ? 0 : animalList.length,
            itemBuilder: (BuildContext context, int index) {
              return _buildListItem(context, index);
        })
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
      final animal = animalList[index];
      return Card(
        child: Row(
          children: [
            Image.network(animal.filename, width: 100, height: 100, fit: BoxFit.cover,),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      children: [
                        Text('akdkdkddndndn 졸라길어어어아나나누누나누나', maxLines: 1, overflow: TextOverflow.ellipsis,)
                      ],
                    ),
                )
                )
          ],
        )
      );
  }

  Future<void> _requestAnimalList() async {
    String url =
        'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic'
        '?ServiceKey=${Constants.SERVICE_KEY}&pageNo=$_pageNo&numOfRows=$_numOfPages';

    try {
      Xml2Json xml2json = new Xml2Json();
      final baseReponse = await http.get(url);
      if(baseReponse.statusCode == 200) {
        xml2json.parse(baseReponse.body);

        var jsonData = xml2json.toParker();
        var data = json.decode(jsonData);
        var animalResponse = AnimalResponse.fromJson(data['response']['body']);
        setState(() {
          animalList = animalResponse.items;
        });
      }
    } catch(e) {
      print('api error : ${e.toString()}');
    }
  }

  void _initList() {
    setState(() {
      _pageNo = 1;
      if(animalList != null) animalList.clear();
    });
  }
}
