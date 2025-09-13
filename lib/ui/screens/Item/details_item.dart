import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:shob_bazaar/ui/screens/Item/reviewform.dart';
import 'package:shob_bazaar/ui/screens/Item/reviewlist.dart';

class DetailsItem extends StatefulWidget {
  const DetailsItem({Key? key}) : super(key: key);

  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  int quantity = 1;
  double _averageRating = 3.5;
  int _totalReviews = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Image.asset(
              'assets/images/product.jpeg',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildRatingRow(),
                  const SizedBox(height: 16),
                  _buildProductTitle(),
                  const SizedBox(height: 16),
                  _buildQuantitySelector(),
                  const SizedBox(height: 16),
                  _buildActionButtons(),
                  const SizedBox(height: 32),

                  ElevatedButton(
                    onPressed: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ReviewForm()),
                      );
                    },
                    child: const Text('Write a Review'),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ReviewList()),
                      );
                    },
                    child: const Text('View Reviews'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildRatingRow() {
    return Row(
      children: [
        RatingBarIndicator(
          rating: _averageRating,
          itemCount: 5,
          itemSize: 24,
          itemBuilder: (context, _) =>
          const Icon(Icons.star, color: Colors.amber),
        ),
        const SizedBox(width: 8),
        Text('${_averageRating.toStringAsFixed(1)} ($_totalReviews reviews)'),
      ],
    );
  }

  Widget _buildProductTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text(
          'Product Name',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          '\$99.99',
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green),
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        const Text('Quantity:', style: TextStyle(fontSize: 16)),
        const SizedBox(width: 8),
        IconButton(
            onPressed: _decrementQuantity, icon: const Icon(Icons.remove)),
        Text('$quantity', style: const TextStyle(fontSize: 16)),
        IconButton(onPressed: _incrementQuantity, icon: const Icon(Icons.add)),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Add to Cart'),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: ElevatedButton(
            onPressed: () {},
            child: const Text('Buy Now'),
          ),
        ),
      ],
    );
  }

  // Quantity Handlers
  void _incrementQuantity() => setState(() => quantity++);
  void _decrementQuantity() =>
      setState(() => quantity > 1 ? quantity-- : quantity);
}
