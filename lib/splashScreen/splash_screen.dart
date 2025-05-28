import 'package:flutter/material.dart';
import 'package:hellofarmer_app/constants.dart';
import 'package:hellofarmer_app/homeScreen/home_screen.dart';
import 'package:hellofarmer_app/loginScreen/login_screen.dart';
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Precarregar a imagem antes de iniciar o temporizador
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage(logoTipo), context).then((_) {
        _checkLoginState();
      });
    });
  }

  void _checkLoginState() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

    Timer(Duration(seconds: 3), () {
      if (!mounted) return;
      if (isLoggedIn) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(colorGreen),
      body: const Center(
        child: Image(
          image: AssetImage(logoTipo),
        ),
      ),
    );
  }
}
