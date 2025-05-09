import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dinissa/util/app_colors.dart';
import 'package:dinissa/views/main_screen/pages/account.dart';
import 'package:dinissa/views/main_screen/pages/discover_screen.dart';
import 'package:dinissa/views/main_screen/pages/home_screen.dart';
import 'package:dinissa/views/main_screen/pages/finance_screen.dart';
import 'package:dinissa/views/main_screen/pages/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isConnected = true;

  int _selectedIndex = 0;
  final List _pages = [
    const HomeScreen(),
    const DiscoverScreen(),
     // const LoanSaveScreen(),
    const FinanceScreen(),
    const WalletScreen(),
    const AccountScreen()
  ];

  // function to update the selected index to enable page changes
  void _updateSelectedBottomNavIndex(int index) {
    setState(() {
      _selectedIndex = index;
      print("Selected Index: $_selectedIndex");
    });
  }

  @override
  void initState() {
    super.initState();
    checkConnectivity();
  }

  Future<void> checkConnectivity() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        setState(() {
          isConnected = true;
          print("No Internet Connection");
        });
      } else {
        setState(() {
          isConnected = true;
          print("Connected to the Internet");
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isConnected
          ? _pages[_selectedIndex]
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.signal_wifi_off, size: 50),
            Text(
              "No Internet Connection",
              style: TextStyle(fontSize: 24.sp),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.secondaryColor, // Active icon color
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          _updateSelectedBottomNavIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            label: 'Market',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horiz),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'Wallet',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.remove_red_eye),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
