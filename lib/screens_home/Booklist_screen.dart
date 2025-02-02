import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';


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
      appBar: AppBar(title: Text("Book Library")),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
            child: Image.asset(books[index]['image']!),
          );
        },
      ),
    );
  }
}

class PDFScreen extends StatelessWidget {
  final String pdfPath;

  PDFScreen({required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("PDF Viewer")),
      body: PDFView(
        filePath: pdfPath,
      ),
    );
  }
}

