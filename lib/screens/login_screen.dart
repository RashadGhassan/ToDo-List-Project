import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdee3e6),
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
          Container(
            child: SvgPicture.asset("assets/images/login.svg"),
            height: 180,
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
          FormLayout(),
          const SizedBox(
            height: 16,
          ),
          LoginButton(),
        ],
      ),
    );
  }
}

class FormLayout extends StatefulWidget {
  const FormLayout({super.key});

  @override
  State<FormLayout> createState() => _FormLayoutState();
}

class _FormLayoutState extends State<FormLayout> {
  bool _passwordVisible = false;

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
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field Required!";
                  }
                  if (!(value.contains('@') && value.contains(".com"))) {
                    return "Invalid Email!";
                  }
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
                    // fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Field Required!";
                  }
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
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 12),
            child: Row(
              children: const [
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

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: const Size.fromHeight(50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            var sb = const SnackBar(
              content: Text("Login Successful!"),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
              padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            );
            ScaffoldMessenger.of(context).showSnackBar(sb);
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 24,
              color: Color(0xffdee3e6),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
