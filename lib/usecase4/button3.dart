import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_testapp/usecase4/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Button3 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Button3Page();
  }
}

class Button3Page extends StatefulWidget {
  Button3Page() : super();

  @override
  _Button3PageState createState() => _Button3PageState();
}



/*Future navigateToSetting(context) async {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => HomeScreen()));
}*/

Future navigateToLogin(context) async {
//  Navigator.pushReplacement(
//      context, MaterialPageRoute(builder: (context) => MyApp()));
}

class _Button3PageState extends State<Button3Page> {

  var _selectedImg = "";

  @override
  void initState() {
    super.initState();
    _getSession();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () {
      //trigger leaving and use own data
      Navigator.pop(context, false);

      //we need to return a future
      return Future.value(false);
    },
    child: Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        flexibleSpace: Image(
          image: AssetImage(_selectedImg),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: Icon(Icons.location_on,color: Colors.amber,),
            onPressed: () {
            },
          )
        ],
      ),
      drawer: MenuScreen(),
      body: Container(

        alignment: Alignment.center,
        child: PageView(
          children: <Widget>[

            Container(
              color: Colors.white,
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings,color: Colors.blueAccent,),
            title: Text('b3/t1'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.computer,color: Colors.blueAccent,),
            title: Text('b3/t2'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warning,color: Colors.blueAccent,),
            title: Text('b3/t3'),
          ),
        ],
//        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.blueAccent,
        backgroundColor: Colors.amber,

//        onTap: _onItemTapped,
      ),
    )
    );
  }
  Future _getSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _selectedImg = await prefs.getString('image');
//     print(_selectedIndex);
    if(_selectedImg==null){
      _selectedImg = 'assets/images/mark3.jpg';
    }
//     print(_selectedIndex);
    setState(() {
      _selectedImg;
    });
  }
}
