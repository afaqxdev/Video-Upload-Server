// ignore_for_file: avoid_print, library_private_types_in_public_api, use_build_context_synchronously, deprecated_member_use

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'dart:convert';

class VideoUploadScreen extends StatefulWidget {
  const VideoUploadScreen({super.key});

  @override
  _VideoUploadScreenState createState() => _VideoUploadScreenState();
}

class _VideoUploadScreenState extends State<VideoUploadScreen> {
  String videoName = '';
  String authKey =
  // '27bf4dc0-7e5a-49eb-bbb5c60206b9-4d6c-474a'; // my id 
      '3b9a5399-6ab4-4da7-b8808b9c943f-fc3e-4c0b'; // cilent
  String libraryId =
  // "167616"; // my id
   '179528'; // cilent id
  double uploadPercent = 0.0;

 Future<bool> uploadVideo(
    File videoFile, String authKey, String libraryId, String videoName) async {
  const baseUrl = "https://video.bunnycdn.com/library/";
  final uploadUrl = Uri.parse('$baseUrl$libraryId/videos');

  // Create a new video entry with a title
  final createResponse = await http.post(
    uploadUrl,
    headers: {
      'AccessKey': authKey,
      'Content-Type': 'application/json',
    },
    body: jsonEncode({'title': videoName}),
  );

  if (createResponse.statusCode == 200) {
    final videoGuid = jsonDecode(createResponse.body)['guid'];
    final videoUrl = Uri.parse('$baseUrl$libraryId/videos/$videoGuid');
print(videoUrl);
    // Upload the video file
    final uploadResponse = await http.put(
      videoUrl,
      headers: {'AccessKey': authKey},
      body: videoFile.readAsBytesSync(),
    );

    if (uploadResponse.statusCode == 200) {
      
      return true;
    }
  }

  return false;
}
  File? _videoFile;
  final picker = ImagePicker();

  Future<void> pickGallaryVideo() async {
    _videoFile=File("");
    final pickedFile = await picker.getVideo(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {

        _videoFile = File(pickedFile.path);
            videoName=_videoFile!.path;
      });
    }
  }
  Future<void> pickCameraVideo() async {
    _videoFile=File("");
    final pickedFile = await ImagePicker().pickVideo(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
       
        _videoFile = File(pickedFile.path);
         videoName=_videoFile!.path;
      });
    }
  }

  Future<void> uploadAndShowDialog() async {
    if (_videoFile == null) {
      return;
    }else{ // Replace with your actual values


    final response = await uploadVideo(_videoFile!, authKey, libraryId, videoName);
    if (response) {
      print(response);
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Upload Successful"),
            content: const Text("Video uploaded successfully."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Upload Failed"),
            content: const Text("Failed to upload video."),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }}

   
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const Text('Upload Video'),
              TextField(
                onChanged: (value) {
                  setState(() {
                    videoName = value;
                  });
                },
                decoration: const InputDecoration(labelText: 'Video Title'),
              ),
              Text('${uploadPercent.toStringAsFixed(2)}%'),
              // ElevatedButton(
              //   onPressed: uploadVideo,
              //   child: const Text('Select Video'),
              // ),
               if (_videoFile != null)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Selected Video: $videoName"),
                ),
              ElevatedButton(
                onPressed: pickGallaryVideo,
                child: const Text("Select From Gallary"),
              ),
              ElevatedButton(
                onPressed: pickCameraVideo,
                child: const Text("Select Video From camera"),
              ),
              ElevatedButton(
                onPressed: uploadAndShowDialog,
                child: const Text("Upload Video"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
