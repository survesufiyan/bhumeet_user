import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPermissionScreen extends StatefulWidget {
  @override
  _LocationPermissionScreenState createState() =>
      _LocationPermissionScreenState();
}

class _LocationPermissionScreenState extends State<LocationPermissionScreen> {
  GoogleMapController? _mapController;
  LatLng? _currentLocation;

  /// Function to request location and navigate
  Future<void> _requestLocation(bool precise) async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: precise ? LocationAccuracy.high : LocationAccuracy.low,
      );

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
      });
    } else {
      _showMessage("Location permission is required ❌", Colors.red);
    }
  }

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF0A1F44), Color(0xFF0A0F24)],
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
                  ),
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () => _requestLocation(true),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.blue.withOpacity(0.1),
                              child: Icon(
                                Icons.gps_fixed,
                                size: 40,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Precise',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _requestLocation(false),
                        child: Column(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              backgroundColor: Colors.orange.withOpacity(0.1),
                              child: Icon(
                                Icons.map,
                                size: 40,
                                color: Colors.orange,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Approximate',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
            ),
          ),
        ),
      ),
    );
  }
}
