import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/screens/auth/forget_pass.dart';
import 'package:shob_bazaar/ui/screens/auth/sign_up.dart';
import 'package:shob_bazaar/ui/utils/app_color.dart';
import '../navbar_appbar/navbar.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Form(
          key: _formKey,
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
                        text: "SignIn Screen",
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
                alignment: Alignment(0, -.25),
                child: SizedBox(
                  width: w * 0.90,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: AppColors.primaryColor),
                      hintText: 'example@gmail.com',
                      labelText: 'Email',
                      labelStyle: TextStyle(color: AppColors.primaryColor),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      } else if (!RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$").hasMatch(value)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, 0),
                child: SizedBox(
                  width: w * 0.90,
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: AppColors.primaryColor),
                      hintText: 'Enter your password',
                      labelText: 'Password',
                      labelStyle: TextStyle(color: AppColors.primaryColor),
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 8 || value.length > 24) {
                        return 'Password must be at least 6 and maximum 24 characters long';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.85, 0.12),
                child: TextButton(
                  onPressed: () => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => ForgetPass())),
                  child: Text("Forget Password", style: TextStyle(color: AppColors.primaryColor)),
                ),
              ),
              Align(
                alignment: Alignment(0.0, 0.3),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(180, 50),
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: AppColors.themeColor,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => Navbar()));
                    }
                  },
                  child: Text("Log In", style: TextStyle(fontSize: 24)),
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
                child: Image.asset('assets/images/google.png', height: h * 0.10),
              ),
              Align(
                alignment: Alignment(0.0, 0.8),
                child: Image.asset('assets/images/apple.png', height: h * 0.10),
              ),
              Align(
                alignment: Alignment(0.5, 0.8),
                child: Image.asset('assets/images/facebook.png', height: h * 0.08),
              ),
              Align(
                alignment: Alignment(0, 0.9),
                child: TextButton(
                  onPressed: () => Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SignUp())),
                  child: Text("Don't Have an account?", style: TextStyle(color: AppColors.themeColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
