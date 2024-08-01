import 'package:dinissa/routes/app_routes.dart';
import 'package:dinissa/util/app_constant.dart';
import 'package:dinissa/views/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(() {
      // print('Password: ${_passwordController.text}');
    });
    _emailController.addListener(() {
      // print('Email: ${_emailController.text}');
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  void _login(BuildContext context, TextEditingController emailController,
      TextEditingController passwordController) {
    var email = emailController.text;
    var pass = passwordController.text;

    if (email != '1' && pass != '1') {
      Navigator.pushReplacementNamed(context, AppRoutes.mainScreen);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No Internet Connection!'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.black,
        ),
        body: Container(
          color: AppColors.secondaryColor,
          child: Column(
            children: [
              // Image.asset("assets/images/Sun.png",
              // width: MediaQuery.of(context).size.width,
              //   fit: BoxFit.fill,
              // ),
              Image.asset(
                "assets/images/undraw_walking_in_rain_vo9p 2.png",
                height: (MediaQuery.of(context).size.height * 0.30).h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0.h),
                child: Text(
                  AppConstants.appName,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0..w),
                child: Column(
                  children: [
                    _buildInputField(
                      controller: _emailController,
                      labelText: 'Email',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.0.h),
                    _buildInputField(
                      controller: _passwordController,
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: 20.0.h),
                    Container(
                      height: 40.h, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.9)
                            .w, // 90% of screen width
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            _login(
                                context, _emailController, _passwordController);
                          },
                          label: const Text(
                              'Login'), // Use label instead of child for extended button
                          backgroundColor:
                              AppColors.primaryColor, // Background color
                          foregroundColor:
                              Colors.black, // Color of the text/icon
                          shape: RoundedRectangleBorder(
                            // Shape of the button
                            borderRadius:
                                BorderRadius.circular(8.0.r), // Rounded corners
                          ),
                          elevation: 5.0, // Elevation of the button
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0.h),
                    GestureDetector(
                        onTap: () => {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (_) => const SignupScreen()),
                              )
                            },
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "New User ? ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Signup",
                              style: TextStyle(
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}

Widget _buildInputField({
  required String labelText,
  required IconData prefixIcon,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
  required TextEditingController controller,
}) {
  return Container(
    height: 40, // Adjust the height as needed
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      border: Border.all(color: Colors.grey),
    ),
    child: TextFormField(
      controller: controller,
      style: const TextStyle(
        fontSize: 14,
        color: Colors.white, // Set text color to white
      ),
      // controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(
            vertical: 8), // Adjust the content padding as needed
        labelText: labelText,
        labelStyle: const TextStyle(
            color: Colors.white), // Set label text color to white
        prefixIcon: Icon(prefixIcon,
            color: Colors.white), // Set prefix icon color to white
        border: InputBorder.none,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    ),
  );
}
