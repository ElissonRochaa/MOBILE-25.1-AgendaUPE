import 'package:calendarioupe/screens/login_screen.dart';
import 'package:calendarioupe/screens/register_screen.dart';
import 'package:flutter/material.dart';


class LoginorsignScreen extends StatefulWidget {
  const LoginorsignScreen({super.key});

  @override
  State<LoginorsignScreen> createState() => _LoginorsignScreenState();
}

class _LoginorsignScreenState extends State<LoginorsignScreen> {

  bool showLoginScreen = true;


  void togglePages() {
    setState(() {
      showLoginScreen = !showLoginScreen;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginScreen) {
      return LoginScreen(
        onTap: togglePages,
      );
    } else {
      return RegisterScreen(
        onTap: togglePages,
      );
    }
  }
}