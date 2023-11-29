import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: "Poppins",
            ),
      ),
      title: "To Do List Application",
      home: Scaffold(
        appBar: AppBar(
          title: Text("About TodoSync...",),
        ),
        drawer: DrawerWidget(),
        body:Padding(
          padding: const EdgeInsets.only(left: 12),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text("Description:",style: TextStyle(fontSize: 40,color: Colors.grey,fontWeight: FontWeight.w300),),
                  Text("TodoSync is not just another any todo app; it's your personal productivity companion designed to simplify your life and keep you organized. Whether you're a student, professional, or a busy parent, TodoSync empowers you to manage your tasks with ease.",style: TextStyle(color: Colors.grey),),
                  SizedBox(height:20),
                  Text("Application Features:",style: TextStyle(fontSize: 40,color: Colors.grey,fontWeight: FontWeight.w300),),
                  SizedBox(height: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("\u2022  Intuitive Interface: TodoSync provides a clean and user-friendly interface, making it effortless to add and delete your todos.",style: TextStyle(color: Colors.grey),),
                      Text("\u2022  Monitor Todos: TodoSync provides the ability to monitor todo information and details.",style: TextStyle(color: Colors.grey),),
                      Text("\u2022  Account Information: TodoSync provides the ability to change user information; including email, password, and user information",style: TextStyle(color: Colors.grey),),
                      Text("\u2022  Data Security: Your data is important. TodoSync prioritizes your privacy and data security, ensuring that your task lists and information are kept confidential.",style: TextStyle(color: Colors.grey),),
                    ],
                  ),
                  
                  
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Column(
                  children: [
                     Text("Version 1.0",style: TextStyle(color: Colors.grey),),
                Text("Project Done by Maamoun Hajtaher and Rashad Ghassan",style: TextStyle(fontSize: 8,color: Colors.grey),)
                  ],
                ),
              )
             
            ],
          ),
        ),
        
      ),
    );
  }
}
