import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OTPVerificationScreen extends StatefulWidget {
<<<<<<< HEAD
  // final String phoneNumber;
  // final String verificationId;

  OTPVerificationScreen(
      // required this.phoneNumber,
      // required this.verificationId,
      );

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  /// Function to verify OTP
  Future<void> _verifyOTP() async {
    Map<String, dynamic>? arguments = Get.arguments;
    String verificationId = arguments?['verificationId'] ?? '';

    String otp = _otpController.text.trim();
    if (otp.length == 6) {
      setState(() {
        _isLoading = true;
      });

      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: otp,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Navigate to Home Screen on Success
        Navigator.pushReplacementNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        setState(() {
          _isLoading = false;
        });

        _showError(e.message ?? "Invalid OTP. Please try again.");
      }
    } else {
      _showError("Please enter a valid 6-digit OTP.");
    }
  }

  /// Function to show error messages
  // void _showError(String message) {
  //   ScaffoldMessenger.of(
  //     context,
  //   ).showSnackBar(SnackBar(content: Text(message)));
  // }

  /// Function to resend OTP
  // Future<void> _resendOTP() async {
  //   setState(() {
  //     _isLoading = true;
  //   });

  //   try {
  //     await _auth.verifyPhoneNumber(
  //       phoneNumber: widget.phoneNumber,
  //       timeout: Duration(seconds: 60),
  //       verificationCompleted: (PhoneAuthCredential credential) async {
  //         await _auth.signInWithCredential(credential);
  //         Navigator.pushReplacementNamed(context, '/home');
  //       },
  //       verificationFailed: (FirebaseAuthException e) {
  //         _showError(e.message ?? "Failed to resend OTP.");
  //         setState(() {
  //           _isLoading = false;
  //         });
  //       },
  //       codeSent: (String verificationId, int? resendToken) {
  //         setState(() {
  //           _isLoading = false;
  //         });

  //         ScaffoldMessenger.of(
  //           context,
  //         ).showSnackBar(SnackBar(content: Text('OTP Resent Successfully!')));
  //       },
  //       codeAutoRetrievalTimeout: (String verificationId) {},
  //     );
  //   } catch (e) {
  //     _showError("Something went wrong. Please try again.");
  //     setState(() {
  //       _isLoading = false;
  //     });
  //   }
  // }

  /// Show error message
  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
=======
  final String phoneNumber;
  final String verificationId;

  OTPVerificationScreen({
    required this.phoneNumber,
    required this.verificationId,
  });

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController _otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  /// Function to verify OTP
  Future<void> _verifyOTP() async {
    String otp = _otpController.text.trim();
    if (otp.length == 6) {
      setState(() {
        _isLoading = true;
      });

      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId,
          smsCode: otp,
        );

        await _auth.signInWithCredential(credential);

        // Navigate to Home Screen on Success
        Navigator.pushReplacementNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        setState(() {
          _isLoading = false;
        });

        _showError(e.message ?? "Invalid OTP. Please try again.");
      }
    } else {
      _showError("Please enter a valid 6-digit OTP.");
    }
  }

  /// Function to show error messages
  void _showError(String message) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
  }

  /// Function to resend OTP
  Future<void> _resendOTP() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: widget.phoneNumber,
        timeout: Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await _auth.signInWithCredential(credential);
          Navigator.pushReplacementNamed(context, '/home');
        },
        verificationFailed: (FirebaseAuthException e) {
          _showError(e.message ?? "Failed to resend OTP.");
          setState(() {
            _isLoading = false;
          });
        },
        codeSent: (String verificationId, int? resendToken) {
          setState(() {
            _isLoading = false;
          });

          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('OTP Resent Successfully!')));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      _showError("Something went wrong. Please try again.");
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
  Widget build(BuildContext context) {
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
<<<<<<< HEAD
            // Text(
            //   "We sent a 6-digit OTP to ${widget.phoneNumber}",
            //   textAlign: TextAlign.center,
            //   style: TextStyle(fontSize: 16, color: Colors.grey),
            // ),
=======
            Text(
              "We sent a 6-digit OTP to ${widget.phoneNumber}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca

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
              child: _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : Text("Verify OTP", style: TextStyle(fontSize: 18)),
            ),

            SizedBox(height: 20),

            // Resend OTP
<<<<<<< HEAD
            // TextButton(
            //   onPressed: _isLoading ? null : _resendOTP,
            //   child: Text(
            //     "Resend OTP",
            //     style: TextStyle(fontSize: 16, color: Colors.blue),
            //   ),
            // ),
=======
            TextButton(
              onPressed: _isLoading ? null : _resendOTP,
              child: Text(
                "Resend OTP",
                style: TextStyle(fontSize: 16, color: Colors.blue),
              ),
            ),
>>>>>>> bc7550df0837af88ac84a7a3cffc244c739ea4ca
          ],
        ),
      ),
    );
  }
}
