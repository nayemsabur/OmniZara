import 'package:flutter/material.dart';

class PaymentMethodScreen extends StatefulWidget {
  @override
  _PaymentMethodScreenState createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  String _selectedPaymentMethod = 'Credit/Debit Card'; // Default selected payment method

  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardholderNameController = TextEditingController();

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardholderNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Method'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            _buildPaymentMethodRadio('Credit/Debit Card'),
            _buildPaymentMethodRadio('PayPal'),
            _buildPaymentMethodRadio('Google Pay'),
            _buildPaymentMethodRadio('Apple Pay'),
            _buildPaymentMethodRadio('Bank Transfer'),
            _buildPaymentMethodRadio('Cash on Delivery'),
            SizedBox(height: 24),
            if (_selectedPaymentMethod == 'Credit/Debit Card') _buildCardDetailsForm(),
            SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {

                  _processPayment();
                },
                child: Text('Continue to Payment'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodRadio(String method) {
    return RadioListTile<String>(
      title: Text(method),
      value: method,
      groupValue: _selectedPaymentMethod,
      onChanged: (value) {
        setState(() {
          _selectedPaymentMethod = value!;
        });
      },
    );
  }

  Widget _buildCardDetailsForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _cardNumberController,
          decoration: InputDecoration(
            labelText: 'Card Number',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _expiryDateController,
                decoration: InputDecoration(
                  labelText: 'Expiry Date (MM/YY)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.datetime,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: TextField(
                controller: _cvvController,
                decoration: InputDecoration(
                  labelText: 'CVV',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                obscureText: true,
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        TextField(
          controller: _cardholderNameController,
          decoration: InputDecoration(
            labelText: 'Cardholder Name',
            border: OutlineInputBorder(),
          ),
        ),
      ],
    );
  }

  void _processPayment() {
    if (_selectedPaymentMethod == 'Credit/Debit Card') {
      if (_cardNumberController.text.isEmpty ||
          _expiryDateController.text.isEmpty ||
          _cvvController.text.isEmpty ||
          _cardholderNameController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Please fill in all card details')),
        );
        return;
      }
    }

    print('Processing payment with $_selectedPaymentMethod');
  }
}