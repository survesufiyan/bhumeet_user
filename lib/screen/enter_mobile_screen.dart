import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class EnterMobileScreen extends StatefulWidget {
  @override
  _EnterMobileScreenState createState() => _EnterMobileScreenState();
}

class _EnterMobileScreenState extends State<EnterMobileScreen> {
  final TextEditingController _phoneController = MaskedTextController(
    mask: '00000-00000',
  ); // Auto-format (XXXXX-XXXXX)
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  /// Function to handle "Get OTP" button
  void _handleGetOTP() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        // Navigate to OTP Verification Screen
        Navigator.pushNamed(
          context,
          '/otp_verification',
          arguments: _phoneController.text.replaceAll('-', ''),
        );
      });
    }
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
              child:
                  _isLoading
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
