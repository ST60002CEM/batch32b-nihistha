import 'package:adoptapet/screen/register_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFAE0),
      appBar: AppBar(
        leading: Image.asset('assets/images/logo.png'),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Adopt',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'apet',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color(0xFFFEFAE0),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [


             Text("Welcome!",
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
          Text("Login to continue",
            style: TextStyle(
              fontSize: 22,
              color: Color(0xFF946E54),
            ),
          ),
          Padding(padding: const EdgeInsets.all(30),
              child:Form(
                child: Column(
                  children: [
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
                      height: 30,
                    ),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        labelText: 'Password',

                        suffixIcon: Icon(
                          Icons.vpn_key_rounded,
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
                      height: 30,
                    ),
                    SizedBox(
                      height: 50,
                      width: 100,
                        child: ElevatedButton(onPressed: (){},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFFD9A26C), // Background color
                            ),
                            child: Text("Login",
                              style: TextStyle(
                                color: Color(0xFFFEFAE0),
                                fontSize: 20
                              ),
                            )
                        )
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?",
                          style: TextStyle(
                            fontSize: 18
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to sign-up screen
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => RegisterScreen()),
                            );
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Color(0xFFD9A26C),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],

                ),
            ),
          ),

        ],
      ),
    );
  }
}

