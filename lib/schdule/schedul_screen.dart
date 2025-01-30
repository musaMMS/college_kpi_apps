import 'package:flutter/material.dart';

class SchedulScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Diplomaian'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16.0),
          children: [
            ListItem(
              date: '5-12-2022',
              title: '8th Sem Irr 2016 Regulation',
            ),
            ListItem(
              date: '5-12-2022',
              title: '8th Sem Irr 2010 Regulation',
            ),
            ListItem(
              date: '5-12-2022',
              title: '7th Sem Tour 2016 Regulation',
            ),
            ListItem(
              date: '5-12-2022',
              title: '7th Sem 2016 Regulation',
            ),
          ],
        ),
      );
  }
}

class ListItem extends StatelessWidget {
  final String date;
  final String title;

  ListItem({required this.date, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
                SizedBox(height: 8),
                Text(
                  title,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.share),
              onPressed: () {
                // Add share functionality here
              },
            ),
          ],
        ),
      ),
    );
  }
}