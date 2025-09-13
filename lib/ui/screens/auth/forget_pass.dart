import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import 'get_code.dart';

class ForgetPass extends StatefulWidget {
  const ForgetPass({super.key});

  @override
  State<ForgetPass> createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPass> {
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
              alignment: Alignment(0.0, -.7),
              child: Image.asset('assets/images/Group.png'),
            ),
            Align(
              alignment: Alignment(-1, -.25),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: "Please Enter your ",
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.textColor,
                  ),
                  children: [
                    TextSpan(
                      text: "Email or Phone Number",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    TextSpan(
                      text: " to Receive a Verification Code",
                    ),
                  ],
                ),
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
            Align(
              alignment: Alignment(00, 00),
              child: SizedBox(
                width: w * .90,
                child: TextFormField(
                  decoration: InputDecoration(
                    hintStyle: TextStyle(color: AppColors.primaryColor),
                    hintText: 'Enter your account email or phone',
                    labelText: 'Email or phone',
                    labelStyle: TextStyle(color: AppColors.primaryColor),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: AppColors.primaryColor, width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2),
                    ),
                    errorBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => GetCode()));
                },
                child: Text(
                  "Get Code",
                  style: TextStyle(fontSize: 24),
                ),
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
