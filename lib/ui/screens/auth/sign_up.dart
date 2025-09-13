import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/utils/app_color.dart';
import 'sign_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? _nameError;
  String? _emailError;
  String? _mobileError;
  String? _passwordError;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/Vector.png'),
            ),
            Align(
              alignment: Alignment(0, -0.85),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Welcome\n",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.themeColor,
                      ),
                    ),
                    TextSpan(
                      text: "To\n",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.themeColor,
                      ),
                    ),
                    TextSpan(
                      text: "SignUp Screen",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: AppColors.themeColor,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment(-.9, -.9),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
                iconSize: 40,
                color: AppColors.themeColor,
              ),
            ),
            Align(
              alignment: Alignment(0, -.32),
              child: SizedBox(
                width: w * .90,
                height: h * .08,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    hintText: 'your full name',
                    labelText: 'Name',
                    labelStyle: TextStyle(color: AppColors.primaryColor),
                    errorText: _nameError,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -.15),
              child: SizedBox(
                width: w * .90,
                height: h * .08,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    hintText: 'example@mail.com',
                    labelText: 'Email',
                    labelStyle: TextStyle(color: AppColors.primaryColor),
                    errorText: _emailError,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, .02),
              child: SizedBox(
                width: w * .90,
                height: h * .08,
                child: TextField(
                  controller: _mobileController,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    hintText: '+123 456 789',
                    labelText: 'Mobile',
                    labelStyle: TextStyle(color: AppColors.primaryColor),
                    errorText: _mobileError,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, .19),
              child: SizedBox(
                width: w * .90,
                height: h * .08,
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    hintText: '@&#faAs56',
                    labelText: 'Enter a password',
                    labelStyle: TextStyle(color: AppColors.primaryColor),
                    errorText: _passwordError,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
              ),
            ),
            // Sign Up Button
            Align(
              alignment: Alignment(0.0, 0.38),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 50),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.themeColor,
                ),
                onPressed: () {
                  setState(() {
                    _nameError = _emailError = _mobileError = _passwordError = null;
                    if (_nameController.text.isEmpty) {
                      _nameError = 'Please enter your name';
                    }
                    if (_emailController.text.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(_emailController.text)) {
                      _emailError = 'Please enter a valid email';
                    }
                    if (_mobileController.text.isEmpty ||
                        !RegExp(r"^\+?[0-9]{10,15}$").hasMatch(_mobileController.text)) {
                      _mobileError = 'Please enter a valid mobile number';
                    }
                    if (_passwordController.text.isEmpty ||
                        _passwordController.text.length < 6) {
                      _passwordError = 'Password must be at least 6 characters';
                    }

                    if (_nameError == null &&
                        _emailError == null &&
                        _mobileError == null &&
                        _passwordError == null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn()),
                      );
                    }
                  });
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/Vector1.png'),
            ),
            Align(
              alignment: Alignment(0, 0.6),
              child: Text("Sign In with social account"),
            ),
            Align(
              alignment: Alignment(-0.5, 0.8),
              child: Image.asset(
                'assets/images/google.png',
                height: h * .10,
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.8),
              child: Image.asset('assets/images/apple.png', height: h * .10),
            ),
            Align(
              alignment: Alignment(0.5, 0.8),
              child: Image.asset(
                'assets/images/facebook.png',
                height: h * .08,
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.9),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SignIn()));
                },
                child: Text(
                  "You Have already account?",
                  style: TextStyle(color: AppColors.themeColor),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
