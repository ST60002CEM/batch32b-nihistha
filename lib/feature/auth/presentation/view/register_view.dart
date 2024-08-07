import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/entity/auth_entity.dart';
import '../view_model/auth_view_model.dart';

class RegisterView extends ConsumerStatefulWidget {
  const RegisterView({super.key});

  @override
  ConsumerState<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {

  final _key = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();


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
      body: SingleChildScrollView(
        child: Container(
          child: Column(
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
                        controller: _fullNameController,
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
                        validator: ((value){
                          if(value == null || value.isEmpty){
                            return "Please enter full name";
                          }
                          return null;
                        }),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _emailController,
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
                        validator: ((value){
                          if(value == null || value.isEmpty){
                            return "Please enter email";
                          }
                          return null;
                        }),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _phoneController,
                        decoration: InputDecoration(
                          labelText: 'Phone Number',
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
                        validator: ((value){
                          if(value == null || value.isEmpty){
                            return "Please enter Phone number";
                          }
                          return null;
                        }),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: 'Password',
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
                        validator: ((value){
                          if(value == null || value.isEmpty){
                            return "Please enter password";
                          }
                          return null;
                        }),
                      ),
                      // SizedBox(
                      //   height: 40,
                      // ),
                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: 'Confirm Password',
                      //     suffixIcon: Icon(
                      //       Icons.vpn_key,
                      //       size: 25,
                      //       color: Colors.black.withOpacity(0.7),
                      //     ),
                      //     enabledBorder: OutlineInputBorder(
                      //       borderSide: const BorderSide(
                      //         color: Color(0xFF946E54),
                      //         width: 1.5,
                      //         style: BorderStyle.solid,
                      //       ),
                      //     ),
                      //     border: OutlineInputBorder(
                      //       borderRadius: BorderRadius.all(Radius.circular(3)),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                          height: 40,
                          width: 130,
                          child: ElevatedButton(onPressed: (){
                            var user = AuthEntity(
                              fullname: _fullNameController.text,
                              email: _emailController.text,
                              phonenumber: _phoneController.text,
                              password: _passwordController.text,
                            );
                            ref
                                .read(authViewModelProvider.notifier)
                                .registerUser(user);
                          },

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
              SizedBox(width: 12), // Add some space between the text and the image
              Image.asset(
                'assets/images/google_logo.png', // Path to your Google logo
                height: 40, // Adjust the height as needed
              ),
            ],
          ),
        ),
      ),

    );
  }
}
