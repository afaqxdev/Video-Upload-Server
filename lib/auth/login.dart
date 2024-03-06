// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vahaninspect/home.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(25),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'images/loginbg.png'), // Replace with your background image
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Image.asset(
                  'images/logo.png', // Replace with your logo image
                  height: 100,
                ),
                Text(
                  'Vahan Inspect',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 24, 24, 24),
                  ),
                ),
                Row(
                  children: const [
                    Text(
                      'Valuer\nSignIn',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 3, 161, 175),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'User ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                CupertinoButton(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 201, 6, 6),
                    child: Text('SignIn'),
                    onPressed: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) {
                        return Home();
                      }));
                    }),
                const SizedBox(height: 20),
                SizedBox(
                  height: 55,
                ),
                Text(
                  'Have login issue? Please connect with our team.',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 24, 24, 24),
                  ),
                ),
                CupertinoButton(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(255, 3, 161, 175),
                    child: Text('Need Help?'),
                    onPressed: () {}),
                const SizedBox(height: 20),
                Text(
                  '© 2023 Vahan Inspect',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 27, 27, 27),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
