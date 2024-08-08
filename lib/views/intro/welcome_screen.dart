import 'package:dinissa/routes/app_routes.dart';
import 'package:dinissa/util/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _slides = [
    {
      'image': 'assets/images/undraw_savings_re_eq4w.svg',
      'title': "Secure your future with smart investments and savings.",
      'text':
          'Plant the seeds of financial security today for a flourishing tomorrow. Explore our tailored options to grow your wealth steadily while safeguarding your future',
    },
    {
      'image': 'assets/images/undraw_online_banking_re_kwqh.svg',
      'title': 'Fund your Wallet',
      'text':
          'lets you quickly and securely add money to your digital wallet using bank transfers, cards, or direct deposits. Manage your finances effortlessly and access your funds instantly',
    },
    {
      'image': 'assets/images/undraw_fast_loading_re_8oi3.svg',
      'title': 'Instant Loans',
      'text':
          'Access quick and convenient loans with our fintech app. Apply in minutes and receive funds directly to your account. Enjoy competitive rates, flexible repayment options, and a hassle-free experience.',
    },
    {
      'image': 'assets/images/undraw_online_banking_re_kwqh.svg',
      'title': ' Connect, Transact, Anywhere.',
      'text':
          'Our platform empowers you to engage in seamless transactions and interactions across the globe, eliminating the need for intermediaries. Experience the freedom of direct peer-to-peer engagement, anytime, anywhere.',
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _continue() {
    // Navigate to the next screen
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.login,
    );
  }

  void _next() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _currentIndex != _slides.length - 1
          ? AppBar(
              automaticallyImplyLeading: false,
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                  child: GestureDetector(
                    onTap: _continue,
                    child: Text(
                      "Skip",
                      style: TextStyle(fontSize: 20.sp),
                    ),
                  ),
                ),
              ],
            )
          : null,
      body: Container(
        // color: Colors.yellow, // Set the background color to yellow
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _slides.length,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        _slides[index]['image']!,
                        height: (MediaQuery.of(context).size.height * 0.3).h,
                        width: (MediaQuery.of(context).size.width * 0.5).w,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        _slides[index]['title'] ?? '',
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        _slides[index]['text']!,
                        style: TextStyle(fontSize: 14.sp),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0.w),
                  width: 10.0.w,
                  height: 10.0.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all<Color>(AppColors.primaryColor),
                        ),
                        onPressed: _currentIndex != _slides.length - 1
                            ? _next
                            : _continue,
                        child: Text(
                          _currentIndex != _slides.length - 1
                              ? 'Next'
                              : 'Continue',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
