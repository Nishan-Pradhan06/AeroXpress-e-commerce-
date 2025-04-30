import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'widget/profile_option_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Screen')),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile header
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Nishan Pradhan',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '+977 9817326306',
                    style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            SizedBox(height: 32),

            // Profile options
            buildProfileOption(
              'Edit Profile',
              LucideIcons.userRound,
              onTap: () {},
            ),
            buildProfileOption('Address', Icons.location_on),
            buildProfileOption('Notification', Icons.notifications),
            buildProfileOption('Payment', Icons.payment),
            buildProfileOption('Security', Icons.security),
            buildProfileOption('Language', Icons.language),
            buildProfileOption('Dark Mode', Icons.dark_mode),
            buildProfileOption('Privacy Policy', Icons.privacy_tip),
            buildProfileOption('Help Center', Icons.help_center),
            buildProfileOption('Invite Friends', Icons.people_alt),

            // Logout option
            SizedBox(height: 16),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout', style: TextStyle(color: Colors.red)),
              onTap: () {
                // Handle logout
              },
            ),
            ShadButton(
              child: Text('Register'),
              onPressed: () {
                context.pushNamed('LoginScreen');
              },
            ),
          ],
        ),
      ),
    );
  }
}
