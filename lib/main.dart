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
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
        "/welcomePage": (context) => const WelcomePage(),
        "/loginPage": (context) => const LoginPage(),
        "/registrationPage": (context) => const RegistrationPage(),
        "/infoRegistrationPage": (context) => const InfoRegistrationPage(),
        "/settingsPage": (context) => const SettingsPage(),
        "/homePage": (context) => const HomePage(),
        "/changeEmailPage": (context) => const ChangeEmail(),
        "/changePassPage": (context) => const ChangePass(),
        "/accountInfoPage": (context) => const AccountInfo(),
        "/aboutPage": (context) => const AboutPage(),
      },
    );
  }
}
