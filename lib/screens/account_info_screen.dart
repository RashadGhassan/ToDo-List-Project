import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/models/user_auth.dart';
import 'package:to_do_list/models/user_details.dart';
import 'package:to_do_list/models/firebase_service.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFD2D6D8),
      appBar: AppBar(
        title: const Text(
          "Account Info",
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xff187585),
        foregroundColor: const Color(0xFFD2D6D8),
      ),
      body: const AccountInfoForm(),
    );
  }
}

class AccountInfoForm extends StatefulWidget {
  const AccountInfoForm({super.key});

  @override
  State<AccountInfoForm> createState() => _AccountInfoFormState();
}

class _AccountInfoFormState extends State<AccountInfoForm> {
  final _formKey = GlobalKey<FormState>();

  DatabaseReference dobRef = FirebaseDatabase.instance
      .ref()
      .child("users")
      .child(Auth().auth.currentUser!.uid);
  // DatabaseEvent dobEvent = dobRef.once() as DatabaseEvent;

  dynamic _dayTime = "";

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

  bool enable = false;
  Color bgColor = Colors.white;
  Color txtColor = const Color(0xff187585);
  String txt = "Edit";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            FutureBuilder(
              future: FirebaseService()
                  .getUserDetails(Auth().auth.currentUser!.uid),
              builder: (context, snapshot) {
                dobRef.onValue.listen((event) {
                  Map<dynamic, dynamic> snapdata =
                      event.snapshot.value as dynamic;
                  _dayTime = snapdata['dob'].toString();
                });
                if (snapshot.connectionState == ConnectionState.done) {
                  UserDetails user = snapshot.data!;
                  return Column(
                    children: [
                      ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(50),
                          child: Image.network(user.photoURL),
                        ),
                      ),
                      const SizedBox(height: 16),
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
                            initialValue: user.email,
                            decoration: const InputDecoration(
                              enabled: false,
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
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
                              "First Name",
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
                              return null;
                            },
                            initialValue: user.firstName,
                            decoration: InputDecoration(
                              enabled: enable,
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
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
                              "Last Name",
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
                              return null;
                            },
                            initialValue: user.lastName,
                            decoration: InputDecoration(
                              enabled: enable,
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Field Required!";
                              }
                              RegExp regex = RegExp(r'^(?:[+0]9)?[0-9]{9}$');
                              if (!regex.hasMatch(value) || value.length != 9) {
                                return 'Invalid Phone Number';
                              }
                              return null;
                            },
                            initialValue: user.phone,
                            decoration: InputDecoration(
                              prefixText: "+962",
                              enabled: enable,
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
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
                              ),
                            ),
                          ),
                          TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              enabled: enable,
                              suffixIcon: MaterialButton(
                                onPressed: _showDatePicker,
                                child: Icon(
                                  Icons.calendar_month,
                                  color: Colors.grey[600],
                                ),
                              ),
                              hintText: _dayTime,
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else {
                  return const Text("");
                }
              },
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: bgColor,
                side: const BorderSide(
                  color: Color(0xff187585),
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                setState(() {
                  enable = !enable;
                  if (enable) {
                    bgColor = const Color(0xff187585);
                    txtColor = Colors.white;
                    txt = "Save";
                  } else {
                    bgColor = Colors.white;
                    txtColor = const Color(0xff187585);
                    txt = "Edit";
                    if (_formKey.currentState!.validate()) {
                      var sb = const SnackBar(
                        content: Text("Information Changed Successfully"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2),
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(sb);
                    }
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  txt,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: txtColor,
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
