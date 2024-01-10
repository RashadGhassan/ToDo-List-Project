// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:to_do_list/models/user_details.dart';
import 'package:to_do_list/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:to_do_list/models/user_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:file_picker/file_picker.dart';

class InfoRegistrationPage extends StatelessWidget {
  const InfoRegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fill Your Information",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: const Color(0xff187585),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
                elevation: 0,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
            child: const Icon(
              Icons.arrow_back_ios,
              color: Color(0xFFD2D6D8),
              grade: 20,
            ),
          ),
        ),
      ),
      body: const InfoRegistration(),
    );
  }
}

class InfoRegistration extends StatefulWidget {
  const InfoRegistration({super.key});

  @override
  State<InfoRegistration> createState() => _InfoRegistrationState();
}

class _InfoRegistrationState extends State<InfoRegistration> {
  final _formKey = GlobalKey<FormState>();
  //changed dateTime variable
  dynamic _dayTime =
      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}";

  //changed dateTime function
  void _showDatePicker() {
    showDatePicker(
      context: context,
      firstDate: DateTime(1923),
      lastDate: DateTime.now(),
      errorInvalidText: "Invalid Date",
    ).then((value) {
      setState(() {
        _dayTime =
            "${value!.day.toString()}-${value.month.toString()}-${value.year.toString()}";
      });
    });
  }

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  FilePickerResult? _img;
  Future<void> picImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    if (result != null) {
      setState(() {
        _img = result;
      });
    } else {
      print("No file selected!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 32.0),
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  child: CircleAvatar(
                    child: _img == null
                        ? IconButton(
                            onPressed: () {
                              picImage();
                            },
                            icon: Icon(Icons.camera_alt),
                          )
                        : IconButton(
                            onPressed: () {
                              picImage();
                            },
                            icon: Image(
                                image: MemoryImage(_img!.files.first.bytes!),
                                fit: BoxFit.fill),
                          ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4.0, left: 12),
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
                        return null;
                        // newUser.firstName = value;
                      },
                      decoration: const InputDecoration(
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
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4.0, left: 12),
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
                        return null;
                        // newUser.lastName = value;
                      },
                      decoration: const InputDecoration(
                        hintText: "Hajtaher",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4.0, left: 12),
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
                        return null;
                        // newUser.phone = value;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        prefixText: "+962",
                        hintText: "7950111223",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 4.0, left: 12),
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
                      readOnly: true,
                      decoration: InputDecoration(
                        suffixIcon: MaterialButton(
                          onPressed: _showDatePicker,
                          child: Icon(
                            Icons.calendar_month,
                            color: Colors.grey[600],
                          ),
                        ),
                        hintText: _dayTime,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const RadioRow(),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.only(left: 12.0),
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
                  var sb = const SnackBar(
                    content: Text("Registered"),
                    backgroundColor: Colors.green,
                    duration: Duration(seconds: 2),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(sb);
                  // _addNewUser(newUser);
                  _handleSignUp();
                }
              },
              child: const Padding(
                padding: EdgeInsets.all(16.0),
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

  Future<void> _handleSignUp() async {
    final Reference userpicref = FirebaseStorage.instance
        .ref()
        .child("userImage")
        .child("${DateTime.now().millisecondsSinceEpoch}.jpg");
    UploadTask ut = userpicref.putData(_img!.files.first.bytes!);
    String imgURL = await (await ut).ref.getDownloadURL();
    try {
      await Auth()
          .signUpWithEmailandPassword(
              email: emailController.text, password: passwordController.text)
          .whenComplete(() {
        Map<dynamic, dynamic> user = {
          "email": emailController.text.toString(),
          "password": passwordController.text.toString(),
          "firstName": firstNameController.text.toString(),
          "lastName": lastNameController.text.toString(),
          "phone": phoneController.text.toString(),
          "dob": _dayTime.toString(),
          "gender": grpValue.toString().split('.').last,
          "photoURL": imgURL,
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
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Text(
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
              activeColor: const Color(0xff187585),
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
              activeColor: const Color(0xff187585),
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
