import 'dart:math';
import 'package:flutter/material.dart';

class SuggestionPage extends StatefulWidget {
  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  int _currentIndex = 0;

  List<SuggestionItem> suggestionItems = [
    SuggestionItem(49.9, "lib/assets/Brands/H&M 0.jpg", 4.2),
    SuggestionItem(59.9, "lib/assets/Brands/H&M 1.jpg", 4.8),
    SuggestionItem(39.9, "lib/assets/Brands/H&M 2.jpg", 3.5),
    SuggestionItem(79.9, "lib/assets/Brands/H&M 3.jpg", 4.0),
    SuggestionItem(69.9, "lib/assets/Brands/H&M 4.jpg", 4.6),
    SuggestionItem(44.9, "lib/assets/Brands/H&M 5.jpg", 3.9),
    SuggestionItem(54.9, "lib/assets/Brands/H&M 6.jpg", 4.4),
    SuggestionItem(64.9, "lib/assets/Brands/H&M 7.jpg", 4.1),
  ];

  List<SuggestionItem> selectedItems = [];

  @override
  void initState() {
    super.initState();
    suggestionItems.shuffle(); // Shuffle the list of items
    selectedItems = suggestionItems.sublist(0, min(5, suggestionItems.length)); // Take the first 5 shuffled items or less
  }

  void navigate(int index) {
    setState(() {
      if (_currentIndex + index >= 0 && _currentIndex + index < selectedItems.length) {
        _currentIndex += index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.transparent,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 15), // Add some space between the texts
          Image.asset(
            "lib/assets/logoplaceholder.png",
            height: 50, // Adjust the logo height as needed
          ),
          SizedBox(height: 10), // Add some space between the texts
          Container(
            color: Colors.white, // White background
            child: Column(
              children: [
                Text(
                  "Suggestions for you",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(height: 10), // Add some space between the texts
                Text(
                  "Explore the Virtual H&M Store\nBased on Your Scan!",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF2D323A), // Dark blueish color
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0), // Curved edges
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          SizedBox(
                            height: 200,
                            child: PageView.builder(
                              itemCount: selectedItems.length,
                              onPageChanged: (index) {
                                setState(() {
                                  _currentIndex = index;
                                });
                              },
                              itemBuilder: (context, index) {
                                final item = selectedItems[_currentIndex]; // Changed here
                                return Image.asset(
                                  item.imageUrl,
                                  // fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          Positioned(
                            left: 0,
                            child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              onPressed: () {
                                navigate(-1);
                              },
                            ),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward),
                              onPressed: () {
                                navigate(1);
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Text(
                            "${selectedItems[_currentIndex].rate}",
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Spacer(),
                          Text(
                            "${selectedItems[_currentIndex].rating}",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center-align the "Matches" lines
                        children: [
                          Text(
                            "Matches with your previous purchase",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white, // Make it black
                            ),
                          ),
                          SizedBox(width: 20), // Add space between the lines
                          Icon(
                            Icons.check_circle,
                            color: Colors.green, // Green tick icon
                          ),
                        ],
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center, // Center-align the "Matches" lines
                        children: [
                          Text(
                            "Matches with your Preferences",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white, // Make it black
                            ),
                          ),
                          SizedBox(width: 20), // Add space between the lines
                          Icon(
                            Icons.check_circle,
                            color: Colors.green, // Green tick icon
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SuggestionItem {
  final double rate;
  final String imageUrl;
  final double rating;

  SuggestionItem(this.rate, this.imageUrl, this.rating);
}
