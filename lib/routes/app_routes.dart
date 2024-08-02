import 'package:dinissa/views/auth/login_screen.dart';
import 'package:dinissa/views/auth/signup_screen.dart';
import 'package:dinissa/views/main_screen/main_screen.dart';
import 'package:dinissa/views/main_screen/pages/home_screen.dart';
import 'package:dinissa/views/loan_save_screen.dart';
import 'package:dinissa/views/p2p_screen.dart';
import 'package:dinissa/views/profile_screen.dart';
import 'package:dinissa/views/intro/splash_screen.dart';
import 'package:dinissa/views/main_screen/pages/trade_screen.dart'; // Add this
import 'package:dinissa/views/main_screen/pages/finance_screen.dart'; // Add this
import 'package:dinissa/views/main_screen/pages/wallet_screen.dart'; // Add this
import 'package:dinissa/views/main_screen/pages/discover_screen.dart'; // Add this
import 'package:dinissa/views/intro/welcome_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String splashScreen = '/splash_screen';
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signUp = '/signup';
  static const String mainScreen = '/main_screen';
  static const String home = '/home';
  static const String p2p = '/p2p';
  static const String loanSave = '/loansave';
  static const String profile = '/profile';
  static const String buySell = '/buySell'; // Add this
  static const String swap = '/swap'; // Add this
  static const String wallet = '/wallet'; // Add this
  static const String discover = '/discover'; // Add this

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case welcome:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signUp:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case mainScreen:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case p2p:
        return MaterialPageRoute(builder: (_) => const P2PScreen());
      case loanSave:
        return MaterialPageRoute(builder: (_) => const LoanSaveScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case buySell:
        return MaterialPageRoute(
            builder: (_) => const TradeScreen()); // Add this
      case swap:
        return MaterialPageRoute(
            builder: (_) => const FinanceScreen()); // Add this
      case wallet:
        return MaterialPageRoute(
            builder: (_) => const WalletScreen()); // Add this
      case discover:
        return MaterialPageRoute(
            builder: (_) => const DiscoverScreen()); // Add this
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }
}
