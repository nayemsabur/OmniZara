import 'package:flutter/material.dart';

class MahfuzurPage extends StatelessWidget {
  const MahfuzurPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mahfuzur Rahman"),
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
                backgroundImage: AssetImage("assets/images/ariyan.jpeg"),
              ),
              const SizedBox(height: 20),

              // Name
              Text(
                "Mahfuzur Rahman",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              // Role
              Text(
                "Operation Manager",
                style: TextStyle(fontSize: 20, color: Colors.grey[600]),
              ),
              const SizedBox(height: 20),

              // Biography
              Text(
                "Mahfuzur is an experienced operations manager with a focus on optimizing processes and ensuring smooth business operations. He is dedicated to improving efficiency and delivering exceptional results.",
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
                  Chip(label: Text("Process Optimization")),
                  Chip(label: Text("Team Management")),
                  Chip(label: Text("Supply Chain Management")),
                  Chip(label: Text("Project Management")),
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
                title: Text("Reduced operational costs by 15%"),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Improved team productivity by 30%"),
              ),
              ListTile(
                leading: Icon(Icons.star, color: Colors.amber),
                title: Text("Successfully managed 50+ projects"),
              ),
              const SizedBox(height: 20),

              // Social Media Links (Placeholder)
              const Text(
                "Connect with Mahfuzur",
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