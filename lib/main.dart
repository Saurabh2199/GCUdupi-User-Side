import 'package:flutter/material.dart';
import 'package:garbage_collector_user/map.dart';
import 'package:garbage_collector_user/navBarScreens/homeScreen.dart';
import 'package:garbage_collector_user/mainScreen.dart';
import 'package:garbage_collector_user/navBarScreens/userHistory.dart';
import 'package:garbage_collector_user/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        accentColor: Color(0xffFFF8DC),
        primaryColor: Color(0xff00B198),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
      routes: {
        MainScreen.routeName:(ctx)=>MainScreen(),
        HomeScreen.routeName:(ctx)=>HomeScreen(),
        UserHistory.routeName:(ctx)=>UserHistory(),
        MapSample.routeName:(ctx)=>MapSample(),
      },
    );
  }
}
