import 'package:flutter/material.dart';
import 'package:to_do_list/data/data.dart';

class ChangePass extends StatefulWidget {
  const ChangePass({super.key});

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  var _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  String confirmPass = "";
  String currentPass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2D6D8),
      appBar: AppBar(
        title: Text(
          "Change Password",
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
                      currentPass = value!;
                      if (value.isEmpty) {
                        return "Field Required!";
                      }
                      if (registeredUsers[loggedInUserIndex].pass != value) {
                        return "Incorrect Password!";
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      label: Text("Current Password"),
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
                      confirmPass = value!;
                      if (value.isEmpty) {
                        return "Field Required!";
                      }
                      if (value.length < 8) {
                        return "Password must be 8 Characters Long";
                      }
                      RegExp regex =
                          RegExp(r'^(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                      if (!regex.hasMatch(value)) {
                        return "Password must contain at least one special character, and at least one number";
                      }
                      if (value == currentPass) {
                        return "New Password must be different from the current one";
                      }
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
                      label: Text("New Password"),
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
                        return 'Required Feild';
                      }
                      if (value != confirmPass) {
                        return "Password not Matched";
                      }
                    },
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      errorMaxLines: 4,
                      label: Text("Confirm New Password"),
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
                      content: Text("Password Changed Successfully"),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 2),
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(sb);
                    registeredUsers[loggedInUserIndex].pass = confirmPass;
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
