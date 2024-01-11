import 'dart:js_interop';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/models/user_auth.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

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
      body: const Registration(),
    );
  }
}

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

var _formKey = GlobalKey<FormState>();
bool _passwordVisible = false;
// dynamic pass = "";

// String newUserEmail = "";
// String newUserPass = "";

class _RegistrationState extends State<Registration> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: Image.asset("assets/images/register.png"),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 24.0),
            child: Text(
              "Create your Account",
              style: TextStyle(
                fontSize: 40,
                color: Color(0xff0b2e35),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: RegistrationForm(),
          ),
          const Padding(
            padding: EdgeInsets.all(24.0),
            child: RegistrationButton(),
          ),
        ],
      ),
    );
  }
}

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

class _RegistrationFormState extends State<RegistrationForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
              controller: emailController,
              validator: (value) {
                // newUserEmail = value!;
                if (value!.isEmpty) {
                  return "Field Required!";
                }
                if (!(value.contains('@') && value.contains(".com"))) {
                  return "Invalid Email!";
                }
                return null;
              },
              decoration: const InputDecoration(
                //hintText: "Enter your name", // this goes away when writing
                //labelText: "Enter your name", // this goes to the top
                hintText: "name@example.com",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
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
                  // fontWeight: FontWeight.w600,
                ),
              ),
            ),
            TextFormField(
              controller: passwordController,
              validator: (value) {
                // pass = value!;
                // newUserPass = pass;
                if (value!.isEmpty) {
                  return "Field Required!";
                }
                if (value.length < 8) {
                  return "Password must be 8 Characters Long";
                }
                RegExp regex = RegExp(r'^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                if (!regex.hasMatch(value)) {
                  return "Password must contain at least one special character, and atleast one number";
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: !_passwordVisible,
              decoration: InputDecoration(
                errorMaxLines: 4,
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                //hintText: "Enter your name", // this goes away when writing
                //labelText: "Enter your name", // this goes to the top
                hintText: "Ah@k082",
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 4.0, left: 12),
              child: Text(
                "Confirm Password",
                style: TextStyle(
                  color: Color(0xff666666),
                  fontSize: 16,
                ),
              ),
            ),
            TextFormField(
              controller: confirmPasswordController,
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field Required!";
                }
                if (value != passwordController.text) {
                  return "Password not Matched";
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: "Ah@k082",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class RegistrationButton extends StatefulWidget {
  const RegistrationButton({super.key});

  @override
  State<RegistrationButton> createState() => _RegistrationButtonState();
}

class _RegistrationButtonState extends State<RegistrationButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xff187585),
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _handleSignUpFirst();
        }
      },
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          "Register",
          style: TextStyle(
            fontSize: 24,
            color: Color(0xFFD2D6D8),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Future<void> _handleSignUpFirst() async {
    try {
      await Auth().signUpWithEmailandPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      Navigator.pushNamed(context, "/infoRegistrationPage");
    } on FirebaseAuthException catch (e) {
      var sb = const SnackBar(
        content: Text("User already Registered!"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      );
      ScaffoldMessenger.of(context).showSnackBar(sb);
      print(e.message);
    }
  }
}
