import 'package:flutter/material.dart';

class AsadPage extends StatelessWidget {
  const AsadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Asad"),
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
                backgroundImage: AssetImage("assets/images/asad.jpeg"),
              ),
              const SizedBox(height: 20),

              // Name
              Text(
                "Asad",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Role
              Text(
                "Lead Developer",
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),

              // Biography
              Text(
                "Asad is a highly skilled developer with expertise in building scalable and efficient applications. He leads the development team, ensuring the delivery of high-quality software solutions. His passion for coding and problem-solving drives innovation within the company.",
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
                  Chip(label: Text("Flutter Development")),
                  Chip(label: Text("Backend Development")),
                  Chip(label: Text("Database Design")),
                  Chip(label: Text("API Integration")),
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
                title: Text("Developed 10+ successful apps"),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Reduced app load time by 40%"),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Mentored 5 junior developers"),
              ),
              const SizedBox(height: 20),

              // Social Media Links (Placeholder)
              const Text(
                "Connect with Asad",
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