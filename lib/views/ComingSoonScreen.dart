import 'package:flutter/material.dart';

import '../util/app_colors.dart';

class ComingSoonScreen extends StatefulWidget{
  const ComingSoonScreen({super.key});

  @override
  State<ComingSoonScreen> createState() => _comingSoonScreenState();


}

class _comingSoonScreenState extends State<ComingSoonScreen>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: AppColors.primaryColor,

      ),
      body: const Center(
        child: Text("Coming soon..."),
      ),

    );
  }
}