import 'package:flutter/material.dart';

class ChinmoyPage extends StatelessWidget {
  const ChinmoyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chinmoy Biswas"),
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
                backgroundImage: AssetImage("assets/images/chinmoy.jpeg"),
              ),
              const SizedBox(height: 20),

              // Name
              Text(
                "Chinmoy Biswas",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Role
              Text(
                "Marketing Manager",
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),

              // Biography
              Text(
                "Chinmoy is a results-driven marketing professional with a proven track record of creating and executing successful marketing campaigns. He is passionate about building brand awareness and driving customer engagement.",
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
                  Chip(label: Text("Digital Marketing")),
                  Chip(label: Text("SEO/SEM")),
                  Chip(label: Text("Content Strategy")),
                  Chip(label: Text("Data Analytics")),
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
                title: Text("Increased website traffic by 200%"),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Launched 10+ successful campaigns"),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Awarded 'Marketer of the Year 2020'"),
              ),
              const SizedBox(height: 20),

              // Social Media Links (Placeholder)
              const Text(
                "Connect with Chinmoy",
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