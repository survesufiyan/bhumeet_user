import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPVerificationScreen extends StatelessWidget {
  final String phoneNumber;

  OTPVerificationScreen({required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _otpController = TextEditingController();
    bool _isLoading = false;

    /// Function to handle OTP submission
    void _verifyOTP() {
      if (_otpController.text.length == 6) {
        _isLoading = true;

        Future.delayed(Duration(seconds: 2), () {
          _isLoading = false;

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('OTP Verified Successfully!')));

          // Navigate to Home or Next Screen
          Navigator.pushReplacementNamed(context, '/home');
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please enter a valid 6-digit OTP')),
        );
      }
    }

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // OTP Illustration
            Icon(Icons.lock, size: 80, color: Colors.blue),

            SizedBox(height: 20),

            // Title
            Text(
              "Enter OTP",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            // Subtitle
            Text(
              "We sent a 6-digit OTP to $phoneNumber",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),

            SizedBox(height: 30),

            // OTP Input Field
            PinCodeTextField(
              appContext: context,
              length: 6,
              controller: _otpController,
              keyboardType: TextInputType.number,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(10),
                fieldHeight: 50,
                fieldWidth: 40,
                activeFillColor: Colors.white,
                selectedColor: Colors.blue,
                inactiveColor: Colors.grey.shade300,
              ),
              onChanged: (value) {},
            ),

            SizedBox(height: 20),

            // Verify OTP Button
            ElevatedButton(
              onPressed: _isLoading ? null : _verifyOTP,
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
                      : Text("Verify OTP", style: TextStyle(fontSize: 18)),
            ),

            SizedBox(height: 20),

            // Resend OTP
            TextButton(
              onPressed: () {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Resending OTP...')));
              },
              child: Text(
                "Resend OTP",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
