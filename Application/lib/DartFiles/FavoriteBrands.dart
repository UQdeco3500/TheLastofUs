import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteBrands extends StatefulWidget {
  @override
  _FavoriteBrandsState createState() => _FavoriteBrandsState();

  List<String> brands = [
    "H&M",
    "Uniqlo",
    "Nike",
    "Gucci",
    "Zara",
    "Armani Exchange",
  ];
  int maxBrands = 3; // Maximum number of favorite brands allowed
  int minBrands = 2;

  List<String> favoriteBrandsList() {
    return (_FavoriteBrandsState().getFavoriteBrands());
  }
}

class _FavoriteBrandsState extends State<FavoriteBrands> {
  List<bool> selected = [];

  @override
  void initState() {
    super.initState();
    selected = List.generate(widget.brands.length, (index) => false);
    loadFavoriteBrands();
  }

  void loadFavoriteBrands() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<bool> loadedSelected = [];
    for (int i = 0; i < widget.brands.length; i++) {
      loadedSelected.add(prefs.getBool('brand_$i') ?? false);
    }
    setState(() {
      selected = loadedSelected;
    });
  }

  void saveFavoriteBrands() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < widget.brands.length; i++) {
      prefs.setBool('brand_$i', selected[i]);
    }
  }

  List<String> getFavoriteBrands() {
    List<String> currentFavoriteBrands = [];
    for (int i = 0; i < widget.brands.length; i++) {
      if (selected[i]) {
        currentFavoriteBrands.add(widget.brands[i]);
      }
    }
    return currentFavoriteBrands;
  }

  void toggleFavoriteBrand(int index) {
    setState(() {
      if (selected[index]) {
        if (selected.where((isSelected) => isSelected).length > widget.minBrands) {
          selected[index] = false;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Minimum favorite brands reached: ${widget.minBrands}')),
          );
        }
      } else {
        if (selected.where((isSelected) => isSelected).length < widget.maxBrands) {
          selected[index] = true;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Maximum favorite brands reached: ${widget.maxBrands}')),
          );
        }
      }
      saveFavoriteBrands(); // Call this after updating selected favorite brands
      getFavoriteBrands();
    });
  }

  @override
  Widget build(BuildContext context) {
    if (selected == null) {
      // Handle the case where favorite brands are not loaded yet
      return CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite Brands"),
      ),
      body: Center(
        child: Column(
          children: [
          Image.asset(
          'lib/assets/logoplaceholder.png',
          height: 60, // Set the height of the logo
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: widget.brands.asMap().entries.map((entry) {
            int index = entry.key;
            String brand = entry.value;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0), // Add space between brands
              child: FavoriteBrandButton(
                text: brand,
                selected: selected[index],
                onTap: () {
                  toggleFavoriteBrand(index);
                },
              ),
            );
          }).toList(),
        ),
      ],
    ),
    ),
    );
  }
}

class FavoriteBrandButton extends StatelessWidget {
  final String text;
  final bool selected;
  final Function onTap;

  FavoriteBrandButton({
  required this.text,
  required this.selected,
  required this.onTap,
});

@override
Widget build(BuildContext context) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      primary: selected ? Colors.green : Colors.grey,
      minimumSize: Size(120, 50), // Adjust the size as needed
      padding: EdgeInsets.all(16),
    ),
    onPressed: () {
      onTap();
    },
    child: Text(text),
  );
}
}
