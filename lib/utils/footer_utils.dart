import 'package:flutter/material.dart';
 
class FooterUtils extends StatefulWidget {
  @override
  _FooterUtilsState createState() => _FooterUtilsState();
}

class _FooterUtilsState extends State<FooterUtils> {
  int _selectedIndex = 0;
void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
          canvasColor: Colors.white,
          primaryColor: Color.fromRGBO(52, 54, 101, 1.0),
          textTheme: Theme.of(context).textTheme.copyWith(
              caption:
                  new TextStyle(color: Color.fromRGBO(116, 117, 152, 1.0)))),
      child: new BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          fixedColor: Colors.pink,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.home,
                  size: 30.0,
                ),
                title: new Container()),
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.calendar_today,
                  size: 30.0,
                ),
                title: new Container()),
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.assignment,
                  size: 30.0,
                ),
                title: new Container()),
          ]),
    );
  
  }
}