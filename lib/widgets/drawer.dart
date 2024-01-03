import 'package:flutter/material.dart';
// import 'package:to_do_list/data/data.dart';
import 'package:to_do_list/models/user_auth.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  child: Container(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      // registeredUsers[loggedInUserIndex].firstName[0],
                      "M",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  // "${registeredUsers[loggedInUserIndex].firstName} ${registeredUsers[loggedInUserIndex].lastName}",
                  "Mamon HajTaher",
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text(
                  // "${registeredUsers[loggedInUserIndex].email}",
                  // "mamon@gmail.com",
                  "${Auth().auth.currentUser!.email}",
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            title: Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, "/homePage");
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            title: Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, "/settingsPage");
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            title: Text("About"),
            onTap: () {
              Navigator.pushNamed(context, "/aboutPage");
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            title: Text("Logout"),
            onTap: () {
              Navigator.pushNamed(context, "/welcomePage");
            },
          ),
        ],
      ),
    );
  }
}
