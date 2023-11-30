import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/drawer.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2D6D8),
      appBar: AppBar(
        title: Text(
          "About ToDoSync...",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      drawer: DrawerWidget(),
      body: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Text(
                  "Description:",
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                ),
                Text(
                  "ToDoSync is not just another any todo app; it's your personal productivity companion designed to simplify your life and keep you organized. Whether you're a student, professional, or a busy parent, ToDoSync empowers you to manage your tasks with ease.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Application Features:",
                  style: TextStyle(
                      fontSize: 36,
                      color: Colors.grey,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "\u2022  Intuitive Interface: ToDoSync provides a clean and user-friendly interface, making it effortless to add and delete your todos.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "\u2022  Account Information: ToDoSync provides the ability to change user information; including email, password, and user information.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "\u2022  Data Security: Your data is important. ToDoSync prioritizes your privacy and data security, ensuring that your task lists and information are kept confidential.",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Column(
                children: [
                  Text(
                    "Version 1.0",
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                  ),
                  Text(
                    "Created by Maamoun Hajtaher and Rashad Ghassan",
                    style: TextStyle(fontSize: 12, color: Colors.grey),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
