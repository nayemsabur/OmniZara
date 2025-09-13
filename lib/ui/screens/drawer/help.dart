import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Help extends StatelessWidget {
  const Help({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Help"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "How can we help you?",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              const SizedBox(height: 10),

              _buildSectionTitle("Frequently Asked Questions"),
              _buildFAQItem("How do I reset my password?", "Go to settings > Account > Reset Password."),
              _buildFAQItem("How can I update the app?", "Check the Play Store/App Store for updates."),
              _buildFAQItem("How do I change my username?", "Go to settings > Edit Profile > Change Username."),
              _buildFAQItem("How do I enable notifications?", "Go to settings > Notifications and enable alerts."),

              const SizedBox(height: 20),

              // Troubleshooting Guide
              _buildSectionTitle("Troubleshooting"),
              _buildFAQItem("App is crashing?", "Try restarting your device or reinstalling the app."),
              _buildFAQItem("Cannot login?", "Check your internet connection and reset password if needed."),
              _buildFAQItem("Why is my screen freezing?", "Ensure your app is updated and restart your phone."),

              const SizedBox(height: 20),

              _buildSectionTitle("Contact Support"),
              _buildSupportButton(
                icon: Icons.email,
                label: "Email Support",
                onPressed: () => launchUrl(Uri.parse("mailto:support@yourapp.com")),
              ),
              _buildSupportButton(
                icon: Icons.phone,
                label: "Call Support",
                onPressed: () => launchUrl(Uri.parse("tel:+1234567890")),
              ),

              const SizedBox(height: 20),

              _buildSectionTitle("Helpful Links"),
              _buildHelpfulLink("Visit our Website", "https://www.yourapp.com"),
              _buildHelpfulLink("Privacy Policy", "https://www.yourapp.com/privacy"),
              _buildHelpfulLink("Terms of Service", "https://www.yourapp.com/terms"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, bottom: 5),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ExpansionTile(
        iconColor: Colors.blueAccent,
        collapsedIconColor: Colors.blueAccent,
        title: Text(question, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
            child: Text(answer, style: TextStyle(color: Colors.black87)),
          ),
        ],
      ),
    );
  }

  Widget _buildSupportButton({required IconData icon, required String label, required VoidCallback onPressed}) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(icon, color: Colors.blueAccent),
        title: Text(label, style: TextStyle(color: Colors.black)),
        onTap: onPressed,
      ),
    );
  }

  Widget _buildHelpfulLink(String label, String url) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        leading: Icon(Icons.link, color: Colors.blueAccent),
        title: Text(label, style: TextStyle(color: Colors.black)),
        onTap: () => launchUrl(Uri.parse(url)),
      ),
    );
  }
}