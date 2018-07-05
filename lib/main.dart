import 'package:flutter/material.dart';
import 'package:phone_auth/routes/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phone Auth',
      theme: ThemeData.dark().copyWith(
            primaryColor: Colors.blueGrey[600],
            accentColor: Colors.deepOrange[200],
          ),
      home: AuthScreen(),
    );
  }
}
