import 'package:flutter/material.dart';

class NayemPage extends StatelessWidget {
  const NayemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Md Nayem Hossen"),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Image
              CircleAvatar(
                radius: 80,
                backgroundImage: AssetImage("assets/images/nayem.jpeg"),
              ),
              const SizedBox(height: 20),

              // Name
              Text(
                "Md Nayem Hossen",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Role
              Text(
                "Founder & CEO",
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),

              // Biography
              Text(
                "Nayem is the visionary leader behind our app. With over a decade of experience in technology and entrepreneurship, he has successfully led multiple startups to profitability. His passion for innovation and problem-solving drives the company's mission and strategy.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 20),

              // Skills Section
              const Text(
                "Skills",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  Chip(label: Text("Leadership")),
                  Chip(label: Text("Strategic Planning")),
                  Chip(label: Text("Product Development")),
                  Chip(label: Text("Team Building")),
                ],
              ),
              const SizedBox(height: 20),

              // Achievements Section
              const Text(
                "Achievements",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Founded 3 successful startups"),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Awarded 'Tech Innovator of the Year 2022'"),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Featured in Forbes 30 Under 30"),
              ),
              const SizedBox(height: 20),

              // Social Media Links (Placeholder)
              const Text(
                "Connect with Nayem",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.link, color: Colors.blue),
                    onPressed: () {
                      // Add LinkedIn or other social media link
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.email, color: Colors.red),
                    onPressed: () {
                      // Add email link
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}