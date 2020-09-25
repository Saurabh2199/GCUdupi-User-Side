import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:garbage_collector_user/model/location.dart';
import 'package:http/http.dart' as http;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class GetData {
  Future<void> getData(List<Location> _l) async {
    final response = await http.post(
        "https://xtoinfinity.tech/GCUdupi/user/php/mapMarker.php", body: {
    });
    final jsonRespone = json.decode(response.body);
    List location = jsonRespone['locations'].cast<Map<String, dynamic>>();
    location.map((e){
      return _l.add(Location(
        lat: e["lat"],
        lon: e["lon"],
        time: e["time"],
      ));
    }).toList();
    return;
  }

  Future<void> addMarkers(Set<Marker>cm,List<Location> loc,DateTime todayDate,) async{
    List<Location> todayList = [];

    loc.map((e){
      DateTime _date = DateTime.parse(e.time);
      if (todayDate.day == _date.day) {
        todayList.add(e);
      cm.add(
        Marker(infoWindow: InfoWindow(title: DateFormat("H:m:s").format(_date)),
          markerId: MarkerId('1'),
          position: LatLng(
            double.parse(e.lat),
            double.parse(e.lon),
          ),
        ),
      );}
    }).toList();
    return;
  }
}
class MapSample extends StatefulWidget {
  static const routeName = '/map';
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();
  Set<Marker> allMarkers = {};
  GetData _getData = GetData();
  List<Location> l = [];
  bool _isload = true;
  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void>getData() async{
    DateTime date = DateTime.now();
    allMarkers.clear();
    await _getData.getData(l);
    await _getData.addMarkers(allMarkers, l,date);
    setState(() {
      _isload=false;
    });
    return;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Recent Garbage Van Locations'),backgroundColor: Color(0xff00B198),),
      body: (_isload)?Center(child: CircularProgressIndicator(),):GoogleMap(
        markers: allMarkers,
        initialCameraPosition: CameraPosition(target: LatLng(double.parse(l[0].lat),
            double.parse(l[0].lon)),
          zoom: 18.0, ),
        mapType: MapType.normal,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}

