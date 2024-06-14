import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../view_model/auth_view_model.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFAE0),
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0), // Add padding to the left
          child: Image.asset('assets/images/logo.png'),
        ),
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'Adopt',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: 'apet',
                style: TextStyle(
                  fontSize: 20,
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
                    key: const ValueKey('email'),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
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
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter email';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    key: const ValueKey('password'),
                    controller: _passwordController,
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
                    validator: ((value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter password';
                      }
                      return null;
                    }),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                      height: 50,
                      width: 100,
                      child: ElevatedButton(onPressed: ()async{

                          await ref
                              .read(authViewModelProvider.notifier)
                              .loginUser(
                            _emailController.text,
                            _passwordController.text,
                          );

                      },
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
                      ElevatedButton(
                        key: const ValueKey('registerButton'),
                        onPressed: () {
                          ref
                              .read(authViewModelProvider.notifier)
                              .openRegisterView();
                        },
                        child: const SizedBox(
                          height: 50,
                          child: Center(
                            child: Text(
                              'Register',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Brand Bold',
                              ),
                            ),
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
