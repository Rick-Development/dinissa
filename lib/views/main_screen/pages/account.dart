import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Profile Section
          Container(
            color: AppColors.primaryColor, // Blue background color
            padding: const EdgeInsets.symmetric(vertical: 20),
            width: MediaQuery.of(context).size.width * 4,
            child: const Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage('https://marketplace.canva.com/EAFXS8-cvyQ/1/0/1600w/canva-brown-and-light-brown%2C-circle-framed-instagram-profile-picture-2PE9qJLmPac.jpg'), // Replace with the actual image
                ),
                SizedBox(height: 10),
                Text(
                  'Nwachukwu Patrick',
                  style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5),
                Text(
                  'nwachukwupatrick06@gmail.com',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  '+2348111218116',
                  style: TextStyle(color: Colors.black, fontSize: 14),
                ),
              ],
            ),
          ),
          // List Items
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              children: [
                _buildListTile(
                  context: context,
                  icon: Icons.person,
                  title: 'Account',
                  screen: const AccountScreen(),
                ),
                _buildListTile(
                  context: context,
                  icon: Icons.account_balance,
                  title: 'History',
                  screen: const AccountScreen(),
                ),
                _buildListTile(
                  context: context,
                  icon: Icons.notifications,
                  title: 'Notifications',
                  screen: const AccountScreen(),
                ),
                _buildListTile(
                  context: context,
                  icon: Icons.security,
                  title: 'Security',
                  screen: const AccountScreen(),
                ),
                _buildListTile(
                  context: context,
                  icon: Icons.help_outline,
                  title: 'Help and Support',
                  screen: const AccountScreen(),
                ),
                _buildListTile(
                  context: context,
                  icon: Icons.description,
                  title: 'Terms and Conditions',
                  screen: const AccountScreen(),
                ),
                _buildListTile(
                  context: context,
                  icon: Icons.logout,
                  title: 'Logout',
                  screen: const AccountScreen(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListTile({ required BuildContext context, required IconData icon, required String title, required Widget screen}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        tileColor: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        leading: Icon(icon, color: const Color(0xFF366FCB)), // Blue color for icons
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
    onTap: () => {
          handleNavigation(title, context, screen)
  },
      ),
    );
  }
  Future<void> logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear(); // Clear all data or remove specific keys
  }



// Function to handle navigation based on title
  void handleNavigation(String title, BuildContext context, Widget screen) async {
    if (title == "Logout") {
      await logout(); // Clear session data
      if (!context.mounted) return; // Ensure the widget is still in the tree
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()), // Navigate to LoginScreen
            (Route<dynamic> route) => false, // Remove all previous routes
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => screen), // Navigate to the provided screen
      );
    }
  }

}
