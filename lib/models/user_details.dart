// ignore_for_file: constant_identifier_names

import 'package:firebase_database/firebase_database.dart';

class UserDetails {
  String firstName;
  String lastName;
  String email;
  String password;
  String dob;
  String phone;
  String gender;
  String photoURL;

  UserDetails({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.dob,
    required this.phone,
    required this.gender,
    required this.photoURL,
  });

  Map<dynamic, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "dateOfBirth": dob,
      "phone": phone,
      "gender": gender.toString().split('.').last,
      "photoURL": photoURL,
    };
  }

  factory UserDetails.fromMap(Map<dynamic, dynamic> map) {
    return UserDetails(
      firstName: map["firstName"],
      lastName: map["lastName"],
      email: map["email"],
      password: map["password"],
      dob: map["dob"],
      phone: map["phone"],
      gender: map["gender"],
      photoURL: map["photoURL"],
    );
  }
}

enum Gender {
  Male,
  Female,
}

class FirebaseService {
  Future<UserDetails?> getUserDetails(String useruid) async {
    try {
      DatabaseReference refh = FirebaseDatabase.instance.ref().child("users");
      DatabaseEvent event = await refh.child(useruid).once();
      if (event.snapshot.value != null) {
        Map<dynamic, dynamic> snapdata = event.snapshot.value as dynamic;
        return UserDetails.fromMap(snapdata);
      } else {
        return null;
      }
    } catch (e) {
      // ignore: avoid_print
      print("here ---> ${e.toString()}");
    }
    return null;
  }
}
