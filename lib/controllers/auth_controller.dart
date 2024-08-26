import 'package:flutter/material.dart';
import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import '../util/api_url.dart';
import '../util/app_colors.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final box = GetStorage(); // Initialize GetStorage
  var user = {}.obs;
  var token = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Check if user is already logged in
    if (box.read('isLoggedIn') ?? false) {
      Get.offAllNamed('/dashboard');
    }
  }

  void setUserData(Map<String, dynamic> data) {
    user.value = data['user'];
    token.value = data['token'];
    box.write('isLoggedIn', true); // Store login state
    box.write('userToken', data['token']); // Store token
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
        const SnackBar(
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

      if (response.statusCode == 200) {
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
        setUserData(response.data['data']); // Save user data
        Get.offAllNamed('/dashboard');
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
            margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
            duration: const Duration(seconds: 5),
          ),
        );
      }
    } catch (e) {
      print('Exception: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Fill all the form'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          margin: EdgeInsets.only(top: 10, left: 10, right: 10),
        ),
      );
    }
  }

  Future<void> login(
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
        var token = response.data['data']['token']!;
        var userData = response.data['data']['user']!;

        // Sign in with Firebase Authentication
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
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

        // No errors, proceed with the data
        setUserData(response.data['data']); // Save user data
        print('Login successful');
        Get.offAllNamed('/dashboard'); // Navigate to the dashboard
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
              style: const TextStyle(color: Colors.white),
            ),
            backgroundColor: AppColors.danger,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Email and Password are required',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: AppColors.danger,
          duration: Duration(seconds: 3),
        ),
      );
      print('Exception: $e');
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

        // For demonstration, simply re-authenticate the user
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        print('Re-authentication successful');
        Get.offAllNamed('/dashboard'); // Navigate to dashboard
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
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
          margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        ),
      );
    }
  }
}
