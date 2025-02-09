import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        "date": "12-11-2024",
        "title": "ডিপ্লোমা ইন টেক্সটাইল ইঞ্জিনিয়ারিং শিক্ষাক্রমের ২য়, ৪র্থ, ৬ষ্ঠ ও ৮ম পর্বের বোর্ড সমাপনী পরীক্ষা-২০২৪ এর ফলাফল বিষয়ে বিজ্ঞপ্তি",
      },
      {
        "date": "11-11-2024",
        "title": "ডিপ্লোমা ইন এগ্রিকালচার-ফিসারিজ-লাইভস্টক ও ফরেস্ট্রি শিক্ষাক্রমের বোর্ড সমাপনী পরীক্ষা ২০২৪ এর ফলাফল বিষয়ে বিজ্ঞপ্তি",
      },
      {
        "date": "10-11-2024",
        "title": "ডিপ্লোমা-ইন-ইঞ্জিনিয়ারিং শিক্ষাক্রম (ডিসেম্বর, ২০২৪-জানুয়ারি, ২০২৫ মাসে অনুষ্ঠিতব্য) পরীক্ষা ২০২৪ এর কেন্দ্র তালিকা",
      },
      {
        "date": "10-11-2024",
        "title": "অ্যাডভান্সড সার্টিফিকেট কোর্স-এ ভর্তি বিজ্ঞপ্তি প্রকাশিত হয়েছে",
      },
      {
        "date": "10-11-2024",
        "title": "বেসরকারি প্রতিষ্ঠানসমূহে ডিপ্লোমা ও এইচএসসি পর্যায়ের বিভিন্ন শিক্ষাক্রমে ভর্তির সময় বৃদ্ধির বিজ্ঞপ্তি",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Diplomaian"),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;
          double padding = (width > 600) ? 20.0 : 8.0; // Adjust padding based on screen width

          return ListView.builder(
            padding: EdgeInsets.all(padding),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: EdgeInsets.symmetric(vertical: padding),
                elevation: 4,
                child: Padding(
                  padding: EdgeInsets.all(padding),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            item['date']!,
                            style: TextStyle(
                              fontSize: (width > 600) ? 16.0 : 14.0, // Larger text on wider screens
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.copy, color: Colors.purple),
                                onPressed: () {
                                  // Add copy functionality
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.share, color: Colors.purple),
                                onPressed: () {
                                  // Add share functionality
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        item['title']!,
                        style: TextStyle(
                          fontSize: (width > 600) ? 18.0 : 16.0, // Larger text on wider screens
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
