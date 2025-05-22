import 'dart:developer';
import 'package:deal_sell/routes/app_route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import '../../../../../core/theme/app_colors.dart';
import '../providers/theme_provider.dart';
import '../widget/profile_option_list.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Material(
          elevation: 0.1,
          color: Colors.white,
          child: AppBar(
            scrolledUnderElevation: 0,
            backgroundColor: Colors.white,
            elevation: 0, // Set to 0 since Material provides elevation
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Profile", style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
      ),

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
            Consumer<ThemeProvider>(
              builder: (context, provider, _) {
                final mode = provider.themeMode;

                final icon =
                    mode == ThemeMode.dark
                        ? Icons.dark_mode
                        : mode == ThemeMode.light
                        ? Icons.light_mode
                        : Icons.settings_brightness;

                return buildProfileOption(
                  'Theme',
                  icon,
                  onTap: () {
                    context.pushNamed(AppRoutesName.themeSelectionScreen);
                  },
                );
              },
            ),

            buildProfileOption('Privacy Policy', Icons.privacy_tip),
            buildProfileOption(
              'Help Center',
              Icons.help_center,
              onTap: () {
                context.pushNamed(AppRoutesName.helpScreen);
                log('help center');
              },
            ),
            buildProfileOption('Invite Friends', Icons.people_alt),
            ListTile(
              leading: Icon(
                LucideIcons.logOut,
                color: statusErrorColor,
                size: 18,
              ),
              title: Text('Logout', style: TextStyle(color: statusErrorColor)),
              onTap: () {
                context.goNamed(AppRoutesName.loginScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
