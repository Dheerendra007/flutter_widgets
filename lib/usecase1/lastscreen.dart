import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_testapp/usecase1/page.dart';

class LastScreen extends StatelessWidget {
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
//            onPressed: () =>   Navigator.pushNamedAndRemoveUntil(context, "/", (r) => false)
//            onPressed: () =>   Navigator.pop(context)
//            onPressed: () =>   Navigator.pushReplacement(context, Page())
            onPressed: () =>    Navigator.push(
              context,
              new MaterialPageRoute(
                builder: (context) => new Page(),
              ),
            )



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



