import 'package:dinissa/routes/app_routes.dart';
import 'package:dinissa/views/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/app_colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void signUp(BuildContext context, TextEditingController emailController,
      TextEditingController passwordController) {
    var email = emailController.text;
    var pass = passwordController.text;

    if (email == '1' && pass == '1') {
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
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image.asset("assets/images/Sun.png",
              //   fit: BoxFit.fill,
              //   width: MediaQuery.of(context).size.width,
              // ),
              SizedBox(
                height: 35.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
                child: Column(
                  children: [
                    _buildInputField(
                      controller: TextEditingController(),
                      labelText: 'FirstName',
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.0.h),
                    _buildInputField(
                      controller: TextEditingController(),
                      labelText: 'LastName',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.0.h),
                    _buildInputField(
                      controller: _emailController,
                      labelText: 'Username',
                      prefixIcon: Icons.person,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.0.h),
                    _buildInputField(
                      controller: TextEditingController(),
                      labelText: 'Email',
                      prefixIcon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(height: 20.0.h),
                    _buildInputField(
                      controller: TextEditingController(),
                      labelText: 'Password',
                      prefixIcon: Icons.lock,
                      obscureText: true,
                    ),
                    SizedBox(height: 20.0.h),
                    Container(
                      height: 40, // Adjust the height as needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0.r),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: SizedBox(
                        width: (MediaQuery.of(context).size.width * 0.9)
                            .w, // 90% of screen width
                        child: FloatingActionButton.extended(
                          onPressed: () {
                            signUp(
                                context, _emailController, _passwordController);
                          },
                          label: const Text(
                              'SignUp'), // Use label instead of child for extended button
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
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (_) => const LoginScreen()),
                              )
                            },
                        child: const Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Registered User ? ",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "Login",
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
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
}) {
  return Container(
    height: 40, // Adjust the height as needed
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0.r),
      border: Border.all(color: Colors.grey),
    ),
    child: TextFormField(
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.white, // Set text color to white
      ),
      // controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
            vertical: 8.h), // Adjust the content padding as needed
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
