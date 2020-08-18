import 'package:flutter/material.dart';
import 'each_view.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  final _bottomNavigationColor = Colors.lightBlueAccent;
  int _currentIndex = 0;
  List<Widget> _list = List();

  @override
  void initState() {
    super.initState();
    _list
      ..add(EachView('HOME'))
      ..add(EachView('Email'))
      ..add(EachView('Pages'))
      ..add(EachView('AipPlay'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _list[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: _bottomNavigationColor,
            ),
            title:
                Text('Home', style: TextStyle(color: _bottomNavigationColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.email,
              color: _bottomNavigationColor,
            ),
            title:
                Text('Email', style: TextStyle(color: _bottomNavigationColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.pages,
              color: _bottomNavigationColor,
            ),
            title:
                Text('Pages', style: TextStyle(color: _bottomNavigationColor)),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.airplay,
              color: _bottomNavigationColor,
            ),
            title: Text('AipPlay',
                style: TextStyle(color: _bottomNavigationColor)),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}
