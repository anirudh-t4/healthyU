import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_guru/medkit/animations/bottomAnimation.dart';
import 'package:yoga_guru/medkit/animations/fadeAnimation.dart';
import 'package:yoga_guru/medkit/doctor/doctorLogin.dart';
import 'package:yoga_guru/medkit/patient/patientLogin.dart';
import 'package:yoga_guru/medkit/patient/patientPanel.dart';

import '../../main.dart';

class Category1 extends StatefulWidget {
  final PatientDetails detailsUser;

  Category1({Key key, @required this.detailsUser}) : super(key: key);

  @override
  _Category1State createState() => _Category1State();
}

class _Category1State extends State<Category1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Future<bool> _onWillPop() async {
      return (await showDialog(
            context: context,
            builder: (context) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              title: new Text(
                "Exit Application",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: new Text("Are You Sure?"),
              actions: <Widget>[
                // usually buttons at the bottom of the dialog
                FlatButton(
                  shape: StadiumBorder(),
                  color: Colors.white,
                  child: new Text(
                    "No",
                    style: TextStyle(color: Colors.blue),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  shape: StadiumBorder(),
                  color: Colors.white,
                  child: new Text(
                    "Yes",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          )) ??
          false;
    }

    return
       Scaffold(
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: height * 0.065,
              ),
              FadeAnimation(
                0.3,
                Container(
                  margin: EdgeInsets.only(left: width * 0.05),
                  width: width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Category',
                        style: TextStyle(color: Colors.black, fontSize: height * 0.04),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: height * 0.09),
              Column(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    radius: height * 0.075,
                    child: Image(image: AssetImage("assets/doctor.png"), height: height * 0.2,),
                  ),
                  WidgetAnimator(patDocBtn('Doctor', context)),
                  SizedBox(
                    height: height * 0.1,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.black.withOpacity(0.2),
                    radius: height * 0.075,
                    child: Image(image: AssetImage("assets/patient.png"), height: height * 0.2,),
                  ),
                  WidgetAnimator(patDocBtn('Patient', context)),
                  SizedBox(
                    height: height * 0.13,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Version',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'V 0.1',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  )
                ],
              )
            ],
          ),
        ),
      );

  }

  Widget patDocBtn(String categoryText, context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.5,
      child: RaisedButton(
        onPressed: () {
          if (categoryText == 'Doctor') {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => DoctorLogin(
                    )));
          } else {
            Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (context) => PatientPanel(
                      detailsUser: widget.detailsUser,
                    )));
          }
        },
        color: Colors.white,
        child: Text("I am " + categoryText),
        shape: StadiumBorder(),
      ),
    );
  }
}
