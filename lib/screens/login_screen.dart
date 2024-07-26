import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

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

  // Temporary user credentials
  final String _tempUsername = 'user';
  final String _tempPassword = 'password';

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200), () {
      setState(() {
        _loading = false;
      });
    });
  }

  void _login() {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();

    if (username == _tempUsername && password == _tempPassword) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const NextPage()),
      );
    } else {
      setState(() {
        _passwordError = 'Please Enter correct password';
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
                            color: Color(0xFF181636),
                            fontWeight: FontWeight.w800,
                            letterSpacing: .25,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Please enter your credentials to log in",
                          style: TextStyle(
                            color: Color(0xff55555A),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Enter Username",
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.5,
                                fontFamily: 'Manrope',
                                color: Color(0xff55555A),
                              ),
                            ),
                            SizedBox(height: 8),
                            TextField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "eg. John Doe",
                                hintStyle: TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 16,
                                  letterSpacing: 0.15,
                                  color: Color(0xffA3A2AF),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Enter Password",
                              style: TextStyle(
                                fontSize: 16,
                                letterSpacing: 0.5,
                                fontFamily: 'Manrope',
                                color: Color(0xff55555A),
                              ),
                            ),
                            TextField(
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 0,
                                  vertical: 0,
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(16),
                                  ),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: "eg. Password",
                                hintStyle: const TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 16,
                                  letterSpacing: 0.15,
                                  color: Color(0xffA3A2AF),
                                ),
                                errorText: _passwordError.isEmpty
                                    ? null
                                    : _passwordError,
                              ),
                            ),
                          ],
                        ),
                      ),
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
                            fontFamily: 'Manrope',
                            fontSize: 12,
                            letterSpacing: 0.4,
                            color: Color(0xff0461E5),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Center(
                    child: Container(
                      width: 310,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xff0461E5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: TextButton(
                        onPressed: _login,
                        style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          backgroundColor: const Color(0xff0461E5),
                        ),
                        child: const Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: 'Manrope',
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0.1,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: RichText(
                      text: const TextSpan(
                        text: "Don’t have an account? ",
                        style: TextStyle(
                          fontFamily: 'Manrope',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          color: Color(0xFF55555A),
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: 'sign up',
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

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Next Page')),
      body: Text("aao"),
    );
  }
}
