import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shob_bazaar/ui/screens/auth/reset_password.dart';
import '../../utils/app_color.dart';

class GetCode extends StatefulWidget {
  const GetCode({super.key});

  @override
  State<GetCode> createState() => _GetCodeState();
}

class _GetCodeState extends State<GetCode> {
  TextEditingController pinController = TextEditingController();

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
            Align(
              alignment: Alignment(0.0, -0.1),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: pinController,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.fade,
                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 60,
                    fieldWidth: 50,
                    activeFillColor: AppColors.themeColor,
                    selectedFillColor: AppColors.themeColor,
                    inactiveFillColor: AppColors.errorColor,
                    activeColor: AppColors.primaryColor,
                    selectedColor: AppColors.primaryColor,
                    inactiveColor: AppColors.primaryColor,
                  ),
                  animationDuration: Duration(milliseconds: 300),
                  enableActiveFill: true,
                  onCompleted: (value) {
                    print("Entered PIN: $value");
                  },
                  onChanged: (value) {},
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.0, 0.1),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(180, 50),
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: AppColors.themeColor,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPassword()),
                  );
                },
                child: Text(
                  "Continue",
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
