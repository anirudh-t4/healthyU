import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:location/location.dart';
import 'package:yoga_guru/medkit/animations/bottomAnimation.dart';

class MapUtils {
  MapUtils._();

  static Future<void> openMap(String location) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$location';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }
}


class Map extends StatefulWidget {
  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
    child: SizedBox(
    child: RaisedButton(
    color: Colors.white,
    shape: StadiumBorder(),
    onPressed: () {
    MapUtils.openMap('Vocational training near me');
    })));
  }
}

