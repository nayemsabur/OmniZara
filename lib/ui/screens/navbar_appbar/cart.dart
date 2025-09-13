import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/screens/drawer/drawer.dart';

import '../../utils/app_color.dart';
import '../../widget/notification_screen.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: DrawerScreen(),
        backgroundColor: AppColors.themeColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          iconTheme: IconThemeData(color: AppColors.themeColor),
          actions: [IconButton(
            icon: const Icon(Icons.notifications, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),],
        ),
        body: SingleChildScrollView(),
      ),
    );
  }
}
