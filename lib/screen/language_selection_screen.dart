import 'package:flutter/material.dart';

class LanguageSelectionScreen extends StatefulWidget {
  @override
  _LanguageSelectionScreenState createState() =>
      _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  // List of languages
  final List<String> languages = [
    "English",
    "Gujarat",
    "Hindi",
    "Kannada",
    "Marathi",
    "Punjabi",
    "Tamil",
    "Telugu",
  ];

  // Default selected language
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900, // Background color
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Select Language",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              // List of language radio buttons
              Column(
                children: languages.map((language) {
                  return RadioListTile(
                    title: Text(language, style: TextStyle(fontSize: 16)),
                    value: language,
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value.toString();
                      });
                    },
                    activeColor: Colors.blue,
                  );
                }).toList(),
              ),
              SizedBox(height: 15),
              // Next Button
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/location_permission');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minimumSize: Size(double.infinity, 45), // Button size
                ),
                child: Text(
                  "Next",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
