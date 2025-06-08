import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/app_images.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/auth/widgets/login_form.dart';
import 'package:hellofarmer_app/features/routes/app_routes.dart';
import 'package:hellofarmer_app/services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final AuthService _authService = AuthService();
  bool _isLoading = false;
  String? _errorMessage;

  Future<void> _handleLogin() async {
    // Logica de autenticação

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "Por Favor entre com o Email e Senha";
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      final user = await _authService.login(email, password);
      if (!mounted) return;

      Navigator.pushReplacementNamed(context, AppRoutes.home, arguments: user);
    } catch (e) {
      setState(() {
        _errorMessage = e.toString().replaceFirst('Exception: ', '');
        _isLoading = false;
      });
    }
  }

  Widget _buildLogoHeaderImage() {
    return Center(
      child: Image(
        image: AssetImage(AppImages.splashLogo),
        height: 100,
        fit: BoxFit.contain,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                  isLoading: _isLoading,
                  errorMessage: _errorMessage,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
