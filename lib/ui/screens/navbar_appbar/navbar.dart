import 'package:circle_nav_bar/circle_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/utils/app_color.dart';
import '../drawer/drawer.dart';
import 'account/account.dart';
import 'cart.dart';
import 'favorite.dart';
import 'home.dart';
import 'shop/shop.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const Home(),
      const Shop(),
      const Favorite(),
      const Cart(),
      const Account(),
    ];

    return Scaffold(
      drawer: DrawerScreen(),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: pages,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
      extendBody: true,
      bottomNavigationBar: CircleNavBar(
        activeIndex: _currentIndex,
        activeIcons: const [
          Icon(Icons.home, size: 30, color: AppColors.primaryColor),
          Icon(Icons.shopping_bag_rounded, size: 30, color: AppColors.primaryColor),
          Icon(Icons.favorite, size: 30, color: AppColors.primaryColor),
          Icon(Icons.shopping_cart, size: 30, color: AppColors.primaryColor),
          Icon(Icons.person, size: 30, color: AppColors.primaryColor),
        ],
        inactiveIcons: const [
          Icon(Icons.home, size: 30, color: AppColors.themeColor),
          Icon(Icons.shopping_bag, size: 30, color: AppColors.themeColor),
          Icon(Icons.favorite, size: 30, color: AppColors.themeColor),
          Icon(Icons.shopping_cart, size: 30, color: AppColors.themeColor),
          Icon(Icons.person, size: 30, color: AppColors.themeColor),
        ],
        color: AppColors.primaryColor,
        height: 60,
        circleWidth: 60,
        circleColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 6,
        padding: EdgeInsets.zero,
        cornerRadius: const BorderRadius.only(
          topLeft: Radius.circular(0),
          topRight: Radius.circular(0),
        ),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}