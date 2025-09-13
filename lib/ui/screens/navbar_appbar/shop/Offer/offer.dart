import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../widget/card.dart';

// Provider to manage List/Grid toggle
class ViewModeProvider extends ChangeNotifier {
  bool isListView = true;

  void toggleView() {
    isListView = !isListView;
    notifyListeners();
  }
}

class OfferScreen extends StatelessWidget {
  const OfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ViewModeProvider(),
      child: DefaultTabController(
        length: 7, // Number of tabs
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Offers"),
            actions: [
              IconButton(
                icon: const Icon(Icons.swap_vert),
                onPressed: () {
                  Provider.of<ViewModeProvider>(context, listen: false).toggleView();
                },
              ),
            ],
            bottom: const TabBar(
              isScrollable: true,
              tabs: [
                Tab(text: "Free Delivery"),
                Tab(text: "Flash Sell"),
                Tab(text: "Buy Get"),
                Tab(text: "Must Buy"),
                Tab(text: "Best Price"),
                Tab(text: "Mega Discount"),
                Tab(text: "Free Gift"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              OfferTab(),
              OfferTab(),
              OfferTab(),
              OfferTab(),
              OfferTab(),
              OfferTab(),
              OfferTab(),
            ],
          ),
        ),
      ),
    );
  }
}

class OfferTab extends StatelessWidget {
  const OfferTab({super.key});

  @override
  Widget build(BuildContext context) {
    bool isListView = Provider.of<ViewModeProvider>(context).isListView;
    List<Map<String, String>> products = [
      {"image": "assets/sample.jpg", "name": "Product 1", "price": "\$20"},
      {"image": "assets/sample.jpg", "name": "Product 2", "price": "\$35"},
      {"image": "assets/sample.jpg", "name": "Product 3", "price": "\$50"},
    ];

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isListView
          ? ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            imageUrl: products[index]["image"]!,
            name: products[index]["name"]!,
            price: products[index]["price"]!,
            isList: true,
          );
        },
      )
          : GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 0.8,
        ),
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductCard(
            imageUrl: products[index]["image"]!,
            name: products[index]["name"]!,
            price: products[index]["price"]!,
            isList: false,
          );
        },
      ),
    );
  }
}
