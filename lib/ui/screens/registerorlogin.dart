import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/screens/auth/sign_up.dart';
import 'package:shob_bazaar/ui/utils/app_color.dart';

import '../widget/background_screen_one.dart';
import 'auth/sign_in.dart';

class Registerorlogin extends StatefulWidget {
  const Registerorlogin({super.key});

  @override
  State<Registerorlogin> createState() => _RegisterorloginState();
}

class _RegisterorloginState extends State<Registerorlogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Stack(
            children: [
              BackgroundScreenOne(),
              Align(
                alignment: Alignment(0, -0.9),
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
                        text: "Shob Bazaar",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.themeColor,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Align( alignment: Alignment(0.0, -0.2),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 50),
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.white
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignIn())
                    );
                  },
                  child: Text("Log In",style: TextStyle(fontSize: 24),),
                ),
              ),
              Align( alignment: Alignment(0.0, -0.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(250, 50),
                    side: BorderSide(color: AppColors.primaryColor),
                    foregroundColor: AppColors.primaryColor,
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp())
                    );
                  },
                  child: Text("SIgn Up",style: TextStyle(fontSize: 24),),
                ),
              ),
              Align(alignment: Alignment(0.0, 0.25),
              child: Image.asset('assets/images/Vector8.png'),)
            ],
          ),
        )
    );
  }
}
