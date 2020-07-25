import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_testapp/main.dart';
import 'package:flutter_testapp/usecase1/lastscreen.dart';
import 'package:flutter_testapp/usecase2/usecase2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenD extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new Usecase2(),
            ),
          ),
        ),
        title: Text("Screen D"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),
                child: Text('Screen D')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  () async {
//          Usecase2._selectedIndex = 2;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setInt('position', 1);
          Navigator.push(
            context,
            new MaterialPageRoute(
              builder: (context) => new Usecase2(),
            ),
          );
        },
        child: Text('B'),
      ),

    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Usecase2(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(1.0, 0.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}