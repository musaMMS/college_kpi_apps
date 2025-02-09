import 'package:flutter/material.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text('Contact Me'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'For feedback, queries, advertising opportunities and other questions, please submit this form and we will get in touch with you shortly',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your name',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your Email',
                  errorText: null,
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Reason for contacting',
                ),
              ),
              SizedBox(height: 10.0),
              TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Write your Experience',
                ),
              ),
              SizedBox(height: 20.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
                  child: Text('SUBMIT',
                  style: TextStyle(
                    color: Colors.black
                  ),
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
