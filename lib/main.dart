import 'package:flutter/material.dart';
import 'package:to_do_list/screens/about_screen.dart';
import 'package:to_do_list/screens/account_info_screen.dart';
import 'package:to_do_list/screens/login_screen.dart';
import 'package:to_do_list/screens/register_info_screen.dart';
import 'package:to_do_list/screens/register_screen.dart';
import 'package:to_do_list/screens/welcome_screen.dart';
import 'package:to_do_list/screens/settings_screen.dart';
import 'package:to_do_list/screens/home_screen.dart';
import 'package:to_do_list/screens/change_email_screen.dart';
import 'package:to_do_list/screens/change_pass_screen.dart';
import 'package:to_do_list/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        "/infoRegistrationPage": (context) => InfoRegistrationPage(),
        "/settingsPage": (context) => SettingsPage(),
        "/homePage": (context) => HomePage(),
        "/changeEmailPage": (context) => ChangeEmail(),
        "/changePassPage": (context) => ChangePass(),
        "/accountInfoPage": (context) => AccountInfo(),
        "/aboutPage": (context) => AboutPage(),
      },
    );
  }
}
