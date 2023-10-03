import 'package:flutter/material.dart';
import 'login_page.dart';
import 'register_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Smart Mirror'), // Replace with your app's name
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo Image (Replace 'logo.png' with your image asset)
            Image.asset(
              '../assets/logo.jpeg',
              width: 100, // Adjust width as needed
              height: 100, // Adjust height as needed
            ),
            SizedBox(height: 16), // Add some space between logo and app name
            Text(
              'SmartMirror',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32), // Add some space between app name and buttons

            // Login Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => LoginPage(),
                ));
              },
              child: Text('Login'),
            ),

            SizedBox(height: 16), // Add some space between login and register buttons

            // Register Button
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => RegisterPage(),
                ));
              },
              child: Text('Register'),
            ),

            SizedBox(height: 32), // Add some space between buttons and slogan
            Text(
              'Shop faster and better, Coz u deserve the best',
              style: TextStyle(
                fontSize: 16.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
