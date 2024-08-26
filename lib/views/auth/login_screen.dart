import 'package:dinissa/controllers/auth_controller.dart';
import 'package:dinissa/views/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthController _authController = AuthController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.12,
              ),
              Image.asset(
                "assets/images/walker.png",
                height: (MediaQuery.of(context).size.height * 0.30).h,
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0.w),
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
                      height: 50.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16.0.r),
                        color: AppColors.primaryColor,
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          _authController.login(
                            context,
                            _emailController,
                            _passwordController,
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
                          shape: WidgetStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0.r),
                            ),
                          ),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0.h),
                    GestureDetector(
                      onTap: () => Get.off(const SignupScreen()), // Using Get for navigation
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("New User? ", style: TextStyle(color: Colors.white)),
                          Text("Signup", style: TextStyle(color: AppColors.primaryColor)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
      ),
      backgroundColor: AppColors.secondaryColor
    );
  }

  Widget _buildInputField({
    required String labelText,
    required IconData prefixIcon,
    bool obscureText = false,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0.r),
        border: Border.all(color: Colors.grey),
      ),
      child: TextFormField(
        controller: controller,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.white,
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          prefixIcon: Icon(prefixIcon, color: Colors.white),
          border: InputBorder.none,
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }
}
