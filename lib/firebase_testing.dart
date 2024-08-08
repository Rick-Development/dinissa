

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  const MyApp();
}


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }

  @override
  @override
  State<MyApp> createState() => _MyAppScreenState();


}

class _MyAppScreenState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('hello firebase'),
      ),

    );
  }

}