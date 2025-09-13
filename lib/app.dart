import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/screens/Item/details_item.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/navbar.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/beauty_personalcare.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/catagories.dart';
import 'package:shob_bazaar/ui/screens/splash_screen.dart';
import 'ui/screens/drawer/about_us.dart';

class ShobBazaar extends StatelessWidget {
  const ShobBazaar({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navbar(),
    );
  }
}
