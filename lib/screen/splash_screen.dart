import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:bhumeet_user/screen/home_screen.dart'; // Change this to your actual home screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _opacityAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

    _controller.forward();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(),
        ), // Replace with your main screen
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.blue.shade700, // Background color similar to image
      body: Stack(
        children: [
          Center(
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: RichText(
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  children: [
                    TextSpan(
                      text: "भ", // Hindi Character
                      style: TextStyle(
                        fontFamily: 'Mukta', // Use a Hindi-friendly font
                        fontSize: 50,
                      ),
                    ),
                    TextSpan(text: "Meet"),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 100,
            right: 20,
            child: Lottie.asset(
              'assets/drone_animation.json', // Include an animated drone effect
              width: 100,
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            child: Lottie.asset('assets/drone_animation.json', width: 100),
          ),
        ],
      ),
    );
  }
}
