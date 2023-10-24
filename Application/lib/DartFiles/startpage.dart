import 'package:flutter/material.dart';
import 'login_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aura'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'lib/assets/logoplaceholder.png',
              width: 200,
              height: 200,
            ),
            SizedBox(height: 12),
            Text(
              'Aura',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
        SizedBox(height: 40),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent,
          ),
          child: IconButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => LoginPage(),
              ));
            },
            icon: Icon(
              Icons.arrow_forward,
              size: 32,
              color: Colors.white,
            ),
              color: Colors.white,
              iconSize: 40,
              padding: EdgeInsets.all(16),
              splashRadius: 32,
              splashColor: Colors.blueAccent,
              highlightColor: Colors.blueAccent,
            ),
        ),
          ],
        ),
      ),
    );
  }
}
