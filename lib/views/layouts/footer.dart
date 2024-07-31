import 'package:dinissa/util/app_constant.dart';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';
import '../../util/app_colors.dart';

class Footer extends StatefulWidget {
  final int initialIndex;

  const Footer({Key? key, required this.initialIndex}) : super(key: key);

  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: AppConstants.secondaryColor,  // Active icon color
      unselectedItemColor: Colors.grey,  // Inactive icon color
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.attach_money),
          label: 'Buy/Sell',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.swap_horiz),
          label: 'Swap',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet),
          label: 'Wallet',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.remove_red_eye),
          label: 'Discover',
        ),
      ],
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        switch (index) {
          case 0:
            Navigator.pushReplacementNamed(context, AppRoutes.home);
            break;
          case 1:
            Navigator.pushReplacementNamed(context, AppRoutes.buySell);
            break;
          case 2:
            Navigator.pushReplacementNamed(context, AppRoutes.swap);
            break;
          case 3:
            Navigator.pushReplacementNamed(context, AppRoutes.wallet);
            break;
          case 4:
            Navigator.pushReplacementNamed(context, AppRoutes.discover);
            break;
        }
      },
    );
  
  }
}
