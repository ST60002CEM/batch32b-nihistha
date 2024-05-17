import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFAE0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          Text("Hi!",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 40,
              color: Color(0xFF946E54),
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(
            height: 5,
          ),
          Text("Create new account",
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF946E54),
            ),
          ),
          Padding(padding: const EdgeInsets.all(25),
            child:Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Full Name',
                      suffixIcon: Icon(
                        Icons.person,
                        size: 25,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF946E54),
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(
                        Icons.email,
                        size: 25,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF946E54),
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(
                        Icons.vpn_key,
                        size: 25,
                        color: Colors.black.withOpacity(0.7),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFF946E54),
                          width: 1.5,
                          style: BorderStyle.solid,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(3)),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Comfirm Password"
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                      height: 40,
                      width: 130,
                      child: ElevatedButton(onPressed: (){},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFD9A26C), // Background color
                          ),
                          child: Text("Sign in",
                            style: TextStyle(
                                color: Color(0xFFFEFAE0),
                                fontSize: 20
                            ),
                          )
                      )
                  ),
                ],
              ),
            ),

          ),

              Text("Or Sign up with google",
                style: TextStyle(
                    fontSize: 18
                ),
              ),
          //     GestureDetector(
          //       onTap: () {
          //         // Navigate to sign-up screen
          //         Navigator.push(
          //           context,
          //           MaterialPageRoute(builder: (_) => RegisterScreen()),
          //         );
          //       },
          //
          //
          // ),
        ],
      ),
    );
  }
}
