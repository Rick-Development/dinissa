import 'package:dinissa/views/home_screen.dart';
import 'package:dinissa/views/loan_save_screen.dart';
import 'package:dinissa/views/p2p_screen.dart';
import 'package:dinissa/views/profile_screen.dart';
import 'package:dinissa/views/splash_screen.dart';
import 'package:dinissa/views/buy_sell_screen.dart';  // Add this
import 'package:dinissa/views/swap_screen.dart';      // Add this
import 'package:dinissa/views/wallet_screen.dart';    // Add this
import 'package:dinissa/views/discover_screen.dart';  // Add this
import 'package:flutter/material.dart';

class AppRoutes {
  static const String home = '/home';
  static const String splashScreen = '/splash_screen';
  static const String p2p = '/p2p';
  static const String loanSave = '/loansave';
  static const String profile = '/profile';
  static const String buySell = '/buySell';  // Add this
  static const String swap = '/swap';        // Add this
  static const String wallet = '/wallet';    // Add this
  static const String discover = '/discover';// Add this

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case p2p:
        return MaterialPageRoute(builder: (_) => P2PScreen());
      case splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case loanSave:
        return MaterialPageRoute(builder: (_) => LoanSaveScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case buySell:
        return MaterialPageRoute(builder: (_) => BuySellScreen()); // Add this
      case swap:
        return MaterialPageRoute(builder: (_) => SwapScreen());   // Add this
      case wallet:
        return MaterialPageRoute(builder: (_) => WalletScreen()); // Add this
      case discover:
        return MaterialPageRoute(builder: (_) => DiscoverScreen());// Add this
      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
