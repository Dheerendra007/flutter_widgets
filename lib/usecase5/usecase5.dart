import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_testapp/usecase1/page.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';

import '../main.dart';

class UseCase5 extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UseCase5Page(title: 'Use Case 5'),
    );
  }
}

class UseCase5Page extends StatefulWidget {
  UseCase5Page({Key key, this.title}) : super(key: key);
  String title;

  @override
  _UseCase5PageState createState() => _UseCase5PageState();
}

class _UseCase5PageState extends State<UseCase5Page> {
  ProgressDialog _progressDialog = ProgressDialog();
@override
  initState() {
    super.initState();
    setState(() {
      _progressDialog.showProgressDialog(context,textToBeDisplayed: 'loading...',dismissAfter: Duration(seconds: 4));
    });
  
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () =>   Navigator.push(
              context,
               MaterialPageRoute(
                builder: (context) =>   MyApp(),
              ),
            ),

        ),
        title: Text('Use Case 5'),
        centerTitle: true,
      ),
      /*appBar: AppBar(
        // Here we take the value from the UseCase5Page object that was created by
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

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
class PageB extends StatelessWidget {
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
      /*floatingActionButton: FloatingActionButton(
        onPressed:  () {
          Navigator.of(context).push(_createRoute2());
        },
        child: Text('C'),
      ),*/
    );
  }
}


