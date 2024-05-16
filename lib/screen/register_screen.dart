import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Stack(
          children: [
            Text("Welcome!",
              style: TextStyle(
                color: Color.fromRGBO(0x94, 0x6E, 0x54, 1.0),
                fontSize: 55,
              ),
            ),
            Text("Create a new account",
              style: TextStyle(
                color: Color.fromRGBO(0x94, 0x6E, 0x54, 1.0),
                fontSize: 20,
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Full Name",
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Username",
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "Phone Number",
              ),
            ),
            TextField(
              decoration: const InputDecoration(
                  labelText: "PassWord"
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 10,
              child: ElevatedButton(onPressed: () {}, child: Text("Sign Up"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(0xD9, 0xA2, 0x6C, 1.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),

                ),
              ),
            )

          ],

        ),
      ),
    );
  }
}
