import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';
=======
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca

class LocationPermissionScreen extends StatefulWidget {
  @override
  _LocationPermissionScreenState createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  // Function to request location permission
  Future<void> _requestLocationPermission() async {
    // Request location permission
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      // If granted, navigate to the next screen
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Location permission granted ✅")),
      );

<<<<<<< HEAD
      // Navigate to your desired screen after permission is granted
      Future.delayed(Duration(seconds: 1), () {
        Get.offNamed('/enter_mobile'); // Update this with your route name
=======
      setState(() {
        _currentLocation = LatLng(position.latitude, position.longitude);
      });

      if (_mapController != null) {
        _mapController!.animateCamera(
          CameraUpdate.newLatLng(_currentLocation!),
        );
      }

      // Show success message
      _showMessage("Location permission granted ✅", Colors.green);

      // Navigate to Enter Mobile Screen
      Future.delayed(Duration(seconds: 1), () {
        Get.offNamed('/enter_mobile');
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
      });
    } else if (status.isDenied) {
      // If denied, show a message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Location permission denied ❌")),
      );
    } else if (status.isPermanentlyDenied) {
      // If permanently denied, open app settings
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Location permission permanently denied ❌")),
      );

<<<<<<< HEAD
      // Open app settings for the user to manually enable permission
      openAppSettings();
    }
=======
  /// Show message as SnackBar
  void _showMessage(String message, Color color) {
    Get.snackbar(
      '',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      colorText: Colors.white,
      duration: Duration(seconds: 2),
    );
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
<<<<<<< HEAD
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.location_on, size: 50, color: Colors.blue),
                SizedBox(height: 10),
                Text(
                  'Allow AeroSpace User to access your location?',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _requestLocationPermission,
                  child: Text(
                    'Allow Location Access',
                    style: TextStyle(fontSize: 16.0),
=======
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
                  Icon(Icons.location_on, size: 50, color: Colors.blue),
                  SizedBox(height: 10),
                  Text(
                    'Allow Bhumeet User to access your location?',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Handle case when user doesn't allow permission
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Location access denied ❌")),
                    );
                    Future.delayed(Duration(seconds: 1), () {
                      Get.offNamed('/enter_mobile');
                    });
                  },
                  child: Text(
                    'DON\'T ALLOW',
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
<<<<<<< HEAD
                ),
              ],
=======
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => _requestLocation(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 40.0,
                        vertical: 15.0,
                      ),
                    ),
                    child: Text(
                      'WHILE USING THE APP',
                      style: TextStyle(fontSize: 16.0, color: Colors.white),
                    ),
                  ),
                  TextButton(
                    onPressed: () => _requestLocation(false),
                    child: Text(
                      'ONLY THIS TIME',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _showMessage("Location access denied ❌", Colors.red);
                      Future.delayed(Duration(seconds: 1), () {
                        Get.offNamed('/enter_mobile');
                      });
                    },
                    child: Text(
                      'DON\'T ALLOW',
                      style: TextStyle(fontSize: 16, color: Colors.red),
                    ),
                  ),
                ],
              ),
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
            ),
          ),
        ),
      ),
    );
  }
}
