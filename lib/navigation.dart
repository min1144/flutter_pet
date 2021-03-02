import 'package:flutter/material.dart';
import 'package:flutter_pet/screen/find.dart';
import 'package:flutter_pet/screen/hospital_map.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectIndex = 0;

  static const ICON_SIZE = 20.0;
  static List<Widget> _bottomOptions = <Widget> [
    FindAnimal(),
    HospitalMap()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(child: _bottomOptions.elementAt(_selectIndex)),
        bottomNavigationBar: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.yellow,
              primaryColor: Colors.brown[900],
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: TextStyle(color: Colors.white))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectIndex,
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/animal.png",
                  color: _getUnselectColor(0),
                  width: ICON_SIZE,
                  height: ICON_SIZE,
                ),
                label: "동물찾기",
              ),

              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/hospital.png",
                  color: _getUnselectColor(1),
                  width: ICON_SIZE,
                  height: ICON_SIZE,
                ),
                label: '병원찾기',
              )
            ],
            onTap: _onTapItem,
          ),
        ));
  }

  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  Color _getUnselectColor(int index) {
    return (index == _selectIndex) ? Colors.brown : Colors.white;
  }
}
