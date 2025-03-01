import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

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

      // Navigate to your desired screen after permission is granted
      Future.delayed(Duration(seconds: 1), () {
        Get.offNamed('/enter_mobile'); // Update this with your route name
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

      // Open app settings for the user to manually enable permission
      openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
