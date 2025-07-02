import 'package:flutter/material.dart';
import 'package:post_hub_app/auth/login_page.dart';
import 'package:post_hub_app/auth/register_page.dart';

class AuthPageCheck extends StatefulWidget {
  const AuthPageCheck({super.key});

  @override
  State<AuthPageCheck> createState() => _AuthPageCheckState();
}

class _AuthPageCheckState extends State<AuthPageCheck> {
  bool showLoginPage = true;

  void toggelScreen() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showLoginPage: toggelScreen);
    } else {
      return RegisterPage(
        showSignUpPage: toggelScreen,
      );
    }
  }
}
