import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/shared_prefs_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hellofarmer_app/core/app_images.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/routes/app_routes.dart';

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
      precacheImage(const AssetImage(AppImages.logo), context).then((_) {
        _checkLoginState();
      });
    });
  }

  void _checkLoginState() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final isLoggedIn = prefs.getBool(SharedPrefsKeys.isLoggedIn) ?? false;

      Timer(Duration(seconds: 3), () {
        if (!mounted) return;
        Navigator.pushReplacementNamed(
          context,
          isLoggedIn ? AppRoutes.home : AppRoutes.login,
        );
      });
    } catch (e) {
      debugPrint("Erro ao verificar login: $e");
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: const Center(child: Image(image: AssetImage(AppImages.logo))),
    );
  }
}
