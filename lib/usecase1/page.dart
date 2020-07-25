import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_testapp/main.dart';
import 'package:flutter_testapp/usecase1/lastscreen.dart';

/*class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => Page1(),
        );
        break;
      case '/server':
        return MaterialPageRoute(
          builder: (context) => Page2(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => Page3(),
        );
    }
  }
}*/

/*void main() {
  runApp(MaterialApp(
    title: 'Named Routes Demo',
    // Start the app with the "/" named route. In this case, the app starts
    // on the FirstScreen widget.
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => Page1(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/page2': (context) => Page2(),
      '/page3': (context) => Page3(),
      '/page4': (context) => Page4(),
      '/page5': (context) => Page5(),
    },
  ));
}*/

class Page extends StatelessWidget {

  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Page1(),
      routes: <String, WidgetBuilder>{
        '/page1': (BuildContext context) => new Page1(),
        '/page2': (BuildContext context) => new Page2(),
        '/page3': (BuildContext context) => new Page3(),
        '/page4': (BuildContext context) => new Page4(),
        '/page5': (BuildContext context) => new Page5()
      },
    );
  }
}

class Page1 extends StatelessWidget {

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
        title: Text("Screen A"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),
                child: Text('Screen A')
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


class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Screen B"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),
                child: Text('Screen B')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  () {
          Navigator.of(context).push(_createRoute2());
        },
        child: Text('C'),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Screen C"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),
                child: Text('Screen C')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  () {
          Navigator.of(context).push(_createRoute3());
        },
        child: Text('M'),
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Screen M"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),
                child: Text('Screen M')
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:  () {
          Navigator.of(context).push(_createRoute4());
        },
        child: Text('N'),
      ),
    );
  }
}

class Page5 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenAPage(title: 'Screen N'),
    );
  }
}

class ScreenAPage extends StatefulWidget {
  ScreenAPage({Key key, this.title}) : super(key: key);
   String title;

  @override
  _ScreenAPageState createState() => _ScreenAPageState();
}

class _ScreenAPageState extends State<ScreenAPage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _isVisible = false;
      widget.title = 'Screen D';
    });
  }
  var _isVisible;
  @override
  initState() {
    super.initState();
    _isVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
         /* onPressed: () => Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (BuildContext context) => Page1()),
                  (Route<dynamic> route) => route is Page1
          )*/
//         onPressed: () =>     Navigator.of(context).pushNamed("/page1")
//         onPressed: () =>    Navigator.of(context).popAndPushNamed('/page1')


        ),
        title: Text(widget.title),
        centerTitle: true,
      ),
      /*appBar: AppBar(
        // Here we take the value from the ScreenAPage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(
          child: Text(widget.title),
        ),

      ),*/
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.all(20.0),
                child: Text(widget.title)
            ),
          ],
        ),
      ),
      floatingActionButton: new Visibility(
        visible: _isVisible,
        child: new FloatingActionButton(
          onPressed: _incrementCounter,
          child: Text('D'),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page2(),
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

Route _createRoute2() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page3(),
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

Route _createRoute3() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page4(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
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

Route _createRoute4() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LastScreen(),
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