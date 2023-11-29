import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:to_do_list/screens/login_screen.dart';
import 'package:to_do_list/screens/register_screen.dart';
import 'package:to_do_list/screens/welcome_screen.dart';

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
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: const Color(0xff187585),
            ),
        textTheme: ThemeData.light().textTheme.apply(
              fontFamily: "Poppins",
            ),
      ),
      title: "To Do List Application",
      initialRoute: "/welcomePage",
      routes: {
        "/welcomePage": (context) => WelcomePage(),
        "/loginPage": (context) => LoginPage(),
        "/registrationPage": (context) => RegistrationPage(),
      },
    );
  }
}
