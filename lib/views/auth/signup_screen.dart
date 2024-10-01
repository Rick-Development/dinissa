// lib/views/auth/signup_screen.dart
import 'package:dinissa/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../util/app_colors.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
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
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.black,
        title: Image.asset('assets/images/Sun2.png'),
        automaticallyImplyLeading: false,
      ),
      body:
        // Image.asset('assets/images/Sun2.png'),
        Container(
        color: AppColors.secondaryColor,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
           children: [
             SizedBox(
              width: MediaQuery.of(context).size.width * 1.5, // 1.5 times the screen width
              child: Image.asset(
                'assets/images/Sun2.png',
                fit: BoxFit.cover, // Or BoxFit.fill, depending on your needs
              ),
            ),
            SizedBox(height:MediaQuery.of(context).size.height * .15),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0.w),
              child: Column(
                children: [
                  // Full anme
                  _buildInputField(
                    controller: _nameController,
                    labelText: 'Your name',
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.text,
                  ),
                  SizedBox(height: 20.0.h), _buildInputField(
                    controller: _phoneController,
                    labelText: 'Your phone',
                    prefixIcon: Icons.call,
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 20.0.h),
                  // email
                  _buildInputField(
                    controller: _emailController,
                    labelText: 'Your Email',
                    prefixIcon: Icons.mail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 20.0.h),
                  _buildInputField(
                    controller: _passwordController,
                    labelText: 'Your Password',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                  ), SizedBox(height: 20.0.h),
                  _buildInputField(
                    controller: _cpasswordController,
                    labelText: 'Confirm Password',
                    prefixIcon: Icons.lock,
                    obscureText: true,
                  ),
                  SizedBox(height: 20.0.h),
                  Container(
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0.r),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: SizedBox(
                      width: (MediaQuery.of(context).size.width * 0.9).w,
                      child: FloatingActionButton.extended(
                        onPressed: () {
                          _authController.signUp(
                            context,
                            _emailController,
                            _passwordController,
                            _cpasswordController,
                            _phoneController,
                            _nameController
                          );
                        },
                        label: const Text('SignUp'),
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0.r),
                        ),
                        elevation: 5.0,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0.h),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    ),
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Registered User ? ", style: TextStyle(color: Colors.white)),
                        Text("Login", style: TextStyle(color: AppColors.primaryColor)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
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
      height: 50,
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
          contentPadding: EdgeInsets.symmetric(vertical: 1.h),
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
