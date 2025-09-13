import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/screens/auth/sign_in.dart';

import '../../utils/app_color.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
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
            Align(
              alignment: Alignment(-.9, -.9),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),iconSize: 40,
                color: AppColors.themeColor,
              ),
            ),
            Align(alignment: Alignment(00, -.2),
              child: SizedBox(
                width: w*.90,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    hintText: 'New password',
                    labelText: 'Password',
                    labelStyle: TextStyle(color: AppColors.primaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
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
                  ),
                ),

              ),
            ),
            Align(alignment: Alignment(00, 0),
              child: SizedBox(
                width: w*.90,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    hintText: 'ReEnter Password',
                    labelText: 'Password',
                    labelStyle: TextStyle(color: AppColors.primaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
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
                  ),
                ),

              ),
            ),
            Align( alignment: Alignment(0.0, 0.3),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 50),
                  backgroundColor:AppColors.primaryColor,
                  foregroundColor: AppColors.themeColor,
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn())
                  );
                },
                child: Text("Confirm",style: TextStyle(fontSize: 24),),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset('assets/images/Vector1.png'),
            ),
          ],
        ),
      ),
    );
  }
}
