import 'package:flutter/material.dart';


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
                    padding:
                        EdgeInsets.all(12),
                    child: Text(
                      "M",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                                  ),
                  ),
                  title: Text("Maamoun Hajtaher",style: TextStyle(fontSize: 20),),
                  subtitle: Text("maamoun.ameenex@gmail.com",style: TextStyle(fontSize: 12),),
                ),
              ),
              ),
          ListTile(
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            title: Text("Home"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            title: Text("Profile"),
            onTap: () {
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            title: Text("About"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.logout),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
            title: Text("Logout"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}

  
