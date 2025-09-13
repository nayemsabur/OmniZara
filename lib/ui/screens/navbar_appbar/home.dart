import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shob_bazaar/ui/utils/app_color.dart';
import '../../widget/notification_screen.dart';
import '../../widget/search_bar.dart';
import '../drawer/drawer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> _imageList = [
    'assets/images/product.jpeg',
    'assets/images/product1.jpeg',
    'assets/images/product2.jpeg',
  ];

  List<String> _suggestions = [];
  String _searchQuery = '';
  bool _isLoading = false;
  final TextEditingController _searchController = TextEditingController();

  // Local List for Testing
  final List<String> _localProducts = [
    'Laptop',
    'Laptop Bag',
    'Laptop Stand',
    'Headphones',
    'Headset',
    'Mouse',
    'Keyboard',
    'Smartphone',
    'Smartwatch',
    'Tablet',
  ];

  Future<void> _fetchProducts(String query) async {
    if (query.isEmpty) {
      setState(() {
        _suggestions = [];
      });
      return;
    }

    setState(() {
      _suggestions = _localProducts
          .where((product) => product.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });

    // Uncomment this section to fetch from an actual API
    /*
    final url = 'https://';
    setState(() => _isLoading = true);

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        List<String> fetchedProducts = List<String>.from(data['products']);

        setState(() {
          _suggestions = fetchedProducts;
        });
      } else {
        setState(() => _suggestions = []);
        print("Failed to load products");
      }
    } catch (e) {
      setState(() => _suggestions = []);
      print("Error occurred: $e");
    } finally {
      setState(() => _isLoading = false);
    }
    */
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
    });

    _fetchProducts(query);
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        drawer: DrawerScreen(),
        backgroundColor: AppColors.themeColor,
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          iconTheme: IconThemeData(color: AppColors.themeColor),
          actions: [
            ReuseableSearchBar(
              controller: _searchController,
              onChanged: _onSearchChanged,
              suggestions: _suggestions,
              backgroundColor: AppColors.secondaryColor,
              textColor: Colors.white,
              iconColor: Colors.white,
              expandedWidth: MediaQuery.of(context).size.width * 0.9,
            ),
            IconButton(
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
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 20),

                const SizedBox(height: 10),
                _buildSuggestions(),
                const SizedBox(height: 20),
                _buildCarousel(h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSuggestions() {
    if (_isLoading) {
      return const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircularProgressIndicator(color: Colors.white),
      );
    }

    if (_suggestions.isEmpty) return const SizedBox(); // Hide if no suggestions

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        height: _suggestions.length > 5 ? 200 : _suggestions.length * 40.0, // Max height
        child: SingleChildScrollView(
          child: Column(
            children: _suggestions.map((product) {
              return ListTile(
                title: Text(product, style: const TextStyle(color: Colors.white)),
                onTap: () {
                  _searchController.text = product; // Autofill search bar
                  setState(() {
                    _suggestions = []; // Hide suggestions after selection
                  });
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCarousel(double h) {
    return CarouselSlider(
      options: CarouselOptions(
        height: h * .7, // Adjusted height for better UI
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 3000),
        enlargeCenterPage: true,
        viewportFraction: 0.9,
      ),
      items: _imageList.map((item) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(item, fit: BoxFit.cover, height: h * .4, width: double.infinity),
        );
      }).toList(),
    );
  }
}
