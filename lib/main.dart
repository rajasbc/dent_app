import 'package:flutter/material.dart';

import 'Dash_boardpage.dart';
import 'Login_Screen.dart';
// import 'login screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
 

 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      home:const loginscreen(),
      );
  }
}
 
