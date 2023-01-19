import 'package:flutter/material.dart';
import 'package:google_ml_vision/google_ml_vision.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: firstPage(),
    );
  }
}

class firstPage extends StatelessWidget {

  PickedFile? _image;

  Future getImageFromCam() async {
    var image =
    await ImagePicker.platform.pickImage(source: ImageSource.camera);
    _image = image;
    print(_image!.path);
  }

  Future getImageFromGallery() async {
    var image =
    await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    _image = image;
    print(_image!.path);
  }

  late GoogleVisionImage visionImage;
  TextRecognizer textRecognizer = GoogleVision.instance.textRecognizer();
  late VisionText visionText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top: 16.0),
        child: FloatingActionButton(
          backgroundColor: Colors.red,
          onPressed: () {
            getImageFromCam();
          },
          heroTag: 'video0',
          tooltip: 'Pick Video from gallery',
          child: const Icon(Icons.video_library),
        ),
      ),
    );
  }
}
