import 'dart:math';
import 'package:flutter/material.dart';
import 'main.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Community Page',
      initialRoute: '/',
      routes: {
        '/': (context) => ScanPage(),
        '/community': (context) => CommunityPage(),
      },
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
      body: Column(
        children: [
          Container(
            color: Colors.white70, // Background color for the row
            padding: EdgeInsets.only(bottom: 5), // Add some padding at the bottom
            child: Column(
              children: [
                Image.asset(
                  'lib/assets/logoplaceholder.png',
                  height: 60, // Set the height of the logo
                ),
                Text(
                  "Explore the\nCommunity",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1, // Height of the line separator
            color: Colors.black12, // Color of the line separator
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.white70, // Background color for the row
            padding: EdgeInsets.only(bottom: 5), // Add some padding at the bottom
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10), // Add some horizontal padding
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
                ),
              )
                  .toList(),
            ),
          ),
          Divider(
            thickness: 1, // Height of the line separator
            color: Colors.black12, // Color of the line separator
          ),
          Expanded(
            child: _selectedIndex == 0
                ? NearYouContent()
                : _selectedIndex == 1
                ? BrandContent()
                : PreferenceContent(),
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
    CommunityPhoto("Robin", "lib/assets/NearYouImages/male6.jpg", 4.9),
    CommunityPhoto("Michael", "lib/assets/NearYouImages/male7.jpg", 4.2),
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
        childAspectRatio: 1, // Adjust as needed
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



//BrandTab
class BrandContent extends StatefulWidget {
  @override
  _BrandContentState createState() => _BrandContentState();
}

class _BrandContentState extends State<BrandContent> {
  final List<BrandProduct> allProducts = [
    BrandProduct("H&M", "lib/assets/Brands/H&M 0.jpg", 4.4),
    BrandProduct("H&M", "lib/assets/Brands/H&M 1.jpg", 4.7),
    BrandProduct("H&M", "lib/assets/Brands/H&M 2.jpg", 4.8),
    BrandProduct("Gucci", "lib/assets/Brands/Gucci 0.jpg", 4.4),
    BrandProduct("Gucci", "lib/assets/Brands/Gucci 1.jpg", 3.9),
    BrandProduct("Armani Exchange", "lib/assets/Brands/Armani Exchange 0.jpg", 4.1),
    BrandProduct("Armani Exchange", "lib/assets/Brands/Armani Exchange 2.jpg", 4.0),
    BrandProduct("Armani Exchange", "lib/assets/Brands/Armani Exchange 3.jpg", 4.2),
    BrandProduct("Nike", "lib/assets/Brands/Nike 0.jpeg", 4.1),
    BrandProduct("Nike", "lib/assets/Brands/Nike 2.jpg", 4.6),
    BrandProduct("Nike", "lib/assets/Brands/Nike 1.jpeg", 4.3),
    BrandProduct("Uniqlo", "lib/assets/Brands/Uniqlo 0.jpg", 4.1),
    BrandProduct("Uniqlo", "lib/assets/Brands/Uniqlo 1.jpg", 4.7),
    BrandProduct("Uniqlo", "lib/assets/Brands/Uniqlo 2.jpg", 4.0),
    BrandProduct("Zara", "lib/assets/Brands/Zara 1.jpg", 4.8),
    BrandProduct("Zara", "lib/assets/Brands/Zara 2.jpg", 3.4),
    BrandProduct("Zara", "lib/assets/Brands/Zara 3.jpeg", 4.2),
  ];

  List<BrandProduct> selectedProducts = [];

  @override
  void initState() {
    super.initState();
    selectedProducts = selectRandomProducts(6, allProducts);
  }

  List<BrandProduct> selectRandomProducts(int count, List<BrandProduct> products) {
    final random = Random();
    final selectedProducts = <BrandProduct>[];
    final availableProducts = List<BrandProduct>.from(products);

    for (var i = 0; i < count; i++) {
      if (availableProducts.isEmpty) {
        break; // No more unique products to select
      }

      final randomIndex = random.nextInt(availableProducts.length);
      selectedProducts.add(availableProducts.removeAt(randomIndex));
    }

    return selectedProducts;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two products per row
          childAspectRatio: 1, // Adjust as needed
      ),
      itemCount: selectedProducts.length,
      itemBuilder: (context, index) {
        final product = selectedProducts[index];
        return Column(
          children: [
            SizedBox(
              width: 150, // Set a fixed width
              height: 150, // Set a fixed height
              child: Image.asset(
                product.imageUrl,
                fit: BoxFit.cover, // Use this to fill the space and maintain aspect ratio
              ),
            ),
            SizedBox(height: 8),
            Text(product.name),
            Text("Rating: ${product.rating.toStringAsFixed(1)}"),
          ],
        );
      },
    );
  }
}

class BrandProduct {
  final String name;
  final String imageUrl;
  final double rating;

  BrandProduct(this.name, this.imageUrl, this.rating);
}


//Preference Tab
class PreferenceContent extends StatefulWidget {
  @override
  _PreferenceContentState createState() => _PreferenceContentState();
}

class _PreferenceContentState extends State<PreferenceContent> {
  final List<PreferenceItem> allPreferences = [
    PreferenceItem("Sporty", "lib/assets/Sporty/sporty 0.jpg", 4.5),
    PreferenceItem("Sporty", "lib/assets/Sporty/sporty 1.jpg", 4.1),
    PreferenceItem("Bohemian", "lib/assets/Bohemian/bohemian.jpg", 4.2),
    PreferenceItem("Bohemian", "lib/assets/Bohemian/bohemian 1.jpg", 4.0),
    PreferenceItem("Casual", "lib/assets/Casual/casual 1.jpeg", 3.9),
    PreferenceItem("Casual", "lib/assets/Casual/casual 2.jpeg", 4.1),
    PreferenceItem("Formal", "lib/assets/Formal/formal 1.jpeg", 4.7),
    PreferenceItem("Formal", "lib/assets/Formal/formal 2.jpeg", 4.5),
    PreferenceItem("Retro", "lib/assets/Retro/retro 0.jpg", 4.2),
    PreferenceItem("Retro", "lib/assets/Retro/retro 1.jpg", 4.9),
    PreferenceItem("Street", "lib/assets/Street/street 1.jpeg", 4.4),
    PreferenceItem("Street", "lib/assets/Street/street 2.jpeg", 3.9),
    PreferenceItem("Classic", "lib/assets/Classic/classic 0.jpg", 3.6),
    PreferenceItem("Classic", "lib/assets/Classic/classic 1.jpg", 4.6),
    PreferenceItem("Vintage", "lib/assets/Vintage/vintage 0.jpg", 4.3),
    PreferenceItem("Vintage", "lib/assets/Vintage/vintage 0.jpg", 4.0),
    PreferenceItem("Summer", "lib/assets/Summer/summer 1.jpeg", 4.5),
    PreferenceItem("Summer", "lib/assets/Summer/summer 2.jpeg", 4.7),
    PreferenceItem("Winter", "lib/assets/Winter/winter 1.jpeg", 4.4),
    PreferenceItem("Winter", "lib/assets/Winter/winter 1.jpeg", 4.3),
  ];

  List<PreferenceItem> selectedPreferences = [];

  @override
  void initState() {
    super.initState();
    selectedPreferences = selectRandomPreferences(6, allPreferences);
  }

  List<PreferenceItem> selectRandomPreferences(int count, List<PreferenceItem> preferences) {
    final random = Random();
    final selectedPreferences = <PreferenceItem>[];
    final availablePreferences = List<PreferenceItem>.from(preferences);

    for (var i = 0; i < count; i++) {
      if (availablePreferences.isEmpty) {
        break; // No more unique preferences to select
      }

      final randomIndex = random.nextInt(availablePreferences.length);
      selectedPreferences.add(availablePreferences.removeAt(randomIndex));
    }

    return selectedPreferences;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Two preferences per row
        childAspectRatio: 1, // Adjust as needed
      ),
      itemCount: selectedPreferences.length,
      itemBuilder: (context, index) {
        final preference = selectedPreferences[index];
        return Column(
          children: [
            SizedBox(
              width: 150, // Set a fixed width
              height: 150, // Set a fixed height
              child: Image.asset(
                preference.imageUrl,
                fit: BoxFit.cover, // Use this to fill the space and maintain aspect ratio
              ),
            ),
            SizedBox(height: 8),
            Text(preference.name),
            Text("Rating: ${preference.rating.toStringAsFixed(1)}"),
          ],
        );
      },
    );
  }
}

class PreferenceItem {
  final String name;
  final String imageUrl;
  final double rating;

  PreferenceItem(this.name, this.imageUrl, this.rating);
}
