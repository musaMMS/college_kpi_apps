// import 'package:flutter/material.dart';
//
//
// class NewsFeedScreen extends StatelessWidget {
//   final String facebookPageUrl = "https://www.facebook.com/share/18p72qDskb/"; // Replace with your Facebook page URL
//
//   Future<void> _launchURL() async {
//     if (await canLaunch(facebookPageUrl)) {
//       await launch(facebookPageUrl);
//     } else {
//       throw 'Could not launch $facebookPageUrl';
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Facebook Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Welcome to My Facebook Page!',
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _launchURL,
//               child: Text('Visit My Facebook Page'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }