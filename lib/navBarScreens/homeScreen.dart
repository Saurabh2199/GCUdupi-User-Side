import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget{
  static const routeName = '/home';
  @override
  Widget build(BuildContext context) {
    DateTime date = DateTime.now();
    final titles = ['Monday', 'Tuesday', 'Wednesday','Thursday', 'Friday', 'Saturday' , 'Sunday'];

    final images = ['assets/images/garbage.png','assets/images/trash.png','assets/images/garbage.png','assets/images/trash.png','assets/images/garbage.png','assets/images/trash.png','assets/images/garbage.png'];

    return Column(
      children: <Widget>[
        Container(margin: EdgeInsets.only(top: 10,bottom: 15,left: 20,right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Image.asset('assets/images/trash.png',width: 20,height: 20,),
                  Text('Wet Waste',style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.center,),
                ],
              ),
              Row(
                children: <Widget> [
                  Image.asset('assets/images/garbage.png',width: 20,height: 20,),
                  Text('Dry Waste',style: TextStyle(color: Colors.black,fontSize: 20),textAlign: TextAlign.center,),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: titles.length,
            itemBuilder: (context, index) {
              return Card(
                color: (titles[index] == DateFormat('EEEE').format(date))?Color(0xff00B198):Colors.white,
                child: ListTile(
                  title: Text(titles[index].toUpperCase(),style: TextStyle(color:(titles[index] == DateFormat('EEEE').format(date))?Colors.white:Colors.black),),
                  subtitle: Text((titles[index] == DateFormat('EEEE').format(date))?'Today':'',style: TextStyle(color:(titles[index] == DateFormat('EEEE').format(date))?Colors.white:Colors.black),),
                  trailing: Container(child: Image.asset(images[index],width: 40,height: 40,),),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}