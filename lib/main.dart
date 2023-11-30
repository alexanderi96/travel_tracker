import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'models/user_management.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserManagement userManagement = UserManagement();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Management Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(userManagement: userManagement),
    );
  }
}
