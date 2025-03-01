import 'package:aerospace/services/firestore_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:firebase_auth/firebase_auth.dart';
<<<<<<< HEAD
import 'package:get/get.dart';

import '../constants/app_route.dart';
=======
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca

class EnterMobileScreen extends StatefulWidget {
  const EnterMobileScreen({super.key});

  @override
  EnterMobileScreenState createState() => EnterMobileScreenState();
}

class EnterMobileScreenState extends State<EnterMobileScreen> {
  final TextEditingController _phoneController = MaskedTextController(
<<<<<<< HEAD
    mask: '0000000000',
=======
    mask: '00000-00000',
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Function to send OTP
  Future<void> _handleGetOTP() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

<<<<<<< HEAD
      String phoneNumber = "+91${_phoneController.text.replaceAll('-', '')}";
=======
      String phoneNumber = "+91" + _phoneController.text.replaceAll('-', '');
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca

      try {
        await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          timeout: Duration(seconds: 60),
          verificationCompleted: (PhoneAuthCredential credential) async {
<<<<<<< HEAD
            UserCredential userCredential =
                await _auth.signInWithCredential(credential);
            if (userCredential.user != null) {
              bool isAvailable = await FirestoreService.to
                  .checkIfUserAvailable(userCredential.user?.uid ?? '');

              Get.toNamed(AppRoute.HOME_SCREEN);
            }
=======
            await _auth.signInWithCredential(credential);
            _navigateToOTPVerification(phoneNumber);
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
          },
          verificationFailed: (FirebaseAuthException e) {
            setState(() {
              _isLoading = false;
            });
            _showError(e.message ?? "Failed to send OTP.");
          },
          codeSent: (String verificationId, int? resendToken) {
            setState(() {
              _isLoading = false;
            });
<<<<<<< HEAD
            Get.toNamed(
              AppRoute.OTP_VERIFICATION_SCREEN,
              arguments: {
                'verificationId': verificationId,
                'phoneNumber': phoneNumber,
=======

            // Navigate to OTP Verification Screen
            Navigator.pushNamed(
              context,
              '/otp_verification',
              arguments: {
                'phone': phoneNumber,
                'verificationId': verificationId,
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
              },
            );
          },
          codeAutoRetrievalTimeout: (String verificationId) {},
        );
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        _showError("Something went wrong. Please try again.");
      }
    }
  }

  /// Navigate to OTP Verification Screen
  void _navigateToOTPVerification(String phoneNumber) {
    Navigator.pushNamed(
      context,
      '/otp_verification',
      arguments: {'phone': phoneNumber},
    );
  }

  /// Function to validate mobile number
  String? _validatePhoneNumber(String? value) {
    String phone = value!.replaceAll('-', '');
    if (phone.isEmpty) {
      return "Enter your mobile number";
    } else if (phone.length < 10) {
      return "Enter a valid 10-digit number";
    }
    return null;
  }

  /// Show error message
  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // App Logo
            Icon(Icons.phone_android, size: 80, color: Colors.blue),

            SizedBox(height: 20),

            // Title
            Text(
              "Enter Mobile Number",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // Subtitle
            Text(
              "We will send an OTP to verify your mobile number",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            SizedBox(height: 30),

            // Mobile Number Input
            Form(
              key: _formKey,
              child: TextFormField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                maxLength: 11, // 10 digits + hyphen
                validator: _validatePhoneNumber,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.phone, color: Colors.blue),
                  hintText: "Enter your mobile number",
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            // Get OTP Button
            ElevatedButton(
              onPressed: _isLoading ? null : _handleGetOTP,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: Size(double.infinity, 50),
              ),
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Get OTP", style: TextStyle(fontSize: 18)),
            ),

            SizedBox(height: 20),

            // Footer Text
            Text(
              "By continuing, you agree to our Terms & Conditions",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
