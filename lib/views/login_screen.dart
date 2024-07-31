import 'package:dinissa/util/app_constant.dart';
import 'package:dinissa/views/home_screen.dart';
import 'package:dinissa/views/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../util/app_colors.dart';


class LoginScreen extends StatefulWidget{
  @override
  State<LoginScreen> createState() => _loginScreen();
}

class _loginScreen extends State<LoginScreen>{

final TextEditingController _email_controller = TextEditingController();
final TextEditingController _password_controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _password_controller.addListener(() {
      // print('Password: ${_password_controller.text}');
    });
    _email_controller.addListener(() {
      // print('Email: ${_email_controller.text}');
    });
  }

   @override
  void dispose() {
    _password_controller.dispose();
    _email_controller.dispose();
    super.dispose();
  }

void _login(BuildContext context, TextEditingController _emailController, TextEditingController _passwordController) {
  var email = _emailController.text;
  var pass = _passwordController.text;

  if (email != '1' && pass != '1') {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('No Internet Connection!'),
      ),
    );
  }
}

@override
  Widget build(BuildContext context) {
    return(
    Scaffold(
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
            Image.asset("assets/images/undraw_walking_in_rain_vo9p 2.png",
            height: (MediaQuery.of(context).size.height * 0.30).h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0.h),
              child: Text(AppName,
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
                    controller: _email_controller,
                    labelText: 'Email',
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  SizedBox(height: 20.0.h),
                  _buildInputField(
                    controller: _password_controller,
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
                child:Container(
                  width: (MediaQuery.of(context).size.width * 0.9).w, // 90% of screen width
                  child: FloatingActionButton.extended(
                    onPressed: () {
                     _login(context, _email_controller, _password_controller);
                    },
                    label: Text('Login'), // Use label instead of child for extended button
                    backgroundColor: AppColors.primaryColor, // Background color
                    foregroundColor: Colors.black, // Color of the text/icon
                    shape: RoundedRectangleBorder( // Shape of the button
                      borderRadius: BorderRadius.circular(8.0.r), // Rounded corners
                    ),
                    elevation: 5.0, // Elevation of the button
                  ),
                ),
              ),
                  SizedBox(height: 10.0.h),
                  GestureDetector(
                    onTap: ()=>{
                    Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (_) => SignupScreen()),
                    )
                    },
                    child: Row(
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
                    )
                  )

                ],
              ),
            ),
          ],
        ),
      )
    )
    );
  }

}
Widget _buildInputField({
  required String labelText,
  required IconData prefixIcon,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text, required TextEditingController controller,
}) {
  return Container(
    height: 40, // Adjust the height as needed
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16.0),
      border: Border.all(color: Colors.grey),
    ),
    child: TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: 14,
        color: Colors.white, // Set text color to white
      ),
      // controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 8), // Adjust the content padding as needed
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white), // Set label text color to white
        prefixIcon: Icon(prefixIcon, color: Colors.white), // Set prefix icon color to white
        border: InputBorder.none,
      ),
      obscureText: obscureText,
      keyboardType: keyboardType,
    ),
  );
}
