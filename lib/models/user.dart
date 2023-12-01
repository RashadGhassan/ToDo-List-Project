class User {
  int id;
  String firstName;
  String lastName;
  String email;
  String pass;
  String dateOfBirth;
  String phone;
  Gender gender;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.pass,
    required this.dateOfBirth,
    required this.phone,
    required this.gender,
  });
}

enum Gender {
  Male,
  Female,
}
