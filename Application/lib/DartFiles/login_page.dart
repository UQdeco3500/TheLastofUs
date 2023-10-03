import 'dart:io';
import 'package:flutter/material.dart';
import 'main.dart';

class LoginPage extends StatelessWidget {

  var result = null;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String authenticationResult = '';

  void authenticateUser() async {

    String pythonScript = 'PythonScripts/Loginscript.py';
    List<String> arguments = [
      pythonScript,
      emailController.text,
      passwordController.text,
    ];

    result = await Process.run('python', arguments);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Login To the Future',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 20),

            // Email TextField
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            // Password TextField
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            ElevatedButton(
              onPressed: () {
                authenticateUser();
                if (result.exitCode == 0) {
                Navigator.push(context, MaterialPageRoute(
                builder: (context) => HomePage(),
                ));
                }
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
