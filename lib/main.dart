import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:vahaninspect/auth/splach.dart';
import 'package:vahaninspect/test.dart';

void main() {
  runApp(const MyApp());

}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Vahan Inspect',
      theme: ThemeData(
      
        primarySwatch: Colors.red,
      ),
      
      home: const SplashScreen()
    );
  }
}

