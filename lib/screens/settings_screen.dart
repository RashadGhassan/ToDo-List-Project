import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/drawer.dart';
import 'package:to_do_list/widgets/list_tile_settings.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2D6D8),
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(fontSize: 24),
        ),
      ),
      drawer: DrawerWidget(),
      body: Column(
        children: [
          SizedBox(height: 8),
          ListTileSetting(
            text: "Account Info",
            routeName: "/accountInfoPage",
          ),
          SizedBox(height: 8),
          ListTileSetting(
            text: "Change Email",
            routeName: "/changeEmailPage",
          ),
          SizedBox(height: 8),
          ListTileSetting(
            text: "Change Password",
            routeName: "/changePassPage",
          ),
        ],
      ),
    );
  }
}
