import 'package:college_kpi_apps/screens_home/Academic_calender_screen.dart';
import 'package:college_kpi_apps/screens_home/Booklist_screen.dart';
import 'package:college_kpi_apps/screens_home/CGPA_screen.dart';
import 'package:college_kpi_apps/screens_home/EditProfile_screen.dart';
import 'package:college_kpi_apps/screens_home/More_screen.dart';
import 'package:college_kpi_apps/screens_home/Probidhan_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
          backgroundColor: Colors.purple,
          elevation: 4.0,
           leading: Builder(
            builder: (context) => IconButton(
        icon: const Icon(Icons.menu),
       onPressed: () {
        Scaffold.of(context).openDrawer();
       },
       ),
        ),
        ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                const DrawerHeader(
                  decoration: BoxDecoration(color: Colors.purple),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                                'assets/musa1.png'), // Replace with your image URL
                          ),
                        ),
                        SizedBox(height: 10),
                        Text("Dev Musa Alom Mim", style: TextStyle(color: Colors.white, fontSize: 18)),
                        Text("mdmim018islam@gmail.com", style: TextStyle(color: Colors.white70)),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text("Settings"),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text("Logout"),
                  onTap: () {},
                ),
              ],
            ),
          ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ListTile(
                    leading: Image.asset(
                      'assets/goodnight.jpeg',
                      // Replace with your image URL
                      fit: BoxFit.cover,
                      width: 80,
                    ),
                    title: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>EditProfileScreen()));
                        },
                        child: const Text('Good Night')),
                    subtitle: const Text('Edit Profile'),
                  ),
                ),
                const SizedBox(height: 8.0),
                const SlidingTextCard(),
                const SizedBox(height: 8.0),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: const ListTile(
                    leading: Icon(Icons.calendar_today, color: Colors.blue),
                    title: Text('Class Routine'),
                    subtitle: Text('Check Today\'s Class Routine?'),
                    trailing: Icon(Icons.arrow_forward, color: Colors.blue),
                  ),
                ),
                const Divider(),
                const SizedBox(height: 16.0),
                const Text(
                  'Recommended For You',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8.0),
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)
                  ),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                    ),
                    itemCount: 6,
                    itemBuilder: (context, index) {
                      final categories = [
                        'News Feed',
                        'Probidhan',
                        'Academic',
                        'CGPA',
                        'Book List',
                        'More',
                      ];
                      final icons = [
                        Icons.newspaper,
                        Icons.rule,
                        Icons.calendar_month,
                        Icons.calculate,
                        Icons.book,
                        Icons.more_horiz,
                      ];
                      return InkWell(
                        onTap: () {
                          // Handle the click event for each category
                          switch (index) {
                            case 0:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProbidhansScreen(    )),
                              );
                              break;
                            case 1:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProbidhansScreen()),
                              );
                              break;
                            case 2:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AcademicCalendarScreen()),
                              );
                              break;
                            case 3:
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CGPACalculator()),
                              );
                              break;
                            case 4:
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  BookListScreen()),
                              );
                              break;
                            case 5:
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const MoreScreen()),
                              );
                              break;
                          }
                        },

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.purple.shade100,
                              child: Icon(
                                icons[index],
                                size: 30,
                                color: Colors.purple,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Text(categories[index], textAlign: TextAlign.center),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const Text(
                  'Browse',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildCard('Study', Icons.school, Colors.orange),
                    _buildCard('BTEB Notice', Icons.campaign, Colors.green),
                    _buildCard('TMED', Icons.flag, Colors.red),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Others',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildCard('Check Update', Icons.update, Colors.blue),
                    _buildCard('Rate App', Icons.star, Colors.yellow),
                    _buildCard('Invite Friend', Icons.mail, Colors.pink),
                    _buildCard('About', Icons.info, Colors.cyan),
                    _buildCard(
                        'Privacy Policy', Icons.privacy_tip, Colors.purple),
                    _buildCard('Contact', Icons.headset_mic, Colors.teal),
                    _buildCard('Bookmarks', Icons.bookmark, Colors.brown),
                    _buildCard('Materials', Icons.description, Colors.indigo),
                  ],
                ),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'v0.0.1',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),

          ),
        )
    );
  }

  Widget _buildCard(String title, IconData icon, Color color) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
      child: InkWell(
        onTap: () {
          // Handle card tap
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            const SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}

class SlidingTextCard extends StatefulWidget {
  const SlidingTextCard({super.key});

  @override
  _SlidingTextCardState createState() => _SlidingTextCardState();
}

class _SlidingTextCardState extends State<SlidingTextCard> {
  final List<String> texts = [
    'ডিপ্লোমা-ইন-ইঞ্জিনিয়ারিং শিক্ষাক্রম (ডিসেম্বর, ২০২৪-জানুয়ারি, ২০২৫ মাসে)',
    'Welcome to the new semester!',
    'Check your schedule today!',
  ];

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(const Duration(seconds: 3), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % texts.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Center(child: Icon(Icons.local_fire_department,
                    color: Colors.red)),
                const SizedBox(width: 8.0),
                Expanded(
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      texts[currentIndex],
                      key: ValueKey<String>(texts[currentIndex]),
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(texts.length, (index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: CircleAvatar(
                    radius: 5,
                    backgroundColor: index == currentIndex ? Colors.blue : Colors.grey,
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
