// import 'package:flutter/material.dart';
//
// class SettingScreen extends StatelessWidget {
//   final List<Map<String, dynamic>> menuItems = [
//     {
//       'icon': Icons.person,
//       'text': 'Smart Profile',
//       'onTap': () {
//         print('Smart Profile clicked');
//       },
//     },
//     {
//       'icon': Icons.group,
//       'text': 'About Us',
//       'onTap': () {
//         print('About Us clicked');
//       },
//     },
//     {
//       'icon': Icons.report,
//       'text': 'Report',
//       'onTap': () {
//         print('Report clicked');
//       },
//     },
//     {
//       'icon': Icons.calculate,
//       'text': 'CGPA Calculator',
//       'onTap': () {
//         print('CGPA Calculator clicked');
//       },
//     },
//     {
//       'icon': Icons.dark_mode,
//       'text': 'Dark Mode',
//       'onTap': () {
//         print('Dark Mode toggled');
//       },
//       'isSwitch': true,
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Diplomain'),
//         backgroundColor: Colors.purple,
//       ),
//       body: ListView.builder(
//         itemCount: menuItems.length,
//         itemBuilder: (context, index) {
//           final item = menuItems[index];
//           return Card(
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(12.0)
//             ),
//             margin: EdgeInsets.symmetric(vertical: 8.0),
//             elevation: 4,
//             child: ListTile(
//               leading: Icon(item['icon'], color: Colors.purple),
//               title: Text(item['text']),
//               trailing: item['isSwitch'] == true
//                   ? Switch(
//                 value: false,
//                 onChanged: (value) {
//                   print('Dark Mode toggled: $value');
//                 },
//               )
//                   : null,
//               onTap: item['onTap'] != null ? item['onTap'] : null,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Theme Provider to handle light/dark mode switching
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
      appBar: AppBar(title: Text("Settings"), backgroundColor: Colors.purple),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildListTile(Icons.person, "Smart Profile"),
            _buildListTile(Icons.groups, "About Us"),
            _buildListTile(Icons.report, "Report"),
            _buildListTile(Icons.calculate, "CGPA Calculator"),

            // Dark Mode Toggle
            Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: Icon(Icons.nightlight_round, color: Colors.purple),
                title: Text("Dark Mode"),
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
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.purple),
        title: Text(title),
        onTap: () {},
      ),
    );

  }
}
