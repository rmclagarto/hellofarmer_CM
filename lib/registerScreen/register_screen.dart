import 'package:flutter/material.dart';
import 'package:hellofarmer_app/constants.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colorGreen),
      body: Center(child: Text("Register screen")),
    );
  }
}
