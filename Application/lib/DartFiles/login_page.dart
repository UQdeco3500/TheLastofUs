import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {

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
                // controller: emailController,
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
                // controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
            ),

            ElevatedButton(
          onPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
                },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
