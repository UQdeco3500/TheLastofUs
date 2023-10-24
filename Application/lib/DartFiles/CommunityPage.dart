import 'dart:math';
import 'package:flutter/material.dart';
import 'package:smartmirrorapp/DartFiles/SetPreference.dart';

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

class NearYouContent extends StatefulWidget {
  @override
  _NearYouContentState createState() => _NearYouContentState();
}

class _NearYouContentState extends State<NearYouContent> {
  final List<CommunityPhoto> allPhotos = [
    CommunityPhoto("Shannon", "lib/assets/NearYouImages/lady2.jpg", 4.5),
    CommunityPhoto("Anjali", "lib/assets/NearYouImages/lady1.jpg", 4.1),
    CommunityPhoto("Eryn", "lib/assets/NearYouImages/lady3.jpg", 4.8),
    CommunityPhoto("Olivia", "lib/assets/NearYouImages/lady4.jpg", 4.1),
    CommunityPhoto("Sonu", "lib/assets/NearYouImages/lady5.jpg", 3.9),
    CommunityPhoto("Jackson", "lib/assets/NearYouImages/fam1.jpg", 4.6),
    CommunityPhoto("Rohan", "lib/assets/NearYouImages/male1.jpg", 3.8),
    CommunityPhoto("Ibnu", "lib/assets/NearYouImages/male2.jpg", 4.7),
    CommunityPhoto("Jeff", "lib/assets/NearYouImages/male3.jpg", 4.2),
    CommunityPhoto("Ary", "lib/assets/NearYouImages/male4.jpg", 4.3),
    CommunityPhoto("Alex", "lib/assets/NearYouImages/male5.jpg", 3.8),
    CommunityPhoto("Robin", "lib/assets/NearYouImages/male6.jpg", 3.8),
    CommunityPhoto("Michael", "lib/assets/NearYouImages/male7.jpg", 3.8),
  ];

  List<CommunityPhoto> selectedPhotos = [];

  @override
  void initState() {
    super.initState();
    selectedPhotos = selectRandomPhotos(6, allPhotos);
  }

  List<CommunityPhoto> selectRandomPhotos(int count, List<CommunityPhoto> photos) {
    final random = Random();
    final selectedPhotos = <CommunityPhoto>[];
    final availablePhotos = List<CommunityPhoto>.from(photos);

    for (var i = 0; i < count; i++) {
      if (availablePhotos.isEmpty) {
        break; // No more unique photos to select
      }

      final randomIndex = random.nextInt(availablePhotos.length);
      selectedPhotos.add(availablePhotos.removeAt(randomIndex));
    }

    return selectedPhotos;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two photos per row
        childAspectRatio: 0.75, // Adjust as needed
      ),
      itemCount: selectedPhotos.length,
      itemBuilder: (context, index) {
        final photo = selectedPhotos[index];
        return Column(
          children: [
            SizedBox(
              width: 150, // Set a fixed width
              height: 150, // Set a fixed height
              child: Image.asset(
                photo.imageUrl,
                fit: BoxFit.cover, // Use this to fill the space and maintain aspect ratio
              ),
            ),
            SizedBox(height: 8),
            Text(photo.name),
            Text("Rating: ${photo.rating.toStringAsFixed(1)}"),
          ],
        );
      },
    );
  }
}

class CommunityPhoto {
  final String name;
  final String imageUrl;
  final double rating;

  CommunityPhoto(this.name, this.imageUrl, this.rating);
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

  SetPreferencePage setPreferencePage = SetPreferencePage();

  // List<String> preferences = setPreferencePage.getPreferences();

  List<String> currentpreference = [];
  //
  // PreferencesContent() {
  //   for (String preference in preferenceObject.getPreferences()) {
  //     currentpreference.add(preference);
  //     currentpreference.add(preference);
  //   }
  // }

  double generateRandomRating() {
    return (3.0 + (2.0 * (Random().nextDouble()))).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two photos per row
        childAspectRatio: 0.75,
      ),
      itemCount: currentpreference.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
        Image.asset("assets/${currentpreference[index]}/${currentpreference[index].toLowerCase()} ${index}.jpeg"),
        SizedBox(height: 8),
        Text(currentpreference[index]),
        Text("Rating: ${generateRandomRating()}"),
          ],
        );
      },
    );
  }
}
