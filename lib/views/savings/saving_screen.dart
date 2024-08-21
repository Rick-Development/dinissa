




import 'package:dinissa/util/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SavingScreen extends StatefulWidget{
  const SavingScreen({super.key});
  @override
  State <SavingScreen> createState() => _savingScreenState();
}



class _savingScreenState extends State<SavingScreen>{

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