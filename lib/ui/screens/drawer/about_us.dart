import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shob_bazaar/ui/screens/teammember/ariyan.dart';
import 'package:shob_bazaar/ui/screens/teammember/asad.dart';
import 'package:shob_bazaar/ui/screens/teammember/chinmoy.dart';
import 'package:shob_bazaar/ui/screens/teammember/jannat.dart';
import 'package:shob_bazaar/ui/screens/teammember/nayem.dart';
import 'package:shob_bazaar/ui/screens/teammember/samia.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/app_color.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  String appVersion = "Loading...";
  final ScrollController _teamScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getAppVersion();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _teamScrollController.jumpTo(_teamScrollController.position.maxScrollExtent / 2);
    });
  }

  Future<void> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      appVersion = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Align(alignment: Alignment.topRight,
            child: Image.asset(
              'assets/images/Vector7.png',
              fit: BoxFit.cover,
            ),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                // App Logo, Name, Version, and Description
                Padding(
                  padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Your App Name",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "Version: $appVersion",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "This app is designed to help users with [your app’s purpose]. "
                            "We aim to provide the best experience for our users.",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Mission Section
                _buildSection("Our Mission", [
                  Text(
                    "To provide the best experience for our users by delivering innovative solutions that simplify their daily tasks.",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ]),
                _buildSection("App Features", [
                  _buildFeature("Easy to Use", Icons.thumb_up),
                  _buildFeature("Secure", Icons.security),
                  _buildFeature("Fast Performance", Icons.speed),
                  _buildFeature("24/7 Support", Icons.support_agent),
                ]),
                _buildSection("Our Team", [
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      controller: _teamScrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: teamMembers.length,
                      itemBuilder: (context, index) {
                        return _buildTeamMember(
                          teamMembers[index]["name"]!,
                          teamMembers[index]["role"]!,
                          teamMembers[index]["imageUrl"]!,
                          teamMembers[index]["page"]!, // Pass the member's page
                        );
                      },
                    ),
                  ),
                ]),
                _buildSection("Contact Us", [
                  _buildContactInfo(Icons.email, "Email", "support@yourapp.com", "mailto:support@yourapp.com"),
                  _buildContactInfo(Icons.phone, "Phone", "+1 234 567 890", "tel:+1234567890"),
                  _buildContactInfo(Icons.language, "Website", "www.yourapp.com", "https://www.yourapp.com"),
                  _buildContactInfo(Icons.location_on, "Address", "123 App Street, Tech City", "https://goo.gl/maps"),
                ]),

                _buildSection("Follow Us", [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildSocialIcon(Icons.facebook, "https://facebook.com/yourapp"),
                      // _buildSocialIcon(Icons.twitter, "https://twitter.com/yourapp"),
                      // _buildSocialIcon(Icons.instagram, "https://instagram.com/yourapp"),
                      // _buildSocialIcon(Icons.linkedin, "https://linkedin.com/company/yourapp"),
                    ],
                  ),
                ]),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection(String title, List<Widget> children) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTeamMember(String name, String role, String imageUrl, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Card(
        color: AppColors.primaryColor,
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 5),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(imageUrl),
              ),
              const SizedBox(height: 10),
              Text(name, style: TextStyle(color: Colors.black)),
              Text(role, style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo(IconData icon, String label, String value, String url) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: TextStyle(color: Colors.black)),
      subtitle: GestureDetector(
        onTap: () => launchUrl(Uri.parse(url)),
        child: Text(value, style: TextStyle(color: Colors.blue, decoration: TextDecoration.underline)),
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return IconButton(
      icon: Icon(icon, color: Colors.black, size: 30),
      onPressed: () => launchUrl(Uri.parse(url)),
    );
  }

  Widget _buildFeature(String feature, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(feature, style: TextStyle(color: Colors.black)),
    );
  }

  final List<Map<String, dynamic>> teamMembers = [
    {
      "name": "Md Nayem Hossen",
      "role": "Founder & CEO",
      "imageUrl": "assets/images/nayem.jpeg",
      "page": NayemPage(),
    },
    {
      "name": "Samia Akter Sumia",
      "role": "Co Founder & Director",
      "imageUrl": "assets/images/samia.jpeg",
      "page": SamiaPage(),
    },
    {
      "name": "Asad",
      "role": "Lead Developer",
      "imageUrl": "assets/images/asad.jpeg",
      "page": AsadPage(),
    },
    {
      "name": "Jannatun Ferdous",
      "role": "UI/UX Designer",
      "imageUrl": "assets/images/jannat.jpeg",
      "page": JannatunPage(),
    },
    {
      "name": "Chinmoy Biswas",
      "role": "Marketing Manager",
      "imageUrl": "assets/images/chinmoy.jpeg",
      "page": ChinmoyPage(),
    },
    {
      "name": "Mahfuzur Rahman",
      "role": "Operation Manager",
      "imageUrl": "assets/images/ariyan.jpeg",
      "page": MahfuzurPage(),
    },
  ];
}