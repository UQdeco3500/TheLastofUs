import 'package:flutter/material.dart';
import 'SetPreference.dart';
import 'FavoriteBrands.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double _percentage = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
        Column(
        children: [
        Image.asset(
          'lib/assets/logoplaceholder.png',
          height: 60, // Set the height of the logo
        ),
            SizedBox(height: 10),
            // Profile Picture and Name
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("lib/assets/profile_pic.jpeg",
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Your Name", // Replace with your name
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // Favorite Brands
            ProfileOption(
              title: "Favorite Brands",
              onTap: () {
                // Navigate to the favorite brands selection page
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => FavoriteBrands()),
                );
              },
            ),
            // Set Preferences
            ProfileOption(
              title: "Set Preferences",
              onTap: () {
                // Navigate to the set preferences page
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SetPreferencePage()),
                );
              },
            ),
            // AI Adjustment Button
            Container(
              margin: EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () {
                  // Show the AI adjustment slider
                  // You can implement this part according to your requirements
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                ),
                child: Text(
                  "AI Adjustment",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            // AI Adjustment Slider
            Slider(
              value: _percentage,
              onChanged: (value) {
                setState(() {
                  _percentage = value;
                });
              },
              min: 0,
              max: 100,
              divisions: 100,
              label: _percentage.round().toString(),
            ),
            // Past Purchases
            PastPurchases(),
          ],
        ),
      ],
      ),
    ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final String title;
  final Function onTap;

  ProfileOption({
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(16),
      child: ElevatedButton(
        onPressed: () {
          onTap();
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.black,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class PastPurchases extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            "Past Purchases",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        // Implement past purchases here
        PastPurchaseItem(
          image: "lib/assets/Past Purchases/paststreet 2.jpeg",
          itemName: "Uniqlo Shirt",
        ),
        PastPurchaseItem(
          image: "lib/assets/Past Purchases/pastcasual.jpeg",
          itemName: "H&M Casual",
        ),
        PastPurchaseItem(
          image: "lib/assets/Past Purchases/paststreet.jpeg",
          itemName: "Streetwear",
        ),
      ],
    );
  }
}

class PastPurchaseItem extends StatelessWidget {
  final String image;
  final String itemName;

  PastPurchaseItem({
    required this.image,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        image,
        width: 120,
        height: 120,
      ),
      title: Text(itemName), // Replace with the item name
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Implement the rating here
          RatingDialogButton(),
        ],
      ),
    );
  }
}

class RatingDialogButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Show a dialog box for rating out of 5 stars
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Rate This Item"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Select your rating:"),
                  // Implement a rating selection widget here
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    // Process the rating and review
                    Navigator.of(context).pop();
                  },
                  child: Text("Submit"),
                ),
              ],
            );
          },
        );
      },
      child: Text("Rate & Review"),
    );
  }
}
