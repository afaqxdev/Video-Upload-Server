import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:image_picker/image_picker.dart';

class CameraApp extends StatefulWidget {

  const CameraApp({Key? key}) : super(key: key);

  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {

  
getVidoe()async{
await ImagePicker().pickVideo(source: ImageSource.camera);


}
  



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Camera App')),
     
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            getVidoe();
              // Process the camera image here if needed
           
          } catch (e) {
            print(e);
          }
        },
        child: Icon(Icons.camera),
      ),
    );
  }
}
