// ignore_for_file: use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
// import 'package:to_do_list/data/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_do_list/models/user_auth.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD2D6D8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(
          color: Color(0xff0b2e35),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: const LoginForm(),
    );
  }
}

var _formKey = GlobalKey<FormState>();

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const SizedBox(
            height: 12,
          ),
          //svg illus
          SizedBox(
            height: 180,
            child: Image.asset("assets/images/login.png"),
          ),
          const SizedBox(
            height: 32,
          ),
          //main login heading
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Login to your Account",
              style: TextStyle(
                fontSize: 40,
                color: Color(0xff0b2e35),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          const FormLayout(),
          const SizedBox(
            height: 16,
          ),
          const LoginButton(),
        ],
      ),
    );
  }
}

int index = -1;

class FormLayout extends StatefulWidget {
  const FormLayout({super.key});

  @override
  State<FormLayout> createState() => _FormLayoutState();
}

bool _passwordVisible = false;
final TextEditingController _controllerEmail = TextEditingController();
final TextEditingController _controllerPassword = TextEditingController();

class _FormLayoutState extends State<FormLayout> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 4.0, left: 12),
                child: Text(
                  "Email",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 16,
                    // fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextFormField(
                controller: _controllerEmail,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field Required!";
                  }
                  if (!(value.contains('@') && value.contains(".com"))) {
                    return "Invalid Email!";
                  }
                  return null;
                },
                decoration: const InputDecoration(
                  hintText: "name@example.com",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 4.0, left: 12),
                child: Text(
                  "Password",
                  style: TextStyle(
                    color: Color(0xff666666),
                    fontSize: 16,
                  ),
                ),
              ),
              TextFormField(
                controller: _controllerPassword,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field Required!";
                  }
                  return null;
                },
                keyboardType: TextInputType.visiblePassword,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  hintText: "Ah@k082",
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8, left: 12),
            child: Row(
              children: [
                Text(
                  "Forgot your password?",
                  style: TextStyle(
                    color: Color(0xff187585),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  const LoginButton({super.key});

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff187585),
          minimumSize: const Size.fromHeight(50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            _handleSignIn();
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 24,
              color: Color(0xFFD2D6D8),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignIn() async {
    try {
      await Auth().signInWithEmailandPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
      var sb = const SnackBar(
        content: Text("Login Successful!"),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      );
      ScaffoldMessenger.of(context).showSnackBar(sb);

      print("login successful");
      // loggedInUserIndex = index;
      _controllerEmail.clear();
      _controllerPassword.clear();
      _passwordVisible = false;
      Navigator.pushNamed(context, "/homePage");
    } on FirebaseAuthException catch (e) {
      var sb = const SnackBar(
        content: Text("User not Registered!"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      );
      ScaffoldMessenger.of(context).showSnackBar(sb);
      print(e.message);
    }
  }
}
