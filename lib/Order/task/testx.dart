// ignore_for_file: prefer_const_constructors, avoid_print, prefer_const_literals_to_create_immutables, deprecated_member_use
import 'dart:io';
import 'dart:typed_data';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_watermark/image_watermark.dart';

class Frontimagetest extends StatefulWidget {
  const Frontimagetest({super.key});

  @override
  State<Frontimagetest> createState() => _FrontimageState();
}

class _FrontimageState extends State<Frontimagetest> {
  final picker = ImagePicker();
  //final pickedfile = '';
  String selectedImage = '';
  Uint8List? watermarkedImgBytes;
  // getImage(ImageSource sourse) async {
  //   final image = await picker.pickImage(source: sourse);

  //   if (image != null) {
  //     setState(() {
  //       selectedImage = image.path;
  //       // You can add your image processing logic here if needed
  //     });
  //   }
  // }

  Future<void> getImage(ImageSource source) async {
    try {
      final image = await picker.pickImage(source: source);

      if (image != null) {
        var cropImage = await ImageCropper().cropImage(
          sourcePath: image.path,
          aspectRatio: CropAspectRatio(ratioX: 2, ratioY: 1),
          compressQuality: 100,
          maxWidth: 800,
          maxHeight: 450,
          compressFormat: ImageCompressFormat.png,
        );

        if (cropImage != null) {
          setState(() {
            selectedImage = cropImage.path;
            generateWatermarkedImage();
            // Pass the context here.
            // sendImage(File(selectedImage)).then((value) {
            //   print(value);
            // });
          });
        }
      }
    } catch (e) {
      print('Error: $e');
      // Handle any errors here, e.g., show a user-friendly error message.
    }
  }

  void generateWatermarkedImage() async {
    if (selectedImage != '') {
      final File imageFile = File(selectedImage);
      final Uint8List imgBytes = await imageFile.readAsBytes();

      // Create a Uint8List from the loaded bytes

      final watermarkedBytes = await ImageWatermark.addTextWatermark(
        imgBytes: imgBytes,
        watermarkText: 'Vahan Inspect\nDate: 21 Oct 23\nLoc: Pune',
        dstX: 20,
        dstY: 30,
        color: Colors.white,
      );

      setState(() {
        watermarkedImgBytes = watermarkedBytes;
      });

      print('Watermarked image generated');
    }
  }

  getImageWidget(context) {
    {
      if (watermarkedImgBytes != null) {
        return Column(
          children: [
            Text('Front Image',),
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.memory(
                watermarkedImgBytes!,
                fit: BoxFit.fill,
              ),
            ),
          ],
        );
      } else {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              AwesomeDialog(
                context: context,
                animType: AnimType.SCALE,
                dialogType: DialogType.NO_HEADER,
                body: Center(
                  child: Column(
                    children: [
                      CupertinoButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.file_download, size: 20),
                              SizedBox(
                                width: 15,
                              ),
                              Text('File')
                            ],
                          ),
                          onPressed: () {
                            getImage(ImageSource.gallery);
                          }),
                      CupertinoButton(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.camera,
                                size: 20,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Camra')
                            ],
                          ),
                          onPressed: () {
                            getImage(ImageSource.camera);
                          })
                    ],
                  ),
                ),
                title: 'Select option',
              ).show();
            },
            child: SizedBox(
                height: 140.0,
                // width: double.infinity,
                //color: Colors.black26,
                child: const Text(
                    'Front Image') //Image.asset('images/pf.png',fit: BoxFit.cover,),
                ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        getImageWidget(context),
      ],
    );
  }
}
