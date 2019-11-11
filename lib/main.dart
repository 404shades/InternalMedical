import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:medibuddy/Design/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.black,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.transparent.withOpacity(0.7)
    ));
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montseratt',
       
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF495aff)
      ),
      home: LoginScreen()
    );
  }
}

