// lib/controllers/auth_controller.dart
import 'package:flutter/material.dart';

class AuthController {
  // final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signUp(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController,
      ) async {
    final email = emailController.text;
    final password = passwordController.text;

    try {
      // await _auth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, '/main_screen');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
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
      // await _auth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.pushReplacementNamed(context, '/main_screen');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.toString()}')),
      );
    }
  }
}
