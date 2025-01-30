import 'package:flutter/material.dart';

class Drawer extends StatelessWidget {
  const Drawer(ListView listView, {super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
       ListView(
    padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(color: Colors.purple),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    "https://via.placeholder.com/150"), // Replace with your image URL
              ),
              SizedBox(height: 10),
              Text("User Name", style: TextStyle(color: Colors.white, fontSize: 18)),
              Text("user@example.com", style: TextStyle(color: Colors.white70)),
            ],
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Home"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.logout),
          title: Text("Logout"),
          onTap: () {},
        ),
      ],
    ),
    ),
    );
  }
}
