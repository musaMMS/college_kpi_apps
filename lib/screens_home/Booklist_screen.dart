import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class BookListScreen extends StatelessWidget {
  final List<Map<String, String>> books = [
    {'image': 'assets/Ghorebose.png', 'pdf': 'assets/Ghore_Boshe.pdf'},
    {'image': 'assets/vocabulary.png', 'pdf': 'assets/shobar-jonno-vocabulary.pdf'},
    {'image': 'assets/Ghorebose.png', 'pdf': 'assets/Ghore_Boshe.pdf'},
    {'image': 'assets/vocabulary.png', 'pdf': 'assets/shobar-jonno-vocabulary.pdf'},
    {'image': 'assets/Ghorebose.png', 'pdf': 'assets/Ghore_Boshe.pdf'},
    {'image': 'assets/vocabulary.png', 'pdf': 'assets/shobar-jonno-vocabulary.pdf'},
  ];

  BookListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Book Library")),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFScreen(pdfPath: books[index]['pdf']!),
                ),
              );
            },
            child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Image.asset(books[index]['image']!, fit: BoxFit.cover)),
          );
        },
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  final String pdfPath;

  const PDFScreen({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PDF Viewer")),
      body: SfPdfViewer.asset(pdfPath),
    );
  }
}
