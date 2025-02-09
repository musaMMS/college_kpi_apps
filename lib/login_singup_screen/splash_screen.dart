import 'package:college_kpi_apps/login_singup_screen/login_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05), // Dynamic padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/kurigram.jpeg',
                    width: screenWidth * 0.4, // Responsive image width
                    height: screenWidth * 0.4, // Responsive image height
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                Card(
                  color: Colors.white70,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.02), // Responsive padding
                    child: Text(
                      'Kurigram Polytechnic Institute',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: screenWidth * 0.05, // Responsive font size
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.15), // Adjusted spacing
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02, // Responsive padding
                      horizontal: screenWidth * 0.2, // Responsive width
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: Colors.purple, // Custom button color
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: screenWidth * 0.05, // Responsive text size
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
