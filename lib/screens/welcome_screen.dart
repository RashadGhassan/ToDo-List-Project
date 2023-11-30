import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD2D6D8),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 80),
            Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ToDo",
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff187585),
                      ),
                    ),
                    Text(
                      "Sync",
                      style: TextStyle(
                        fontSize: 56,
                        fontWeight: FontWeight.w300,
                        color: Color(0xff0b2e35),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  child: Image.asset("assets/images/welcome.png"),
                  height: 150,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/loginPage");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Login",
                        style: myStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, "/registrationPage");
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Text(
                        "Register",
                        style: myStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

TextStyle myStyle = TextStyle(
  fontSize: 24,
);
