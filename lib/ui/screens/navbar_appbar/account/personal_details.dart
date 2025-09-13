import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PersonalDetailsScreen extends StatelessWidget {

  final String profileImageUrl = 'https://via.placeholder.com/150'; // Placeholder image URL
  final String fullName = 'John Doe';
  final String email = 'johndoe@example.com';
  final String phoneNumber = '+1 123-456-7890';
  final String dateOfBirth = 'January 1, 1990';
  final String gender = 'Male';
  final String address = '123 Main St, Apt 4B, New York, NY 10001';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Details'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            CircleAvatar(
              radius: 50,
              backgroundImage: CachedNetworkImageProvider(profileImageUrl),
            ),
            SizedBox(height: 20),


            _buildDetailItem('Full Name', fullName),
            SizedBox(height: 16),


            _buildDetailItem('Email Address', email),
            SizedBox(height: 16),


            _buildDetailItem('Phone Number', phoneNumber),
            SizedBox(height: 16),


            _buildDetailItem('Date of Birth', dateOfBirth),
            SizedBox(height: 16),


            _buildDetailItem('Gender', gender),
            SizedBox(height: 16),

            // Address
            _buildDetailItem('Address', address),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}