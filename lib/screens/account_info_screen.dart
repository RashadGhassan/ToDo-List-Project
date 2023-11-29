import 'package:flutter/material.dart';

class AccountInfo extends StatelessWidget {
  const AccountInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account Info",
          style: TextStyle(fontSize: 24),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: AccountInfoForm(),
    );
  }
}

class AccountInfoForm extends StatefulWidget {
  const AccountInfoForm({super.key});

  @override
  State<AccountInfoForm> createState() => _AccountInfoFormState();
}

class _AccountInfoFormState extends State<AccountInfoForm> {
  var _formKey = GlobalKey<FormState>();

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Field Required!";
                }
              },
              decoration: InputDecoration(
                prefixText: "Mamon",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
