import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SettingsScreen(),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader('General'),
              _buildSettingOption(
                context,
                icon: Icons.palette,
                title: 'Appearance',
                subtitle: 'Change theme and view mode',
                onTap: () {

                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.notifications,
                title: 'Notifications',
                subtitle: 'Manage notification preferences',
                onTap: () {

                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.language,
                title: 'Language',
                subtitle: 'Change app language',
                onTap: () {

                },
              ),
              _buildSectionHeader('Security'),
              _buildSettingOption(
                context,
                icon: Icons.lock,
                title: 'Change Password',
                subtitle: 'Update your account password',
                onTap: () {
                  // Navigate to change password screen
                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.fingerprint,
                title: 'Biometric Login',
                subtitle: 'Enable fingerprint or face recognition',
                onTap: () {

                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.security,
                title: 'Two-Factor Authentication',
                subtitle: 'Add an extra layer of security',
                onTap: () {

                },
              ),
              _buildSectionHeader('Advanced'),
              _buildSettingOption(
                context,
                icon: Icons.storage,
                title: 'Clear Cache',
                subtitle: 'Free up storage space',
                onTap: () {

                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.update,
                title: 'Check for Updates',
                subtitle: 'Ensure you have the latest version',
                onTap: () {

                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.bug_report,
                title: 'Report a Bug',
                subtitle: 'Help us improve the app',
                onTap: () {

                },
              ),
              _buildSectionHeader('Engagement'),
              _buildSettingOption(
                context,
                icon: Icons.card_giftcard,
                title: 'Refer a Friend',
                subtitle: 'Earn rewards by inviting friends',
                onTap: () {

                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.star,
                title: 'Rate the App',
                subtitle: 'Share your experience with us',
                onTap: () {

                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.share,
                title: 'Share the App',
                subtitle: 'Spread the word about our app',
                onTap: () {

                },
              ),
              _buildSectionHeader('Data & Privacy'),
              _buildSettingOption(
                context,
                icon: Icons.privacy_tip,
                title: 'Privacy Settings',
                subtitle: 'Manage your data and privacy',
                onTap: () {

                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.delete,
                title: 'Delete Account',
                subtitle: 'Permanently remove your account',
                onTap: () {

                },
              ),
              _buildSettingOption(
                context,
                icon: Icons.download,
                title: 'Download Data',
                subtitle: 'Download a copy of your data',
                onTap: () {

                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildSettingOption(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
      }) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).primaryColor),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      trailing: Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
    );
  }
}