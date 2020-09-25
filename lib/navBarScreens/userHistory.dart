import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';


class UserHistory extends StatefulWidget{
  static const routeName = '/userHistory';
  @override
  _UserHistoryState createState() => _UserHistoryState();
}

class _UserHistoryState extends State<UserHistory> {

  List userList = [];

  bool isLoad = true;
  @override
  void initState() {
    super.initState();
    _getUsers();
  }

  _getUsers() async {
    final response = await http.post(
        "https://xtoinfinity.tech/GCUdupi/user/php/getUserHistory.php", body: {
    });
    final jsonRespone = json.decode(response.body);
    userList = jsonRespone['userhistory'].cast<Map<String, dynamic>>();
    setState(() {
      isLoad = false;
    });
  }

  Widget loadWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SpinKitDoubleBounce(
          size: MediaQuery
              .of(context)
              .size
              .width * 0.2,
          color: Theme
              .of(context)
              .primaryColor,
        ),
        SizedBox(
          height: MediaQuery
              .of(context)
              .size
              .height * 0.05,
        ),
        Text("Please wait")
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    return isLoad ? loadWidget() :ListView.builder(
      itemCount: userList.length,
      itemBuilder: (context, index) {
        DateTime _date = DateTime.parse(userList[index]["time"]);
        return Card( //                           <-- Card widget
          child: ListTile(
            leading: Icon(Icons.timelapse,color: Color(0xff00B198),),
            title: Text(DateFormat("EEEE").format(_date)),
            subtitle: Text(DateFormat("h:mm a").format(_date)),
            trailing: Text(DateFormat("dd-MM-yyyy").format(_date)),
          ),
        );
      },
    );
  }
}