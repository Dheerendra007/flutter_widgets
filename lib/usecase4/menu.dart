
import 'package:flutter/material.dart';
import 'package:flutter_testapp/usecase4/button1.dart';
import 'package:flutter_testapp/usecase4/button2.dart';
import 'package:flutter_testapp/usecase4/button3.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuScreen extends StatelessWidget {
  final appTitle = 'Home';

  @override
  Widget build(BuildContext context) {
    return MenuScreenPage();
  }
}


class MenuScreenPage extends StatefulWidget {
  MenuScreenPage() : super();

  @override
  MenuScreenPageState createState() => MenuScreenPageState();
}

/*class _Button1PageState extends State<Button1Page> {
  int _counter = 0;
  String dropdownValue = 'English';
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(*/

 class MenuScreenPageState extends  State<MenuScreenPage>  {
//  final String title;
  var _selectedImg = "";
//  var imageprofile = "";
  AssetImage _imageToShow;


//  MenuScreenPageState(this.title, {Key key}) : super(key: key);

  @override
  initState() {
    super.initState();
//    setState(() {
      _getSession();

//    });
  }
//    _imageToShow = AssetImage('assets/images/mark3.jpg');
//  }

  @override
  Widget build(BuildContext context) {
    return
      Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: Container(
          color: Colors.white,
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding:
            EdgeInsets.only(
                left: 0.0,
                bottom: 0.0,
                right: 0.0,
                top: 0.0),
            children: <Widget>[
          Container(
          padding: EdgeInsets.only(left: 10.0),
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: _imageToShow,
//                image:  AssetImage('assets/images/mark3.jpg'),
                fit: BoxFit.fill,
              ),
            )),

             /* Container(
                  height: 150,
                  child:  FittedBox(
                    child: Image(image: _imageToShow),
                    fit: BoxFit.fill,
                  )),*/
              GestureDetector(
//                onTap: () => print("Container pressed"),
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('image', 'assets/images/mark3.jpg');
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (ctxt) => new Button1()));
                },
                child: Container(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        bottom: 0.0,
                                        right: 20.0,
                                        top: 0.0),
                                    child: Icon(Icons.code)),
                              ),
                              Container(
                                child: Text(
                                  'Button1',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black), //red
                                ),
                              ),
                            ]),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          color: Colors.white,
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 40.0, bottom: 0.0, top: 20.0),
                        ),
                      ],
                    )),
              ),
              GestureDetector(
//                onTap: () => print("Container pressed"),
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('image', 'assets/images/captain.jpg');
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (ctxt) => new Button2()));
                },
                child: Container(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        bottom: 0.0,
                                        right: 20.0,
                                        top: 0.0),
                                    child:  Icon(Icons.color_lens)),
                              ),
                              Container(
                                child: Text(
                                  'Button2',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black), //red
                                ),
                              ),
                            ]),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          color: Colors.white,
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 40.0, bottom: 0.0, top: 20.0),
                        ),
                      ],
                    )),
              ),

              GestureDetector(
//                onTap: () => print("Container pressed"),
                onTap: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('image', 'assets/images/marval.jpg');
                  Navigator.pop(context);
                  Navigator.pushReplacement(context,
                      new MaterialPageRoute(builder: (ctxt) => new Button3()));
                },
                child: Container(
                    height: 60,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 20.0,
                                        bottom: 0.0,
                                        right: 20.0,
                                        top: 0.0),
                                    child: Icon(Icons.wb_sunny)
                                ),
                              ),
                              Container(
                                child: Text(
                                  'Button3',
                                  style: TextStyle(
                                      fontSize: 12, color: Colors.black), //red
                                ),
                              ),
                            ]),
                        Container(
                          height: 1.0,
                          width: double.infinity,
                          color: Colors.white,
                          margin: const EdgeInsets.only(
                              left: 20.0, right: 40.0, bottom: 0.0, top: 20.0),
                        ),
                      ],
                    )),
              ),
              /*ListTile(
                title: Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),*/
            ],
          ),
        ),
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
       _imageToShow = AssetImage(_selectedImg);
     });
   }
 }



