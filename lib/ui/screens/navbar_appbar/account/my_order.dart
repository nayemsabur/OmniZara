import 'package:flutter/material.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({super.key});

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  final List<Map<String, dynamic>> orders = [
    {
      "id": "#123456",
      "name": "Burger Combo",
      "image": "https://via.placeholder.com/150",
      "price": "\$45.99",
      "status": "Awaiting Payment",
    },
    {
      "id": "#123457",
      "name": "Pizza Feast",
      "image": "https://via.placeholder.com/150",
      "price": "\$28.50",
      "status": "Preparing to Ship",
    },
    {
      "id": "#123458",
      "name": "Sushi Platter",
      "image": "https://via.placeholder.com/150",
      "price": "\$60.00",
      "status": "On the Move",
    },
    {
      "id": "#123459",
      "name": "Pasta Meal",
      "image": "https://via.placeholder.com/150",
      "price": "\$35.00",
      "status": "Almost There",
    },
    {
      "id": "#123460",
      "name": "Fried Chicken",
      "image": "https://via.placeholder.com/150",
      "price": "\$20.00",
      "status": "Ready for Review",
    },
    {
      "id": "#123461",
      "name": "Ice Cream",
      "image": "https://via.placeholder.com/150",
      "price": "\$10.00",
      "status": "Ready for Review",
    },
  ];

  // List of categories with creative names
  final List<Map<String, dynamic>> categories = [
    {
      "name": "Awaiting Payment",
      "icon": Icons.payment,
      "color": Colors.orange,
    },
    {
      "name": "Preparing to Ship",
      "icon": Icons.local_shipping,
      "color": Colors.blue,
    },
    {
      "name": "On the Move",
      "icon": Icons.directions_bus,
      "color": Colors.purple,
    },
    {
      "name": "Almost There",
      "icon": Icons.assignment_turned_in,
      "color": Colors.green,
    },
    {
      "name": "Ready for Review",
      "icon": Icons.star,
      "color": Colors.yellow[700]!,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Orders"),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Column(
        children: [
          // Horizontal Scrollable Category Section
          SizedBox(
            height: 120, // Fixed height for the horizontal section
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return GestureDetector(
                  onTap: () {

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryOrderPage(
                          categoryName: category["name"],
                          orders: orders
                              .where((order) => order["status"] == category["name"])
                              .toList(),
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: category["color"],
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(category["icon"], color: Colors.white, size: 30),
                          SizedBox(height: 10),
                          Text(
                            category["name"],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two items per row
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 0.8, // Adjust the aspect ratio
              ),
              itemCount: orders.length,
              itemBuilder: (context, index) {
                final order = orders[index];
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            order["image"],
                            height: 100,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height: 10),
                        // Order Name
                        Text(
                          order["name"],
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        // Order Price
                        Text(
                          order["price"],
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[700],
                          ),
                        ),
                        SizedBox(height: 10),
                        // Order Status
                        Row(
                          children: [
                            Icon(
                              _getStatusIcon(order["status"]),
                              color: _getStatusColor(order["status"]),
                              size: 14,
                            ),
                            SizedBox(width: 5),
                            Text(
                              order["status"],
                              style: TextStyle(
                                fontSize: 12,
                                color: _getStatusColor(order["status"]),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }


  IconData _getStatusIcon(String status) {
    switch (status) {
      case "Awaiting Payment":
        return Icons.payment;
      case "Preparing to Ship":
        return Icons.local_shipping;
      case "On the Move":
        return Icons.directions_bus;
      case "Almost There":
        return Icons.assignment_turned_in;
      case "Ready for Review":
        return Icons.star;
      default:
        return Icons.help_outline;
    }
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case "Awaiting Payment":
        return Colors.orange;
      case "Preparing to Ship":
        return Colors.blue;
      case "On the Move":
        return Colors.purple;
      case "Almost There":
        return Colors.green;
      case "Ready for Review":
        return Colors.yellow[700]!;
      default:
        return Colors.grey;
    }
  }
}


class CategoryOrderPage extends StatelessWidget {
  final String categoryName;
  final List<Map<String, dynamic>> orders;

  const CategoryOrderPage({
    required this.categoryName,
    required this.orders,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Two items per row
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: 0.8, // Adjust the aspect ratio
        ),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Order Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      order["image"],
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Order Name
                  Text(
                    order["name"],
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  // Order Price
                  Text(
                    order["price"],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                  ),
                  SizedBox(height: 10),
                  // Order Status
                  Row(
                    children: [
                      Icon(
                        _getStatusIcon(order["status"]),
                        color: _getStatusColor(order["status"]),
                        size: 14,
                      ),
                      SizedBox(width: 5),
                      Text(
                        order["status"],
                        style: TextStyle(
                          fontSize: 12,
                          color: _getStatusColor(order["status"]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }


  IconData _getStatusIcon(String status) {
    switch (status) {
      case "Awaiting Payment":
        return Icons.payment;
      case "Preparing to Ship":
        return Icons.local_shipping;
      case "On the Move":
        return Icons.directions_bus;
      case "Almost There":
        return Icons.assignment_turned_in;
      case "Ready for Review":
        return Icons.star;
      default:
        return Icons.help_outline;
    }
  }


  Color _getStatusColor(String status) {
    switch (status) {
      case "Awaiting Payment":
        return Colors.orange;
      case "Preparing to Ship":
        return Colors.blue;
      case "On the Move":
        return Colors.purple;
      case "Almost There":
        return Colors.green;
      case "Ready for Review":
        return Colors.yellow[700]!;
      default:
        return Colors.grey;
    }
  }
}