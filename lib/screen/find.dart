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
  ScrollController _scrollController;
  List<Animal> _animalList;
  int _pageNo = 1;
  int _numOfPages = 30;
  bool isLoad = false;

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      new GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    _animalList = new List<Animal>();
    _scrollController = new ScrollController();
    _scrollController.addListener(_scrollListener);
    _requestAnimalList();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text(Constants.APP_NAME)),
      body: RefreshIndicator(
          key: _refreshIndicatorKey,
          onRefresh: _refreshList,
          child: ListView.builder(
              controller: _scrollController,
              itemCount: (_animalList == null) ? 0 : _animalList.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildListItem(context, index);
              })),
    );
  }

  Widget _buildListItem(BuildContext context, int index) {
    final animal = _animalList[index];
    return Padding(
      padding: EdgeInsets.only(
          left: 10.0, top: _getTopMargin(index), right: 10.0, bottom: 10.0),
      child: GestureDetector(
          onTap: () => _goFindDetail(animal),
          child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10)),
                    child: Image.network(
                      animal.popfile,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${animal.kindCd}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          '${animal.colorCd} / ${Constants.changeSex(animal.sexCd)}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          Constants.nonNullString(animal.chargeNm),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ],
                    ),
                  ))
                ],
              ))),
    );
  }

  Future<void> _requestAnimalList() async {
    String url = 'http://openapi.animal.go.kr/openapi/service/rest/abandonmentPublicSrvc/abandonmentPublic'
        '?ServiceKey=${Constants.SERVICE_KEY}&pageNo=$_pageNo&numOfRows=$_numOfPages';

    try {
      Xml2Json xml2json = new Xml2Json();
      final baseReponse = await http.get(url);
      if (baseReponse.statusCode == 200) {
        xml2json.parse(baseReponse.body);

        var jsonData = xml2json.toParker();
        var data = json.decode(jsonData);
        var animalResponse = AnimalResponse.fromJson(data['response']['body']);
        setState(() {
          _animalList.addAll(animalResponse.items);
          isLoad = false;
        });
      }
    } catch (e) {
      print('api error : ${e.toString()}');
    }
  }

  _scrollListener() {
    if(_scrollController.position.pixels <= 0.0) return;
    if((_scrollController.position.maxScrollExtent * 0.6) <= _scrollController.position.pixels) {
      setState(() {
        if(isLoad) return;
        isLoad = true;
        _pageNo +=1;
        _requestAnimalList();
      });
    }
  }

  void _initList() {
    setState(() {
      isLoad = false;
      _pageNo = 1;
      if (_animalList != null) _animalList.clear();
    });
  }

  Future<void> _refreshList() async {
    _initList();
    _requestAnimalList();
  }

  double _getTopMargin(int index) {
    return index == 0 ? 20.0 : 0.0;
  }

  void _goFindDetail(Animal animal) {
    Navigator.pushNamed(context, Constants.FIND_DETAIL, arguments: animal);
  }
}
