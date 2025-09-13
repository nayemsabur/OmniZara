import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shob_bazaar/ui/utils/app_color.dart';

class ProductDetailPage extends StatefulWidget {
  final String productName;
  final double price;
  final double? discountPrice;
  final bool isGiftItem;
  final String description;
  final List<String> imageUrls;

  const ProductDetailPage({
    Key? key,
    required this.productName,
    required this.price,
    this.discountPrice,
    required this.isGiftItem,
    required this.description,
    required this.imageUrls,
  }) : super(key: key);

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int _currentImageIndex = 0;
  int _quantity = 1;
  bool _isFavorite = false;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final double totalPrice = (widget.discountPrice ?? widget.price) * _quantity;
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.themeColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        iconTheme: IconThemeData(color: AppColors.themeColor),
        title: Text(
          widget.productName,
          style: TextStyle(color: AppColors.themeColor),
        ),
        actions: [
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : AppColors.themeColor,
            ),
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              // Add to favorites functionality
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    _isFavorite
                        ? 'Added to favorites'
                        : 'Removed from favorites',
                    style: TextStyle(color: AppColors.themeColor),
                  ),
                  backgroundColor: AppColors.primaryColor,
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Carousel
            _buildImageCarousel(h),

            // Image Indicators
            _buildImageIndicators(),

            // Product Details
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Name
                  Text(
                    widget.productName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Price and Discount
                  _buildPriceSection(),

                  const SizedBox(height: 16),

                  // Quantity Selector
                  _buildQuantitySelector(),

                  const SizedBox(height: 16),

                  // Total Price
                  Text(
                    'Total: \$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const SizedBox(height: 16),

                  // Description
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      // Add to Cart Button
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        color: AppColors.themeColor,
        child: ElevatedButton(
          onPressed: () {
            // Add to cart functionality
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Added to cart',
                  style: TextStyle(color: AppColors.themeColor),
                ),
                backgroundColor: AppColors.primaryColor,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Text(
            'Add to Cart',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.themeColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImageCarousel(double h) {
    return CarouselSlider(
      options: CarouselOptions(
        height: h * 0.4,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          setState(() {
            _currentImageIndex = index;
          });
        },
      ),
      items: widget.imageUrls.map((url) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Image.asset(
                url,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.error,
                    color: AppColors.primaryColor,
                    size: 50,
                  );
                },
              ),
            );
          },
        );
      }).toList(),
    );
  }

  Widget _buildImageIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.imageUrls.asMap().entries.map((entry) {
        return GestureDetector(
          child: Container(
            width: 8.0,
            height: 8.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryColor.withOpacity(
                _currentImageIndex == entry.key ? 0.9 : 0.4,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildPriceSection() {
    return Row(
      children: [
        if (widget.discountPrice != null)
          Text(
            '\$${widget.price.toStringAsFixed(2)}',
            style: TextStyle(
              decoration: TextDecoration.lineThrough,
              color: Colors.grey,
              fontSize: 16,
            ),
          ),
        if (widget.discountPrice != null) const SizedBox(width: 8),
        Text(
          '\$${(widget.discountPrice ?? widget.price).toStringAsFixed(2)}',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: widget.discountPrice != null
                ? Colors.red
                : AppColors.primaryColor,
          ),
        ),
        if (widget.isGiftItem) const SizedBox(width: 8),
        if (widget.isGiftItem)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Gift Item',
              style: TextStyle(
                color: AppColors.themeColor,
                fontSize: 12,
              ),
            ),
          ),
        const Spacer(),
        IconButton(
          icon: Icon(
            _isFavorite ? Icons.favorite : Icons.favorite_border,
            color: _isFavorite ? Colors.red : AppColors.primaryColor,
          ),
          onPressed: () {
            setState(() {
              _isFavorite = !_isFavorite;
            });
          },
        ),
      ],
    );
  }

  Widget _buildQuantitySelector() {
    return Row(
      children: [
        Text(
          'Quantity:',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(width: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            icon: Icon(Icons.remove, color: AppColors.themeColor),
            onPressed: () {
              if (_quantity > 1) {
                setState(() {
                  _quantity--;
                });
              }
            },
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.primaryColor),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            _quantity.toString(),
            style: TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: IconButton(
            icon: Icon(Icons.add, color: AppColors.themeColor),
            onPressed: () {
              setState(() {
                _quantity++;
              });
            },
          ),
        ),
      ],
    );
  }
}