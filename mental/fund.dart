
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

import '../home.dart';


class fund extends StatefulWidget {
  @override
  _fundState createState() => _fundState();
}

class _fundState extends State<fund> {
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
