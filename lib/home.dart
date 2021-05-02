import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:yoga_guru/poses.dart';
import 'package:yoga_guru/profile.dart';
import 'package:yoga_guru/scale_route.dart';
import 'package:yoga_guru/util/pose_data.dart';
import 'package:yoga_guru/util/user.dart';

class Home extends StatefulWidget {



  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CameraDescription> cameras;
  Future<void> cam() async {
    cameras = await availableCameras();
  }
  @override
  void initState() {
    // TODO: implement initState
    cam();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    User user = User();
    return Scaffold(

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              // Beginner Button
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    color: Colors.green,
                    child: Text(
                      'Beginner',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => _onPoseSelect(
                      context,
                      'Beginner',
                      beginnerAsanas,
                      Colors.green,
                    ),
                  ),
                ),
              ),

              // Intermediate Button
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    color: Colors.blue,
                    child: Text(
                      'Intermediate',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => _onPoseSelect(
                      context,
                      'Intermediate',
                      intermediateAsanas,
                      Colors.blue,
                    ),
                  ),
                ),
              ),

              // Advance Button
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: ButtonTheme(
                  minWidth: 200,
                  height: 60,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    color: Colors.deepPurple,
                    child: Text(
                      'Advance',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () => _onPoseSelect(
                      context,
                      'Advance',
                      advanceAsanas,
                      Colors.deepPurple[400],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPoseSelect(
      BuildContext context,
      String title,
      List<String> asanas,
      Color color,
      ) async {
    Navigator.push(
      context,
      ScaleRoute(
        page: Poses(
          cameras: cameras,
          title: title,
          model: "assets/models/posenet_mv1_075_float_from_checkpoints.tflite",
          asanas: asanas,
          color: color,
        ),
      ),
    );
  }
}

class CircleProfileImage extends StatefulWidget {
  final User user;
  const CircleProfileImage({this.user});

  @override
  _CircleProfileImageState createState() => _CircleProfileImageState(user);
}

class _CircleProfileImageState extends State<CircleProfileImage> {
  final User user;

  _CircleProfileImageState(this.user);
  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'profile',
      child: Center(
        child: CircleAvatar(
          radius: 15,
          backgroundImage: user.photoUrl.isEmpty
              ? AssetImage(
            'assets/images/profile-image.png',
          )
              : NetworkImage(user.photoUrl),
        ),
      ),
    );
  }
}
