import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/account/delivery_address.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/account/my_order.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/account/payment_method.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/account/personal_details.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/account/settings.dart';

import '../../../utils/app_color.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Personal Details', 'page':  PersonalDetailsScreen()},
    {'title': 'Settings', 'page':  SettingsScreen()},
    {'title': 'Payment Method', 'page':  PaymentMethodScreen()},
    {'title': 'Delivery Address', 'page': DeliveryAddressScreen()},
    {'title': 'My Order', 'page': const MyOrder()},
  ];

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image.asset('assets/images/Vector5.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: AppColors.primaryColor,
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          title: Text(
                            categories[index]['title'],
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                          onTap: () => _navigateToPage(context, categories[index]['page']),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}