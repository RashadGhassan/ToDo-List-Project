import 'package:flutter/material.dart';
import 'package:to_do_list/widgets/drawer.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: DrawerWidget(),
    );
  }
}
