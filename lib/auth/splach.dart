import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:vahaninspect/auth/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> _mockCheckForSession() async {
    await Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const LoginForm();
      }));
    });
    return true;
  }

  @override
  void initState() {
    log('jhbjhbjh');
    super.initState();
    _mockCheckForSession().then((value) {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'images/Splashbg.png'), // Replace with your background image
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Column(
                children: [
                  Image.asset('images/logo.png'),
                  const Text(
                    'Vahan Inspect',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 24, 24, 24),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some spacing between text and copyright
            const Text(
              '© 2023 Vahan Inspect',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 27, 27, 27),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
