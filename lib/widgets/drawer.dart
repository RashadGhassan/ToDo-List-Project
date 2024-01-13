import 'package:flutter/material.dart';
import 'package:to_do_list/models/user_details.dart';
import 'package:to_do_list/models/user_auth.dart';
import 'package:to_do_list/models/firebase_service.dart';

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
          FutureBuilder(
              future: FirebaseService()
                  .getUserDetails(Auth().auth.currentUser!.uid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  UserDetails user = snapshot.data!;
                  return DrawerHeader(
                    child: Center(
                      child: ListTile(
                        leading: ClipOval(
                          child: SizedBox.fromSize(
                            size: Size.fromRadius(22),
                            child: Image.network(user.photoURL),
                          ),
                        ),
                        title: Text(
                          "${user.firstName.toString()} ${user.lastName.toString()}",
                          style: const TextStyle(fontSize: 20),
                        ),
                        subtitle: Text(
                          user.email.toString(),
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  );
                } else {
                  return const Text("");
                }
              }),
          ListTile(
            leading: const Icon(Icons.home),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            title: const Text("Home"),
            onTap: () {
              Navigator.pushNamed(context, "/homePage");
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            title: const Text("Settings"),
            onTap: () {
              Navigator.pushNamed(context, "/settingsPage");
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            title: const Text("About"),
            onTap: () {
              Navigator.pushNamed(context, "/aboutPage");
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pushNamed(context, "/welcomePage");
            },
          ),
        ],
      ),
    );
  }
}
