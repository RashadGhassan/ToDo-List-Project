import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2D6D8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Color(0xff0b2e35),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Registration(),
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
          SizedBox(
            height: 10,
          ),
          Container(
            child: Image.asset("assets/images/register.png"),
            height: 150,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24.0),
            child: Text(
              "Create your Account",
              style: TextStyle(
                fontSize: 40,
                color: Color(0xff0b2e35),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(24.0),
            child: RegistrationForm(),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
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
            Padding(
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
              },
              decoration: InputDecoration(
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
        SizedBox(
          height: 12,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
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
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              decoration: InputDecoration(
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

class RegistrationButton extends StatelessWidget {
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size.fromHeight(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          Navigator.pushNamed(context, "/infoRegistrationPage");
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          "Register",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
