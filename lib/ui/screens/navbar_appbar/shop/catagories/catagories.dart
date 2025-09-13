import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/beauty_personalcare.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/books_stationary.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/electronics_gadget.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/fashion_clothing.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/groceries_food.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/health_wellness.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/home_living.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/sports_outdoor.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/toy_babies_product.dart';

import '../../../../utils/app_color.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  final List<Map<String, dynamic>> categories = const [
    {'title': 'Beauty & Personal Care', 'page': BeautyPersonalcare()},
    {'title': 'Books & Stationary', 'page': BooksStationary()},
    {'title': 'Electronics & Gadget', 'page': ElectronicsGadget()},
    {'title': 'Fashion & Clothing ', 'page': FashionClothing()},
    {'title': 'Groceries & Food', 'page': GroceriesFood()},
    {'title': 'Health & Wealth', 'page': HealthWellness()},
    {'title': 'Home & Living', 'page': HomeLiving()},
    {'title': 'Sports & Outdoor', 'page': SportsOutdoor()},
    {'title': 'Toy & Babies', 'page': ToyBabiesProduct()},
  ];

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: AppColors.themeColor,),
          ),
          title: const Text('Categories',style: TextStyle(color: AppColors.themeColor),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height:30,),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: AppColors.primaryColor,
                      elevation: 8,
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SizedBox(
                        height: 60,
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
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

