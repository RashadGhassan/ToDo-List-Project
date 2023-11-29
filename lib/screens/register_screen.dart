import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

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
dynamic pass = "";

class _RegistrationState extends State<Registration> {
  //changed dateTime variable
  dynamic _dayTime = "Date Of Birth";

  //changed dateTime function
  void _showDatePicker() {
    print("hello");
    showDatePicker(
      context: context,
      initialDate: DateTime(2005),
      firstDate: DateTime(1923),
      lastDate: DateTime.utc(2005, 12, 31),
      errorInvalidText: "Invalid Date",
    ).then((value) {
      setState(() {
        _dayTime =
            "${value!.day.toString()}/${value.month.toString()}/${value.year.toString()}";
      });
    });
  }

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
            child: SvgPicture.asset("assets/images/register.svg"),
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
              validator: (value) {
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
              validator: (value) {
                pass = value;
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
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field Required!";
                }
                if (value != pass) {
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
