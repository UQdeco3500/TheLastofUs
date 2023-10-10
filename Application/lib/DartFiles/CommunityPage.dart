import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Community Page',
      home: CommunityPage(),
    );
  }
}

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int _selectedIndex = 0;

  final List<String> _categories = ["Near You", "Brands", "Preferences"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Explore The Community"),
        backgroundColor: Colors.black12, // Customize as needed
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: _categories
                  .asMap()
                  .entries
                  .map(
                    (entry) => GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = entry.key;
                    });
                  },
                  child: Text(
                    entry.value,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: _selectedIndex == entry.key
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: _selectedIndex == entry.key
                          ? Colors.blue
                          : Colors.black,
                    ),
                  ),
                ),
              )
                  .toList(),
            ),
          ),
          Expanded(
            child: _selectedIndex == 0
                ? NearYouContent()
                : _selectedIndex == 1
                ? BrandsContent()
                : PreferencesContent(),
          ),
        ],
      ),
    );
  }
}

class NearYouContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two photos per row
        childAspectRatio: 0.75, // Adjust as needed
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset("lib/assets/logoplaceholder.png"), // Replace with your image URL
            SizedBox(height: 8),
            Text("User $index"),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_half, color: Colors.yellow),
              ],
            ),
          ],
        );
      },
    );
  }
}

class BrandsContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two photos per row
        childAspectRatio: 0.75, // Adjust as needed
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset("lib/assets/logoplaceholder.png"), // Replace with your image URL
            SizedBox(height: 8),
            Text("Brand $index"),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_half, color: Colors.yellow),
              ],
            ),
          ],
        );
      },
    );
  }
}

class PreferencesContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two photos per row
        childAspectRatio: 0.75,
      ),
      itemCount: 6,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Image.asset("lib/assets/logoplaceholder.png"),
            SizedBox(height: 8),
            Text("Casual"),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star_half, color: Colors.yellow),
              ],
            ),
          ],
        );
      },
    );
  }
}
