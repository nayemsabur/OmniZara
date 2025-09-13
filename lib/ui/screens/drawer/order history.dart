import 'package:flutter/material.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final List<Map<String, dynamic>> orders = [
    {
      "orderId": "#123456",
      "date": "March 8, 2025",
      "time": "10:30 AM",
      "total": "\$45.99",
      "status": "Delivered",
      "items": [
        {"name": "Burger", "price": "\$10.99", "image": "https://via.placeholder.com/150"},
        {"name": "Fries", "price": "\$5.99", "image": "https://via.placeholder.com/150"},
        {"name": "Soda", "price": "\$3.99", "image": "https://via.placeholder.com/150"},
      ],
    },
    {
      "orderId": "#123457",
      "date": "March 5, 2025",
      "time": "02:15 PM",
      "total": "\$28.50",
      "status": "Cancelled",
      "items": [
        {"name": "Pizza", "price": "\$15.00", "image": "https://via.placeholder.com/150"},
        {"name": "Garlic Bread", "price": "\$5.50", "image": "https://via.placeholder.com/150"},
        {"name": "Water", "price": "\$2.00", "image": "https://via.placeholder.com/150"},
      ],
    },
    {
      "orderId": "#123458",
      "date": "March 1, 2025",
      "time": "07:45 PM",
      "total": "\$60.00",
      "status": "Processing",
      "items": [
        {"name": "Sushi", "price": "\$30.00", "image": "https://via.placeholder.com/150"},
        {"name": "Miso Soup", "price": "\$10.00", "image": "https://via.placeholder.com/150"},
        {"name": "Green Tea", "price": "\$5.00", "image": "https://via.placeholder.com/150"},
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Order History"),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildOrderSection("Processing", Colors.orange),
              _buildOrderSection("Delivered", Colors.green),
              _buildOrderSection("Cancelled", Colors.red),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOrderSection(String status, Color color) {
    final filteredOrders = orders.where((order) => order["status"] == status).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            status,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: filteredOrders.length,
          itemBuilder: (context, index) {
            var order = filteredOrders[index];
            return Card(
              elevation: 2,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              child: ExpansionTile(
                leading: _buildStatusIcon(order["status"]),
                title: Text(order["orderId"], style: TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("${order["date"]} • ${order["time"]} • ${order["total"]}"),
                children: _buildOrderItems(order["items"]),
              ),
            );
          },
        ),
      ],
    );
  }

  // Status Icon Widget
  Widget _buildStatusIcon(String status) {
    IconData icon;
    Color color;

    switch (status) {
      case "Delivered":
        icon = Icons.check_circle;
        color = Colors.green;
        break;
      case "Cancelled":
        icon = Icons.cancel;
        color = Colors.red;
        break;
      case "Processing":
      default:
        icon = Icons.access_time;
        color = Colors.orange;
        break;
    }

    return Icon(icon, color: color);
  }

  List<Widget> _buildOrderItems(List<Map<String, dynamic>> items) {
    return items.map((item) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
        child: Row(
          children: [
            Image.network(
              item["image"],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(item["name"]!, style: TextStyle(fontSize: 16)),
            ),
            Text(item["price"]!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ],
        ),
      );
    }).toList();
  }
}