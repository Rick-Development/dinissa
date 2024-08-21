import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../util/api_url.dart';
import '../util/app_colors.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var user = {}.obs;
  var token = ''.obs;

  void setUserData(Map<String, dynamic> data) {
    user.value = data['user'];
    token.value = data['token'];
  }


  String get fullName => user['full_name'] ?? 'Unknown';
  String get balance => user['balance'] ?? '0 NGN';

  Future<void> signUp(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController,
      TextEditingController cpasswordController,
      TextEditingController nameController,
      TextEditingController phoneController,
      ) async {
    final email = emailController.text;
    final password = passwordController.text;
    final cpassword = cpasswordController.text;
    final name = nameController.text;
    final phone = phoneController.text;

    if (password != cpassword) {
      ScaffoldMessenger.of(context).showSnackBar(
       const  SnackBar(
          content: Text('Passwords do not match'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
          duration: Duration(seconds: 5),
        ),
      );
      return;
    }

    try {
      // Make the POST request for sign-up
      dio.Response response = await dio.Dio().post(
        ApiUrl.signup,
        data: {
          'email': email,
          'password': password,
          'name': name,
          'phone': phone,
        },
      );
      // print(response);

      if (response.statusCode == 200) {
        print(response);
        // Create a user in Firebase Authentication
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Store additional user data in Firestore
        await _firestore.collection('users').doc(userCredential.user!.uid).set({
          'email': email,
          'name': name,
          'phone': phone,
        });

        print('Sign up successful');
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        // Handle errors
        var responseData = response.data;
        var errorMessage = '';

        if (responseData.containsKey('error')) {
          var error = responseData['error'];
          if (error is Map) {
            error.forEach((key, value) {
              if (value is List && value.isNotEmpty) {
                errorMessage += "${value.join(', ')}\n";
              }
            });
          }
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(errorMessage.trim()),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            duration: Duration(seconds: 5),
          ),
        );
      }
    } catch (e) {
      print('Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Fill all the form'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        ),
      );
    }
  }

  void login(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController,
      ) async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      // Make the POST request for login
      dio.Response response = await dio.Dio().post(
        ApiUrl.login,
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        print(response.data);
        var responseData = response.data;
        // Check if there are any errors in the response data
        if (responseData['error'] != null && responseData['error'].isNotEmpty) {
          var error = responseData['error'];

          String errorMessage = '';

          if (error is Map) {
            if (error.containsKey('message')) {
              errorMessage = error['message'];
            } else {
              error.forEach((key, value) {
                if (value is List && value.isNotEmpty) {
                  errorMessage += "${value.join(', ')}\n";
                }
              });
            }
          }

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                errorMessage.trim(),
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: AppColors.danger,
              duration: Duration(seconds: 3),
            ),
          );
        }else {
          var token = responseData['data']['token']!;
          var userData = responseData['data']['user']!;

          // Sign in with Firebase Authentication
          UserCredential userCredential = await _auth
              .signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          // Store additional user data in Firestore
          await _firestore.collection('users')
              .doc(userCredential.user!.uid)
              .set({
            'token': token,
            'email': email,
            'name': userData['full_name'],
            'phone': userData['phone'],
            'account_number': userData['account_number'],
            'balance': userData['balance']
          }, SetOptions(merge: true));

          // No errors, proceed with the data // Get the existing instance or create a new one
          setUserData(responseData['data']);

          print('Login successful');
          // Navigate to the appropriate screen or update UI as needed
          Get.offAllNamed('/dashboard'); // Example route to the dashboard
          // print('Login successful');
          // Navigator.pushReplacementNamed(context, '/dashboard');
        }
      } else {
        // Handle errors
        var responseData = response.data;
        var error = responseData['error'];

        String errorMessage = '';

        if (error is Map) {
          if (error.containsKey('message')) {
            errorMessage = error['message'];
          } else {
            error.forEach((key, value) {
              if (value is List && value.isNotEmpty) {
                errorMessage += "${value.join(', ')}\n";
              }
            });
          }
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              errorMessage.trim(),
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: AppColors.danger,
            duration: Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
       const SnackBar(
          content: Text(
           'Email and Password is required',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.danger,
          duration: Duration(seconds: 3),
        ),
      );
      print('Exception: $e');
      print(email);
      print(password);
    }
  }

  Future<void> authenticateWithToken(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController,
      ) async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      // Retrieve the user document from Firestore
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(email).get();
      if (userDoc.exists) {
        String storedToken = userDoc['token']; // Get the stored token
        // Example: Send token to your server for verification or use it as needed

        // For demonstration, simply re-authenticate the user
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        print('Re-authentication successful');
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User not found'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            duration: Duration(seconds: 5),
          ),
        );
      }
    } catch (e) {
      print('Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Exception: $e'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        ),
      );
    }
  }
}
