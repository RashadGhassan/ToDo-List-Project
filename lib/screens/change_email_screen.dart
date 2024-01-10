import 'package:flutter/material.dart';
import 'package:to_do_list/data/data.dart';

class ChangeEmail extends StatefulWidget {
  const ChangeEmail({super.key});

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  var _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  String email = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2D6D8),
      appBar: AppBar(
        title: Text(
          "Change Email",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    validator: (value) {
                      email = value!;
                      if (!(value.contains('@') && value.contains(".com"))) {
                        return "Invalid Email!";
                      }
                      // if (value == registeredUsers[loggedInUserIndex].email) {
                      //   return "New Email must be different from the current one";
                      // }
                    },
                    decoration: InputDecoration(
                      //hintText: "Enter your name", // this goes away when writing
                      //labelText: "Enter your name", // this goes to the top
                      label: Text("New Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (!(value!.contains('@') &&
                          value.contains(".com") &&
                          email == value)) {
                        return "Invalid Email!";
                      }
                    },
                    decoration: InputDecoration(
                      //hintText: "Enter your name", // this goes away when writing
                      //labelText: "Enter your name", // this goes to the top
                      label: Text("Confirm New Email"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Required Field';
                      }
                      // if (registeredUsers[loggedInUserIndex].pass != value) {
                      //   return "Incorrect Password!";
                      // }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_passwordVisible,
                    decoration: InputDecoration(
                      errorMaxLines: 4,
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
                      //hintText: "Enter your name", // this goes away when writing
                      //labelText: "Enter your name", // this goes to the top
                      label: Text("Password"),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var sb = const SnackBar(
                      content: Text("Email Changed Successfully"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(sb);
                    // registeredUsers[loggedInUserIndex].email = email;
                    Navigator.pushNamed(context, "/homePage");
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Submit",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
