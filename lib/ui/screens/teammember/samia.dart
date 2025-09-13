import 'package:flutter/material.dart';

class SamiaPage extends StatelessWidget {
  const SamiaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Samia Akter Sumia"),
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
                backgroundImage: AssetImage("assets/images/samia.jpeg"),
              ),
              const SizedBox(height: 20),

              // Name
              Text(
                "Samia Akter Sumia",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Role
              Text(
                "Co-Founder & Director",
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),

              // Biography
              Text(
                "Samia is a dynamic leader with a strong background in business strategy and operations. She has played a pivotal role in scaling the company and ensuring operational excellence. Her ability to build strong relationships with stakeholders has been instrumental in the company's growth.",
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
                  Chip(label: Text("Business Strategy")),
                  Chip(label: Text("Operations Management")),
                  Chip(label: Text("Stakeholder Engagement")),
                  Chip(label: Text("Financial Planning")),
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
                title: Text("Scaled company revenue by 300% in 2 years"),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Recognized as 'Top Female Entrepreneur 2021'"),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Built a team of 50+ professionals"),
              ),
              const SizedBox(height: 20),

              // Social Media Links (Placeholder)
              const Text(
                "Connect with Samia",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.link, color: Colors.blue),
                    onPressed: () {
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