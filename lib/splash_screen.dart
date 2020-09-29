import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:garbage_collector_user/mainScreen.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool check = false;

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("No internet connection"),
            content:
            Text("Please switch on your internet connection to proceed."),
            actions: [
              FlatButton(
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                  child: Text("Quit")),
              FlatButton(onPressed: () {}, child: Text("Okay")),
            ],
          );
        });
  }

  checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
      });
    } else if (connectivityResult == ConnectivityResult.wifi) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.of(context).pushReplacementNamed(MainScreen.routeName);
      });
    } else {
      _showDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!check) {
      check = true;
      checkConnection();
    }

    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Center(
          child: Text("Garbage Collector App", style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
