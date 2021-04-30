import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';


class detect extends StatefulWidget {
  @override
  _detectState createState() => _detectState();
}

class _detectState extends State<detect> {

  bool _isLoading;
  File _image;
  List _output;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _isLoading = true;
    loadMLModel().then((value){
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white,
        title: Text("Covid19Detector",style: TextStyle(color: Colors.black),),
      ),
      body: _isLoading ? Container(
        alignment: Alignment.center,
        child: Text('Upload Lung X-RAY',style: TextStyle(color: Colors.black),),
      ) : Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null ? Center(child: Text('Upload Lung X-RAY',style: TextStyle(color: Colors.black))) :
            Image.file(_image,fit: BoxFit.fill,),
            SizedBox(height: 16,),
            _output == null ? FloatingActionButton(
              backgroundColor: Colors.black45,
              onPressed: () {
                chooseImage();
              },
              child: Icon(
                  Icons.image
              ),
            ): Text(
                "${_output[0]["label"]}"
            )
          ],
        ),
      ),


    );
  }

  chooseImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _isLoading = true;
      _image = image;
    });
    runModelOnImage(image);
  }

  runModelOnImage(File image) async{
    var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults: 2,
        imageMean: 127.5,
        imageStd: 127.5,
        threshold: 0.5
    );
    setState(() {

      _isLoading = false;
      _output = output;
    });
  }


  loadMLModel() async {
    await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt"
    );
  }
}

