import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/screens/auth/sign_in.dart';
import 'package:shob_bazaar/ui/screens/drawer/about_us.dart';
import 'package:shob_bazaar/ui/screens/drawer/help.dart';
import 'package:shob_bazaar/ui/screens/drawer/order%20history.dart';
import 'package:shob_bazaar/ui/screens/drawer/review.dart';
import 'package:shob_bazaar/ui/screens/drawer/support.dart';
import 'package:shob_bazaar/ui/utils/app_color.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: AppColors.primaryColor,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            child: const Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/logo.png'),
                  radius: 50,
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.history),
            title: const Text("Order History"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderHistory()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.support),
            title: const Text("Support"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Support()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.reviews),
            title: const Text("Review"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Review()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text("Help"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Help()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About Us"),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>AboutUs()));
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout"),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignIn()),
                    (Route<dynamic> route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}