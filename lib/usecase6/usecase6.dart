import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_testapp/main.dart';
import 'package:flutter_testapp/usecase1/lastscreen.dart';

class UseCase6 extends StatelessWidget {

  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new UseCase61(),
      routes: <String, WidgetBuilder>{
        '/UseCase61': (BuildContext context) => new UseCase61(),
        '/UseCase62': (BuildContext context) => new UseCase62(),

      },
    );
  }
}

class UseCase61 extends StatelessWidget {

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
        title: Text("Use Case 6"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),

            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  () {
          Navigator.of(context).push(_createRoute());
        },
        child: Text('B'),
      ),

    );
  }
}


class UseCase62 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Screen 6"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(left:5.0,right: 5.0),
                child: TextField(
                  decoration: InputDecoration(

                  ),
                )
            ),
          ],
        ),
      ),

    );
  }
}


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => UseCase62(),
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

