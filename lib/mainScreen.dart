import 'package:flutter/material.dart';
import 'package:garbage_collector_user/map.dart';
import 'package:garbage_collector_user/navBarScreens/homeScreen.dart';
import 'package:garbage_collector_user/mainViewmodel.dart';
import 'package:garbage_collector_user/navBarScreens/userHistory.dart';
import 'package:stacked/stacked.dart';

class MainScreen extends StatefulWidget{
  static const routeName = 'mainScreen';
  const MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<MainViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(title: Text('udp17105'),backgroundColor: Color(0xff00B198),actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.map,
              color: Colors.white,
            ),
            onPressed: (){Navigator.of(context).pushNamed(MapSample.routeName);},
          )
        ],),
        body: getViewForIndex(model.currentIndex),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.white,
              // sets the active color of the `BottomNavigationBar` if `Brightness` is light
              primaryColor: Color(0xff00B198),
              textTheme: Theme
                  .of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.grey))),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: model.currentIndex,
            onTap: model.setIndex,
            items: [
              BottomNavigationBarItem(
                title: Text('Waste Type'),
                icon: Icon(Icons.calendar_today),
              ),
              BottomNavigationBarItem(
                title: Text('History'),
                icon: Icon(Icons.history),
              ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => MainViewModel(),
    );
  }

  Widget getViewForIndex(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return UserHistory();
      default:
        return HomeScreen();
    }
  }
}