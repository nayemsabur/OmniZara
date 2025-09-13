import 'package:flutter/material.dart';
import '../../../../utils/app_color.dart';
import '../../../../widget/card.dart';
import '../../../../widget/search_bar.dart';
import '../../home.dart';
import '../../navbar.dart';

class FashionClothing extends StatefulWidget {
  const FashionClothing({super.key});

  @override
  State<FashionClothing> createState() => _FashionClothingState();
}

class _FashionClothingState extends State<FashionClothing> with SingleTickerProviderStateMixin {
  bool isGridView = true;
  late TabController _tabController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  final List<Map<String, String>> products = [
    {"name": "Face Cleanser", "price": "\$15", "image": "assets/images/product1.jpeg"},
    {"name": "Shampoo", "price": "\$20", "image": "assets/images/product2.jpeg"},
    {"name": "Lipstick", "price": "\$10", "image": "assets/images/products.jpeg"},
    {"name": "Perfume", "price": "\$35", "image": "assets/images/product.jpeg"},
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  Navbar()
              ));
            }, icon: Icon(Icons.home,color: AppColors.themeColor,))
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: AppColors.themeColor),
          ),
          title: const Text("Fashion & Clothing", style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          elevation: 5, // AppBar shadow
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50), // TabBar height
            child: Material(
              elevation: 20, // Adds shadow below TabBar
              color: AppColors.primaryColor,
              child: TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                indicator: BoxDecoration(
                    color: AppColors.themeColor
                ),
                controller: _tabController,
                isScrollable: true,
                indicatorColor: AppColors.secondaryColor,
                indicatorWeight: 3,
                labelColor: AppColors.primaryColor,
                unselectedLabelColor: AppColors.themeColor,
                labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(text: 'All'),
                  Tab(text: 'Skincare'),
                  Tab(text: 'Haircare'),
                  Tab(text: 'Makeup'),
                  Tab(text: 'Fragrances'),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 10),
            ReuseableSearchBar(
              controller: _searchController,
              onChanged: (query) {},
              suggestions: const [],
              backgroundColor: AppColors.secondaryColor,
              textColor: AppColors.themeColor,
              iconColor: AppColors.themeColor,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: List.generate(_tabController.length, (index) => _buildProductView()),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductView() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isGridView ? _buildGridView() : _buildListView(),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      itemCount: products.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 0.75,
      ),
      itemBuilder: (context, index) {
        return ProductCard(
          imageUrl: products[index]['image']!,
          name: products[index]['name']!,
          price: products[index]['price']!,
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCard(
          imageUrl: products[index]['image']!,
          name: products[index]['name']!,
          price: products[index]['price']!,
          isList: true,
        );
      },
    );
  }
}
