import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/screens/drawer/drawer.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/Offer/offer.dart';
import 'package:shob_bazaar/ui/screens/navbar_appbar/shop/catagories/catagories.dart';
import '../../../utils/app_color.dart';
import '../../../widget/card.dart';
import '../../../widget/notification_screen.dart';
import '../../../widget/search_bar.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  final List<String> _imageList = [
    'assets/images/products.jpeg',
    'assets/images/products1.jpeg',
    'assets/images/products2.jpeg',
  ];

  final List<Map<String, dynamic>> _products = [
    {
      'image': 'assets/images/product.jpeg',
      'name': 'Product 1',
      'price': '\$20.00',
    },
    {
      'image': 'assets/images/product1.jpeg',
      'name': 'Product 2',
      'price': '\$25.00',
    },
    {
      'image': 'assets/images/product2.jpeg',
      'name': 'Product 3',
      'price': '\$30.00',
    },
  ];

  final TextEditingController _searchController = TextEditingController();

  void _navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildButton('Categories', () => _navigateToPage(context, const Categories())),
                  _buildButton('Offer', () => _navigateToPage(context, const OfferScreen())),
                ],
              ),
              const SizedBox(height: 20),
              ReuseableSearchBar(
                controller: _searchController,
                onChanged: (query) {
                  print("Searching for: \$query");
                },
                hintText: "Search products...",
                suggestions: const [],
                textColor: AppColors.themeColor,
                iconColor: AppColors.themeColor,
                backgroundColor: AppColors.secondaryColor,
              ),
              const SizedBox(height: 20),
              _buildCarousel(h,w),
              const SizedBox(height: 20),
              _buildProductGrid('Trending Products', h, w),
              const SizedBox(height: 20),
              _buildProductGrid('Best Sellers', h, w),
              const SizedBox(height: 20),
              _buildProductGrid('New Arrivals', h, w),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButton(String text, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 170,
        child: Card(
          color: AppColors.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 35),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppColors.themeColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel(double h ,double w) {
    return CarouselSlider(
      options: CarouselOptions(
        height: h * .25,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 3000),
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items: _imageList.map((item) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(item, fit: BoxFit.cover, width: double.infinity),
        );
      }).toList(),
    );
  }

  Widget _buildProductGrid(String title, double h, double w) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.textColor,
            ),
          ),
          const SizedBox(height: 10),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _products.map((product) {
                return ProductCard(
                  imageUrl: product['image'],
                  name: product['name'],
                  price: product['price'],
                  cardHeight: h * 0.3,
                  cardWidth: w * 0.4,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}