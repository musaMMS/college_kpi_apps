import 'package:college_kpi_apps/setting/About_screen.dart';
import 'package:college_kpi_apps/setting/Report_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.light;

  bool get isDarkMode => themeMode == ThemeMode.dark;

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Settings"), backgroundColor: Colors.purple),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: LayoutBuilder(
          builder: (context, constraints) {
            double width = constraints.maxWidth;
            double padding = (width > 600) ? 20.0 : 16.0; // Adjust padding based on screen width
            double fontSize = (width > 600) ? 18.0 : 16.0; // Adjust font size for larger screens

            return Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildListTile(Icons.person, "Smart Profile", context, SmartProfileScreen(), fontSize),
                  _buildListTile(Icons.groups, "About Us", context, const AboutUsScreen(), fontSize),
                  _buildListTile(Icons.report, "Report", context, ReportScreen(), fontSize),
                  _buildListTile(Icons.calculate, "CGPA Calculator", context, CGPACalculatorScreen(), fontSize),

                  // Dark Mode Toggle
                  Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: const Icon(Icons.nightlight_round, color: Colors.purple),
                      title: Text("Dark Mode", style: TextStyle(fontSize: fontSize)),
                      trailing: Switch(
                        value: themeProvider.isDarkMode,
                        onChanged: (value) {
                          themeProvider.toggleTheme(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, BuildContext context, Widget screen, double fontSize) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.purple),
        title: Text(title, style: TextStyle(fontSize: fontSize)), // Adjust font size here
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
        },
      ),
    );
  }
}

// Dummy Screens
class SmartProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("Smart Profile")), body: Center(child: Text("Smart Profile Page")));
  }
}

class CGPACalculatorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text("CGPA Calculator")), body: Center(child: Text("CGPA Calculator Page")));
  }
}
