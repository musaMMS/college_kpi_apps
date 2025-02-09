import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text("About Me"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double padding = (width > 600) ? 20.0 : 16.0;
          double fontSize = (width > 600) ? 22.0 : 20.0; // Adjust font size for larger screens
          double iconSize = (width > 600) ? 40.0 : 30.0; // Adjust icon size for larger screens
          double buttonPadding = (width > 600) ? 25.0 : 15.0; // Adjust button padding for larger screens

          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                children: [
                  // Profile Section
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/musa1.png'), // Replace with actual asset
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Musa Alam Mim",
                    style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "App Developer\nMusa",
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 10),

                  // Social Media Icons with Stack
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        decoration: const BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        left: 0,
                        right: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.instagram, color: Colors.pink, size: iconSize),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue, size: iconSize),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.youtube, color: Colors.red, size: iconSize),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: FaIcon(FontAwesomeIcons.envelope, color: Colors.orange, size: iconSize),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // Contact Information Section
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: padding),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      elevation: 10,
                      child: Padding(
                        padding: EdgeInsets.all(padding),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Gmail", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("musa@gmail.com"),
                            SizedBox(height: 10),
                            Text("Address", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Sundarganj, Gaibandha, Rangpur City"),
                            SizedBox(height: 10),
                            Text("Institute", style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("Kurigram Polytechnic Institute (Diploma)\nMusa"),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Privacy Policy Button
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: buttonPadding),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {},
                      child: const Text("PRIVACY POLICY"),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
