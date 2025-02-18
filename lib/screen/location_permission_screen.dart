// filepath: /D:/flutter_project/bhumeet_user/lib/screen/location_permission_screen.dart
// filepath: /D:/flutter_project/bhumeet_user/lib/screen/location_permission_screen.dart
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LocationPermissionScreen extends StatefulWidget {
  @override
  _LocationPermissionScreenState createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  Future<void> _requestLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Navigator.pushReplacementNamed(
        context,
        '/next_screen',
      ); // Replace with your next screen route
    } else {
      // Handle permission denied scenario
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location permission is required to proceed.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF242947), Color(0xFF151828)],
          ),
        ),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Allow Location Access',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    'We need access to your location to provide better services and enhance your experience.',
                    style: TextStyle(fontSize: 16.0, color: Colors.black54),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: _requestLocationPermission,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF242947), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 15.0,
                      ),
                    ),
                    child: Text(
                      'Allow',
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
