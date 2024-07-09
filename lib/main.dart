// ignore_for_file: prefer_const_constructors, unnecessary_new

// import 'package:fc_22_akshit_madan_bloc_api_requests_app/features/home/home_page.dart';
import 'package:flutter/material.dart';

import 'features/home/home_page.dart';

void main() async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
