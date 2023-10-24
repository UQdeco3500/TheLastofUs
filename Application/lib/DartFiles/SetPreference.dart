import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SetPreferencePage extends StatefulWidget {
  @override
  _SetPreferencePageState createState() => _SetPreferencePageState();

  List<String> preferences = [
    "Casual",
    "Formal",
    "Street",
    "Summer",
    "Sporty",
    "Bohemian",
    "Vintage",
    "Classic",
    "Elegant",
    "Retro"
  ];
  int maxPreferences = 4; // Maximum number of preferences allowed
  int minPreferences = 2;


}

class _SetPreferencePageState extends State<SetPreferencePage> {
  List<bool> selected = [];

  @override
  void initState() {
    super.initState();
    selected = List.generate(widget.preferences.length, (index) => false);
    loadPreferences();
    }

  void loadPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<bool> loadedSelected = [];
    for (int i = 0; i < widget.preferences.length; i++) {
      loadedSelected.add(prefs.getBool('preference_$i') ?? false);
    }
    setState(() {
      selected = loadedSelected;
    });
  }

  void savePreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (int i = 0; i < widget.preferences.length; i++) {
      prefs.setBool('preference_$i', selected[i]);
    }
  }

  List<String> getPreferences() {
    List<String> currentPreferences = [];
    for (int i = 0; i < widget.preferences.length; i++) {
      if (selected[i]) {
        currentPreferences.add(widget.preferences[i]);
      }
    }
    return currentPreferences;
  }

  void togglePreference(int index) {
    setState(() {
      if (selected[index]) {
        if (selected.where((isSelected) => isSelected).length > widget.minPreferences) {
          selected[index] = false;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Minimum preferences reached: ${widget.minPreferences}')),
          );
        }
      } else {
        if (selected.where((isSelected) => isSelected).length < widget.maxPreferences) {
          selected[index] = true;
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Maximum preferences reached: ${widget.maxPreferences}')),
          );
        }
      }
      savePreferences(); // Call this after updating selected preferences
    });
  }

  @override
  Widget build(BuildContext context) {
    if (selected == null) {
      // Handle the case where preferences are not loaded yet
      return CircularProgressIndicator();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Set Preferences"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Column(
                    children: widget.preferences.sublist(0, 5).asMap().entries.map((entry) {
                      int index = entry.key;
                      String preference = entry.value;
                      return PreferenceButton(
                        text: preference,
                        selected: selected[index],
                        onTap: () {
                          togglePreference(index);
                        },
                      );
                    }).toList(),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: widget.preferences.sublist(5).asMap().entries.map((entry) {
                      int index = entry.key + 5;
                      String preference = entry.value;
                      return PreferenceButton(
                        text: preference,
                        selected: selected[index],
                        onTap: () {
                          togglePreference(index);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PreferenceButton extends StatelessWidget {
  final String text;
  final bool selected;
  final Function onTap;

  PreferenceButton({
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
