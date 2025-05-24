import 'dart:developer';
import 'package:cached_network_image/cached_network_image.dart';
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
            ProfileCard(
              email: '+977 9817326306',
              imageSrc:
                  'https://avatars.githubusercontent.com/u/105001135?s=400&u=deb717807fc5fcc62502f74287539628ad6a3289&v=4',
              name: 'Nishan Pradhan',
              isShowHi: false,
            ),

            // Center(
            //   child: Column(
            //     children: [
            //       CircleAvatar(
            //         radius: 50,
            //         backgroundColor: Colors.grey[300],
            //         child: Icon(
            //           Icons.person,
            //           size: 50,
            //           color: Colors.grey[600],
            //         ),
            //       ),
            //       SizedBox(height: 16),
            //       Text(
            //         'Nishan Pradhan',
            //         style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            //       ),
            //       SizedBox(height: 8),
            //       Text(
            //         '+977 9817326306',
            //         style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            //       ),
            //     ],
            //   ),
            // ),

            // Profile options
            // buildProfileOption(
            //   'Edit Profile',
            //   LucideIcons.userRound,
            //   onTap: () {},
            // ),
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

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    required this.name,
    required this.email,
    required this.imageSrc,
    this.proLableText = "Pro",
    this.isPro = false,
    this.press,
    this.isShowHi = true,
    this.isShowArrow = true,
  });

  final String name, email, imageSrc;
  final String proLableText;
  final bool isPro, isShowHi, isShowArrow;
  final VoidCallback? press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: CircleAvatar(
        radius: 28,
        child: NetworkImageWithLoader(imageSrc),
      ),
      title: Row(
        children: [
          Text(
            isShowHi ? " $name" : name,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(width: 10),
          if (isPro)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                proLableText,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 0.7,
                  height: 1,
                ),
              ),
            ),
        ],
      ),
      subtitle: Text(email),
      trailing:
          isShowArrow
              ? Icon(
                LucideIcons.chevronRight,
                color: Theme.of(context).iconTheme.color!.withOpacity(0.4),
              )
              : null,
    );
  }
}

class NetworkImageWithLoader extends StatelessWidget {
  final BoxFit fit;

  const NetworkImageWithLoader(
    this.src, {
    super.key,
    this.fit = BoxFit.cover,
    this.radius = 10,
  });

  final String src;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(radius)),
      child: CachedNetworkImage(
        fit: fit,
        imageUrl: src,
        imageBuilder:
            (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider, fit: fit),
              ),
            ),
        // placeholder:
        //     (context, url) => SkeletonAvatar(
        //       style: SkeletonAvatarStyle(
        //         width: double.infinity,
        //         height: double.infinity,
        //         borderRadius: BorderRadius.circular(radius),
        //       ),
        //     ),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
