import 'package:flutter/material.dart';

class SuggestionPage extends StatefulWidget {
  @override
  _SuggestionPageState createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  int _currentIndex = 0;

  final List<SuggestionItem> suggestionItems = [
    SuggestionItem(
      imagePath: "lib/assets/Winter/winter 2.jpeg", // Same image path
      price: "\$99.99",
      review: "4.6/5",
    ),
    SuggestionItem(
      imagePath: "lib/assets/Summer/summer 2.jpeg", // Same image path
      price: "\$79.99",
      review: "4.2/5",
    ),
    SuggestionItem(
      imagePath: "lib/assets/Street/street 2.jpeg", // Same image path
      price: "\$129.99",
      review: "4.8/5",
    ),
    SuggestionItem(
      imagePath: "lib/assets/Formal/formal 1.jpeg", // Same image path
      price: "\$89.99",
      review: "4.4/5",
    ),
    SuggestionItem(
      imagePath: "lib/assets/Formal/formal 2.jpeg", // Same image path
      price: "\$149.99",
      review: "4.9/5",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggestions"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25), // Add space at the top of the screen
            Text(
              "Best for you",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: suggestionItems.length,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = suggestionItems[index];
                  return Image.asset(
                    item.imagePath,
                    // fit: BoxFit.cover,
                  );
                },
              ),
            ),
            SizedBox(height: 25),
            Row(
              children: [
                Text(
                  suggestionItems[_currentIndex].price,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                Text(
                  suggestionItems[_currentIndex].review,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 25),
            Center(
              child: Text(
                "Matches with your previous Purchases",
                style: TextStyle(
                  fontSize: 18, // Adjust font size as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SuggestionItem {
  final String imagePath;
  final String price;
  final String review;

  SuggestionItem({
    required this.imagePath,
    required this.price,
    required this.review,
  });
}
