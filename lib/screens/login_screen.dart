import 'package:assignment/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:assignment/components/custom_text_field.dart';
import 'package:assignment/components/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _loading = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _passwordError = '';

  // Fake user credentials
  final String _tempUsername = 'user';
  final String _tempPassword = 'password';

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1800), () {
      setState(() {
        _loading = false;
      });
    });
  }

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    String capitalize(String s) =>
        s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

    if (username == _tempUsername && password == _tempPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => HomeScreen(username: capitalize(username))),
      );
    } else {
      setState(() {
        _passwordError = 'Please enter the correct password';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_loading) {
      return Scaffold(
        backgroundColor: const Color(0xffEFF1F4),
        body: Center(
          child: LoadingAnimationWidget.halfTriangleDot(
            color: const Color.fromARGB(255, 39, 180, 180),
            size: 200,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: const Color(0xffEFF1F4),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/logo.png',
                      height: 100,
                      width: 100,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Padding(
                    padding: EdgeInsets.only(left: 45.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Let's Go",
                          style: TextStyle(
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF181636),
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Please enter your credentials to log in",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xff55555A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CustomTextField(
                      controller: _usernameController,
                      labelText: 'Enter Username',
                      hintText: 'eg. John Doe',
                      hasError: false,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: CustomTextField(
                      controller: _passwordController,
                      labelText: 'Enter Password',
                      hintText: 'eg. Password',
                      obscureText: true,
                      errorText: _passwordError.isEmpty ? null : _passwordError,
                      hasError: _passwordError.isNotEmpty,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Padding(
                    padding: EdgeInsets.only(right: 45),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            fontSize: 12,
                            letterSpacing: 0.4,
                            color: Color(0xff0461E5),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: CustomButton(
                      text: "Login",
                      onPressed: _login,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: RichText(
                      text: const TextSpan(
                        text: "Don’t have an account? ",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF55555A),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Sign up',
                            style: TextStyle(
                              fontFamily: 'Manrope',
                              color: Color(0xff0461E5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
