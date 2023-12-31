import 'package:flutter/material.dart';
// import 'package:to_do_list/data/data.dart';
import 'package:to_do_list/models/user.dart';
import 'package:to_do_list/screens/register_screen.dart';
// import 'package:to_do_list/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:to_do_list/models/user_auth.dart';

class InfoRegistrationPage extends StatelessWidget {
  const InfoRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Fill Your Information",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff187585),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: ElevatedButton(
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFD2D6D8),
              grade: 20,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
          ),
        ),
      ),
      body: InfoRegistration(),
    );
  }
}

class InfoRegistration extends StatefulWidget {
  const InfoRegistration({super.key});

  @override
  State<InfoRegistration> createState() => _InfoRegistrationState();
}

class _InfoRegistrationState extends State<InfoRegistration> {
  var _formKey = GlobalKey<FormState>();
  //changed dateTime variable
  dynamic _dayTime = "1/1/2005";

  //changed dateTime function
  void _showDatePicker() {
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

  // void _addNewUser(user) {
  //   registeredUsers.add(user);
  //   loggedInUserIndex = registeredUsers.length - 1;
  // }

  // User newUser = User(
  //     id: registeredUsers.length + 1,
  //     firstName: "",
  //     lastName: "",
  //     email: emailController.text,
  //     pass: passwordController.text,
  //     dateOfBirth: "",
  //     phone: "",
  //     gender: grpValue);

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, left: 12),
                      child: Text(
                        "First Name",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 16,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: firstNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field Required!";
                        }
                        // newUser.firstName = value;
                      },
                      decoration: InputDecoration(
                        //hintText: "Enter your name", // this goes away when writing
                        //labelText: "Enter your name", // this goes to the top
                        hintText: "Maamoun",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, left: 12),
                      child: Text(
                        "Last Name",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 16,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: lastNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field Required!";
                        }
                        // newUser.lastName = value;
                      },
                      decoration: InputDecoration(
                        hintText: "Hajtaher",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, left: 12),
                      child: Text(
                        "Phone",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 16,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextFormField(
                      controller: phoneController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Field Required!";
                        }
                        RegExp regex = RegExp(r'^(?:[+0]9)?[0-9]{9}$');
                        if (!regex.hasMatch(value) || value.length != 9) {
                          return 'Invalid Phone Number';
                        }
                        // newUser.phone = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixText: "+962",
                        hintText: "7950111223",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, left: 12),
                      child: Text(
                        "Date of Birth",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 16,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextFormField(
                      // validator: (value) {
                      //   newUser.dateOfBirth = value!;
                      // },
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: MaterialButton(
                          child: Icon(
                            Icons.calendar_month,
                            color: Colors.grey[600],
                          ),
                          onPressed: _showDatePicker,
                        ),
                        hintText: _dayTime,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                RadioRow(),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.check_box,
                        color: Color(0xff187585),
                      ),
                      SizedBox(width: 6),
                      Text("I accept the "),
                      Text(
                        "Terms and Conditions",
                        style: TextStyle(color: Color(0xff187585)),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                backgroundColor: const Color(0xff187585),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  var sb = SnackBar(
                    content: Text("Logged In"),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(sb);
                  // _addNewUser(newUser);
                  _handleSignUp();
                }
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "Submit",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Future<void> _handleSignUp() async {
  //   print(userRef.path);
  //   try {
  //     await Auth()
  //         .signUpWithEmailandPassword(
  //             email: emailController.text, password: passwordController.text)
  //         .whenComplete(() {
  //       Map<String, dynamic> user = {
  //         "email": emailController.text,
  //         "password": passwordController.text,
  //         "firstName": firstNameController.text,
  //         "lastName": lastNameController.text,
  //         "phone": phoneController.text,
  //         "dob": _dayTime,
  //         "gender": grpValue,
  //       };
  //       print("registered successfully!");
  //       var userID = Auth().auth.currentUser!.uid;
  //       print(userID);
  //       userRef.child(userID).set(user).whenComplete(() {
  //         print("user added to database");
  //         Navigator.pushNamed(context, "/homePage");
  //       });
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     print(e.toString());
  //   }
  // }

  // final DatabaseReference userRef = FirebaseDatabase.instance.ref("users");
  Future<void> _handleSignUp() async {
    try {
      await Auth()
          .signUpWithEmailandPassword(
              email: emailController.text, password: passwordController.text)
          .whenComplete(() {
        Map<dynamic, dynamic> user = {
          "email": emailController.text,
          "password": passwordController.text,
          "firstName": firstNameController.text,
          "lastName": lastNameController.text,
          "phone": phoneController.text,
          "dob": _dayTime,
          "gender": grpValue.toString(),
        };
        print("registered successfully!");
        var userID = Auth().auth.currentUser!.uid;
        Auth().auth.currentUser!.updateDisplayName(
            "${firstNameController.text} ${lastNameController.text}");

        userRef.child(userID).set(user).whenComplete(() {
          print("user added to database");
          Navigator.pushNamed(context, '/homePage');
        });
      });
    } on FirebaseAuthException catch (e) {
      print(e.toString());
    }
  }

  final DatabaseReference userRef =
      FirebaseDatabase.instance.ref().child("users");
}

class RadioRow extends StatefulWidget {
  const RadioRow({Key? key}) : super(key: key);

  @override
  State<RadioRow> createState() => _RadioRowState();
}

dynamic grpValue = Gender.Male;

class _RadioRowState extends State<RadioRow> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: const Text(
            "Select Gender: ",
            style: TextStyle(
              color: Color(0xff666666),
              fontSize: 16,
              // fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Row(
          children: [
            Radio(
              activeColor: Color(0xff187585),
              value: Gender.Male,
              groupValue: grpValue,
              onChanged: (newValue) {
                setState(() {
                  grpValue = newValue!;
                });
              },
            ),
            const Text(
              "Male",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff0b2e35),
              ),
            ),
            Radio(
              activeColor: Color(0xff187585),
              value: Gender.Female,
              groupValue: grpValue,
              onChanged: (newValue) {
                setState(() {
                  grpValue = newValue!;
                });
              },
            ),
            const Text(
              "Female",
              style: TextStyle(
                fontSize: 18,
                color: Color(0xff0b2e35),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
