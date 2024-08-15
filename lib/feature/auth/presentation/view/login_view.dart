import 'package:adoptapet/feature/home/presentation/view/home.dart';
import 'package:adoptapet/feature/home/presentation/view/home_view.dart';
import 'package:adoptapet/feature/root/presentation/view/root_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/common/biometric_auth.dart';
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

  static const Color themeColor = Color(0xFF84D5D8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40),
              _buildWelcomeText(),
              SizedBox(height: 40),
              _buildLoginForm(),
              SizedBox(height: 24),
              _buildRegisterButton(),
              SizedBox(height: 24),
              _buildBiometricButton(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Image.asset('assets/images/logo.png'),
      ),
      title: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'Adopt',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            TextSpan(
              text: 'apet',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: themeColor,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Text(
          "Welcome!",
          style: TextStyle(
            fontSize: 32,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          "Login to continue",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }

  Widget _buildLoginForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildTextField(
            controller: _emailController,
            label: 'Email',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: 24),
          _buildTextField(
            controller: _passwordController,
            label: 'Password',
            icon: Icons.lock,
            obscureText: isObscure,
            suffixIcon: IconButton(
              icon: Icon(
                isObscure ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  isObscure = !isObscure;
                });
              },
            ),
          ),
          SizedBox(height: 32),
          _buildLoginButton(),
        ],
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: themeColor),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: themeColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: themeColor, width: 2),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'This field is required';
        }
        return null;
      },
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            await ref.read(authViewModelProvider.notifier).loginUser(
              _emailController.text,
              _passwordController.text,
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: themeColor,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(
          "Login",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
        TextButton(
          onPressed: () {
            ref.read(authViewModelProvider.notifier).openRegisterView();
          },
          child: Text(
            'Register',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: themeColor,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBiometricButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(Icons.fingerprint),
        label: Text('Login with Biometrics'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey[200],
          foregroundColor: Colors.black87,
          padding: EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () async {
          final authenticate = await BiometricAuth.authenticateWithBiometrics();
          if (authenticate) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const RootApp(),
              ),
            );
          }
        },
      ),
    );
  }
}