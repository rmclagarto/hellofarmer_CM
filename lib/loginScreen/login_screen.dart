import 'package:flutter/material.dart';
import 'package:hellofarmer_app/constants.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colorGreen),
      // body: Center(child: Image.asset(logoTipo)),
    );
  }
}
