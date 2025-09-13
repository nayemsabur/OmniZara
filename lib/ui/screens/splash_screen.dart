import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/screens/registerorlogin.dart'; // Import your Registerorlogin screen
import 'package:shob_bazaar/ui/utils/app_color.dart';
import '../widget/background_screen_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(const Duration(seconds: 5)); // 2-second delay
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Registerorlogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackgroundScreenOne(),
          Align(
            alignment: Alignment.center,
            child: Image.asset("assets/images/Vector8.png"),
          ),
          Align(
            alignment: Alignment(0.0, 0.20),
            child: Text(
              "Buy Smartly Buy Genuine",
              style: TextStyle(fontSize: 24, color: AppColors.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}
