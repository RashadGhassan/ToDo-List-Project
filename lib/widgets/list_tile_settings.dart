import 'package:flutter/material.dart';

class ListTileSetting extends StatelessWidget {
  const ListTileSetting(
      {super.key, required this.text, required this.routeName});
  final String text;
  final String routeName;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      title: Text(
        text,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
