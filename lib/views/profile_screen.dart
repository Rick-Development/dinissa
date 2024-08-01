import 'package:flutter/material.dart';

import '../util/app_colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text(
            //   'Profile',
            //   style: TextStyle(fontSize: 20),
            // ),
            const SizedBox(height: 16),
            const Text(
              'Your Dinnisa profile is your personal gateway to managing your account information.',
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(
                      'assets/images/profile.png'), // Replace with your image asset
                ),
                SizedBox(width: 20),
                Expanded(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 5),
                    Text(
                      'John Doe',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'johndoe@example.com',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                )),
              ],
            ),
            // SizedBox(height: 16),

            const SizedBox(height: 16),
            const Text(
              'General Settings',
              style: TextStyle(fontSize: 18),
            ),
            const Divider(),
            _buildSettingItem(
              context,
              icon: Icons.person,
              title: 'Personal Information',
              subtitle: 'Your Personal information',
              onTap: () => Navigator.pushNamed(context, '/profile-information'),
            ),
            _buildSettingItem(
              context,
              icon: Icons.lock,
              title: 'Change Password',
              subtitle: 'You can change your password',
              onTap: () => Navigator.pushNamed(context, '/change-password'),
            ),
            _buildSettingItem(
              context,
              icon: Icons.verified_user,
              title: 'KYC',
              subtitle: 'Complete your KYC',
              onTap: () => Navigator.pushNamed(context, '/kyc'),
            ),
            _buildSettingItem(
              context,
              icon: Icons.link,
              title: 'Link Account',
              subtitle: 'Add your Nigerian bank for faster payout',
              onTap: () => Navigator.pushNamed(context, '/link-account'),
            ),
            _buildSettingItem(
              context,
              icon: Icons.help,
              title: 'Help & Support',
              subtitle: 'Help or Contact Fast Reflect',
              onTap: () => Navigator.pushNamed(context, '/contact-us'),
            ),
            _buildSettingItem(
              context,
              icon: Icons.logout,
              title: 'Log out',
              subtitle: 'Log out from the system',
              onTap: () => Navigator.pushNamed(context, '/logout'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
      leading: CircleAvatar(
        radius: 25,
        backgroundColor: Colors.white,
        child: Icon(icon, color: Colors.blue),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
