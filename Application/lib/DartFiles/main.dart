import 'package:flutter/material.dart';
import 'package:smartmirrorapp/DartFiles/register_page.dart';
import 'package:smartmirrorapp/DartFiles/startpage.dart';

import 'CommunityPage.dart';
import 'SuggestionPage.dart';
import 'login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartMirror',
      initialRoute: '/',
      routes: {
        '/': (context) => StartPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ScanPage(),
    SuggestionPage(),
    CommunityPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SmartMirror"),
        backgroundColor: Colors.black12, // Change this to your desired app bar color
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue, // Change this to your desired selected item color
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            label: 'Suggestion',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  bool isScanned = false;

  void _handleScanTap() {
    setState(() {
      isScanned = !isScanned;
    });
  }

  void _continueToSuggestionPage() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => SuggestionPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Background color for ScanPage
      child: Center(
        child: GestureDetector(
          onTap: () {
            if (isScanned) {
              _continueToSuggestionPage();
            } else {
              _handleScanTap();
            }
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: isScanned ? Colors.green : Colors.grey[500],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: isScanned
                    ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 50,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Scan completed",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _continueToSuggestionPage,
                      child: Text("Continue"),
                    ),
                  ],
                )
                    : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 50,
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Welcome, Please Scan the QR on the mirror, and wait for magic",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200], // Background color for ProfilePage
      child: Center(
        child: Text("Profile Page Content"),
      ),
    );
  }
}