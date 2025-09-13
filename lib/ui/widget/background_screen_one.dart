import 'package:flutter/material.dart';

class BackgroundScreenOne extends StatefulWidget {
  const BackgroundScreenOne({super.key});

  @override
  State<BackgroundScreenOne> createState() => _BackgroundScreenOneState();
}

class _BackgroundScreenOneState extends State<BackgroundScreenOne> {
  @override
  Widget build(BuildContext context) {
    var w= MediaQuery.of(context).size.width;
    return Scaffold(
        body: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Image.asset('assets/images/Vector3.png',width: w*1,),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.asset('assets/images/Vector4.png'),
              ),
            ],
          ),
        )
    );
  }
}
