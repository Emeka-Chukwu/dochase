import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/src/screens/login.dart';
import '';

void main() {
  runApp(MyApp());
}
// void main() => runApp(GetMaterialApp(home: Home()));

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Dochase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
