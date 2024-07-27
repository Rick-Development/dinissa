import 'package:dinissa/views/home_screen.dart';
import 'package:dinissa/views/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> _slides = [
    {
      'image': 'assets/images/investor.svg',
      'title':"Secure your future with smart investments and savings.",
      'text': 'Plant the seeds of financial security today for a flourishing tomorrow. Explore our tailored options to grow your wealth steadily while safeguarding your future',
    },
    {
      'image': 'assets/images/team.svg',
      'title':'Fund your Wallet',
      'text': 'lets you quickly and securely add money to your digital wallet using bank transfers, cards, or direct deposits. Manage your finances effortlessly and access your funds instantly',
    },
    {
      'image': 'assets/images/success.svg',
      'title':'Instant Loans',
      'text': 'Access quick and convenient loans with our fintech app. Apply in minutes and receive funds directly to your account. Enjoy competitive rates, flexible repayment options, and a hassle-free experience.',
    },
    {
      'image': 'assets/images/savings.svg',
      'title':' Connect, Transact, Anywhere.',
      'text': 'Our platform empowers you to engage in seamless transactions and interactions across the globe, eliminating the need for intermediaries. Experience the freedom of direct peer-to-peer engagement, anytime, anywhere.',
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _continue() {
    // Navigate to the next screen
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LoginScreen(), // Replace NextScreen() with the actual widget of your next screen
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.yellow,
        // foregroundColor: Colors.white,
        // title: Text('Welcome'),
         automaticallyImplyLeading: false,
        actions: <Widget> [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: GestureDetector(
              onTap: _continue,
              child: Text(
                  "Skip",
                style: TextStyle(
                  fontSize: 20
                ),
              ),
            ),
          )
        ]
      ),
      body: Container(
        // color: Colors.yellow, // Set the background color to yellow
        padding: EdgeInsets.all(10.0),
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
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width * 0.5,
                      ),
                      SizedBox(height: 20),
                      Text(
                        _slides[index]['title']??'',
                        style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 20),
                      Text(
                        _slides[index]['text']!,
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(_slides.length, (index) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  width: 10.0,
                  height: 10.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentIndex == index
                        ? Colors.blueAccent
                        : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
      // Align(
      //   alignment: Alignment.bottomCenter,
      //   child: Row(
      //     children: [
      //       Expanded(
      //         child: ElevatedButton(
      //           style: ButtonStyle(
      //             backgroundColor: MaterialStateProperty.all<Color>(Colors.yellow),
      //           ),
      //           onPressed: _continue,
      //           child: Text(
      //             'Continue',
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
          ],
        ),
      ),
    );
  }
}
