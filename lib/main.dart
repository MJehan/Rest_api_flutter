import 'package:api_login/screens/home.dart';
import 'package:api_login/screens/login.dart';
import 'package:api_login/screens/registration.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Stack(children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset(
            "assets/ggg.jpg",
            fit: BoxFit.fill,
          ),
        ),
        (_loginStatus==1)?const Home():const SIgnUp()
      ],),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        //'/signin': (BuildContext context) =>  LoginScreen(),
        '/signup': (BuildContext context) => SIgnUp(),
        '/home': (BuildContext context) =>  Home(),
      },
    );
  }
  var _loginStatus=0;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      _loginStatus = preferences.getInt("value")!;
    });
  }
}

