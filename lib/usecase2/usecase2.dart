// Flutter code sample for BottomNavigationBar

// This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// widget. The [BottomNavigationBar] has three [BottomNavigationBarItem]
// widgets and the [currentIndex] is set to index 0. The selected item is
// amber. The `_onItemTapped` function changes the selected item's index
// and displays a corresponding message in the center of the [Scaffold].
//
// ![A scaffold with a bottom navigation bar containing three bottom navigation
// bar items. The first one is selected.](https://flutter.github.io/assets-for-api-docs/assets/material/bottom_navigation_bar.png)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_testapp/main.dart';
import 'package:flutter_testapp/usecase1/page.dart';
import 'package:flutter_testapp/usecase2/screend.dart';
import 'package:flutter_testapp/usecase2/screenda.dart';
import 'package:shared_preferences/shared_preferences.dart';


/// This Widget is the main application widget.
class Usecase2 extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}


class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  var imageprofile = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  final List<Widget> _widgetOptions = [
    PlaceholderWidget(),
    PlaceholderWidget2(),
    PlaceholderWidget3()
  ];

  @override
  void initState() {
    super.initState();
    _getSession();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new MyApp(),
            ),
          ),
        ),
        title: Text("Use Case 2"),
        centerTitle: true,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Screen A'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: Text('Screen B'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            title: Text('Screen C'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
  Future _getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedIndex = await prefs.getInt('position');
    print(_selectedIndex);
    if(_selectedIndex==null){
      _selectedIndex = 0;
    }
    print(_selectedIndex);
    setState(() {
      _selectedIndex;

    });
  }
}
class PlaceholderWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(80.0),
            child:RaisedButton.icon(onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt('position', 0);
              Navigator.push(
                context, CupertinoPageRoute(builder: (context) => ScreenD()),
              );
            }, label: Text('Screen D'), icon: Icon(Icons.home, color: Colors.black)) ,
          ),
          Container(
              margin: EdgeInsets.all(80.0),
              child:Text('Screen A')
          ),
        ],
      ),

    );
  }
}

class PlaceholderWidget2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(80.0),
            child:RaisedButton.icon(onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setInt('position', 1);
              Navigator.push(
                context, CupertinoPageRoute(builder: (context) => ScreenDA()),
              );
            }, label: Text('Screen D'), icon: Icon(Icons.star, color: Colors.black)) ,
          ),
          Container(
              margin: EdgeInsets.all(80.0),
              child:Text('Screen B')
          ),
        ],
      ),

    );
  }
}

class PlaceholderWidget3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(80.0),
              child:Icon(Icons.play_arrow, color: Colors.black)),
          Container(
              margin: EdgeInsets.all(80.0),
              child:Text('Screen C')
          ),
        ],
      ),

    );
  }
}

