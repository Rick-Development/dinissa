import 'package:flutter/material.dart';

class UsableTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final TextInputType keyboardType;

  const UsableTextField({super.key, 
    required this.controller,
    required this.label,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        // color: Colors.white60,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: const Color(0XFFdae5f7).withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        style: const TextStyle(
          backgroundColor: Colors.transparent,
        ),
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none, // Remove the default border
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0), // Adjust padding if needed
        ),
        obscureText: obscureText,
        keyboardType: keyboardType,
      ),
    );
  }
}
