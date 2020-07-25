import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_testapp/main.dart';
import 'package:flutter_testapp/usecase1/lastscreen.dart';
import 'package:flutter_testapp/usecase2/usecase2.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LockScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () =>  Navigator.pop(context, false)
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.lock_open),
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                  builder: (context) => new PageLock(),
                ),
              );
            },
          )
        ],
        title: Text("Use Case 3"),
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

class PageLock extends StatelessWidget {
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: () async => false,
      child: new Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FloatingActionButton(
                onPressed:  () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.lock),
              ),
            ],
          ),
        ),
      ),
    );
/*    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed:  () {
                Navigator.of(context).pop();
              },
              child: Text('N'),
            ),
          ],
        ),
      ),
    );*/
  }
}