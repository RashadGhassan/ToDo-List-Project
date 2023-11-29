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

  bool enable = false;
  Color bgColor = Colors.white;
  Color txtColor = Color(0xff187585);
  String txt = "Edit";

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 4.0, left: 12),
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
                      initialValue: "maamoun.ameenex@gmail.com",
                      decoration: InputDecoration(
                        enabled: false,
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
                        "First Name",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 16,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: "Maamoun",
                      decoration: InputDecoration(
                        enabled: enable,
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
                        "Last Name",
                        style: TextStyle(
                          color: Color(0xff666666),
                          fontSize: 16,
                          // fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    TextFormField(
                      initialValue: "Hajtaher",
                      decoration: InputDecoration(
                        enabled: enable,
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
                      initialValue: "795705082",
                      decoration: InputDecoration(
                        prefixText: "+962",
                        enabled: enable,
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
                      readOnly: true,
                      decoration: InputDecoration(
                        enabled: enable,
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
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                backgroundColor: bgColor,
                side: BorderSide(
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
                    bgColor = Color(0xff187585);
                    txtColor = Colors.white;
                    txt = "Save";
                  } else {
                    bgColor = Colors.white;
                    txtColor = Color(0xff187585);
                    txt = "Edit";
                    if (_formKey.currentState!.validate()) {
                      var sb = const SnackBar(
                        content: Text("Email Changed Successfully"),
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
