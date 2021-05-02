
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

import '../home.dart';


class mental extends StatefulWidget {
  @override
  mentalState createState() => mentalState();
}

class mentalState extends State<mental> {
  List data;
  dynamic u1;
  dynamic u2;


  Future<void> getData() async {
    http.Response response = await http.get('https://www.scorebat.com/video-api/v1/');
    List data = jsonDecode(response.body);
    setState(() {
      u1 = data[0]['title'];
      u2 = data[0]['side1']['url'];

    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://www.wvi.org/clean-water-sanitation-and-hygiene-wash/menstrual-hygiene',
          javascriptMode: JavascriptMode.unrestricted,

        ),
      ),
    );
  }
}

class ecom extends StatefulWidget {
  @override
  _ecomState createState() => _ecomState();
}

class _ecomState extends State<ecom> {
  List data;
  dynamic u1;
  dynamic u2;


  Future<void> getData() async {
    http.Response response = await http.get('https://www.scorebat.com/video-api/v1/');
    List data = jsonDecode(response.body);
    setState(() {
      u1 = data[0]['title'];
      u2 = data[0]['side1']['url'];

    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://give.grameenfoundation.org/?utm_campaign=fbad2&gclid=Cj0KCQjw0caCBhCIARIsAGAfuMwD47quSzY_uOZN3_NTjNB1peympzeZuVfSfHiZbx9EM17mlMiFbdcaAj21EALw_wcB',
          javascriptMode: JavascriptMode.unrestricted,

        ),
      ),
    );
  }
}


class social extends StatefulWidget {
  @override
  _helpState createState() => _helpState();
}

class _helpState extends State<alan> {
  List data;
  dynamic u1;
  dynamic u2;


  Future<void> getData() async {
    http.Response response = await http.get('https://www.scorebat.com/video-api/v1/');
    List data = jsonDecode(response.body);
    setState(() {
      u1 = data[0]['title'];
      u2 = data[0]['side1']['url'];

    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://www.meetup.com/topics/women/',
          javascriptMode: JavascriptMode.unrestricted,

        ),
      ),
    );
  }
}


class help extends StatefulWidget {
  @override
  _helpState createState() => _helpState();
}

class alanState extends State<alan> {
  List data;
  dynamic u1;
  dynamic u2;


  Future<void> getData() async {
    http.Response response = await http.get('https://www.scorebat.com/video-api/v1/');
    List data = jsonDecode(response.body);
    setState(() {
      u1 = data[0]['title'];
      u2 = data[0]['side1']['url'];

    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://indianhelpline.com/WOMEN-HELPLINE/',
          javascriptMode: JavascriptMode.unrestricted,

        ),
      ),
    );
  }
}



class alan extends StatefulWidget {
  @override
  _helpState createState() => _helpState();
}

class helpState extends State<alan> {
  List data;
  dynamic u1;
  dynamic u2;


  Future<void> getData() async {
    http.Response response = await http.get('https://www.scorebat.com/video-api/v1/');
    List data = jsonDecode(response.body);
    setState(() {
      u1 = data[0]['title'];
      u2 = data[0]['side1']['url'];

    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: 'https://indianhelpline.com/WOMEN-HELPLINE/',
          javascriptMode: JavascriptMode.unrestricted,

        ),
      ),
    );
  }
}





