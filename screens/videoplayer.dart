import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:http/http.dart' as http;

import '../home.dart';


class med_vid extends StatefulWidget {
  med_vid({this.url});
  final String url;

  @override
  _med_vidState createState() => _med_vidState();
}

class _med_vidState extends State<med_vid> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        body: WebView(
          initialUrl: widget.url,
          javascriptMode: JavascriptMode.unrestricted,

        ),
      ),
    );
  }
}
