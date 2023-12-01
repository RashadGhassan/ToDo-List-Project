import 'package:to_do_list/models/user.dart';

dynamic registeredUsers = [
  User(
      id: 1,
      firstName: "Rashad",
      lastName: "Ghassan",
      email: "rashad.ghassan@gmail.com",
      pass: "@test123",
      dateOfBirth: "16/8/2003",
      phone: "795133486",
      gender: Gender.Male),
  User(
      id: 2,
      firstName: "Maamoun",
      lastName: "Hajtaher",
      email: "maamoun@gmail.com",
      pass: "@test123",
      dateOfBirth: "7/6/2003",
      phone: "795705082",
      gender: Gender.Male),
];

int loggedInUserIndex = -1;
