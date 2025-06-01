import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/app_images.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/auth/widgets/login_form.dart';
import 'package:hellofarmer_app/features/routes/app_routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _handleLogin() {
    // Logica de autenticação

    Navigator.popAndPushNamed(context, AppRoutes.home);
  }


  Widget _buildLogoHeaderImage() {
    return Center(
      child: Image(
        image: AssetImage(AppImages.splash_logo),
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(
          children: [
            _buildLogoHeaderImage(),
            Expanded(
              child: Center(
                child: LoginForm(
                  emailController: _emailController,
                  passwordController: _passwordController,
                  onLogin: _handleLogin,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
