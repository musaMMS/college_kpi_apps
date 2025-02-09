import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ProbidhansScreen extends StatelessWidget {
  const ProbidhansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: const Text('Probidhan', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.grey[200], // Background color
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            _buildButton(context, 'Probidhan 2022', 'assets/probidhan-2022.pdf'),
            _buildButton(context, 'Probidhan 2016', 'assets/DiplomaEnggProbidhan_2016-DMEstudy.pdf'),
            _buildButton(context, 'Probidhan 2010', 'assets/diploma_in_engineering_probidhan_2010_revised-DMEstudy.pdf'),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String text, String pdfPath) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple,
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PdfViewerScreen(pdfPath: pdfPath, title: text),
            ),
          );
        },
        child: Text(
          text,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }
}

class PdfViewerScreen extends StatelessWidget {
  final String pdfPath;
  final String title;

  const PdfViewerScreen({super.key, required this.pdfPath, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(title, style: const TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SfPdfViewer.asset(pdfPath),
    );
  }
}
