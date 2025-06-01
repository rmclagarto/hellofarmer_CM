import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/app_images.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/auth/widgets/register_form.dart';
import 'package:hellofarmer_app/features/home/screen/home_screen.dart';
import 'package:hellofarmer_app/features/auth/screens/login_screen.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Erro'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _registerUser() async {
    // TO-DO [Completar]
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    // Implementar lógica de registro
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Home()),
    );
  }

  bool _validateFields() {
    final email = _emailController.text.trim();
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (email.isEmpty || !emailRegex.hasMatch(email)) {
      _showErrorDialog('Insira um email válido.');
      return false;
    }

    if (password.isEmpty || confirmPassword.isEmpty) {
      _showErrorDialog('Por favor, preencha os campos de senha.');
      return false;
    }

    if (password != confirmPassword) {
      _showErrorDialog('As senhas não coincidem!');
      return false;
    }
    return true;
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
                child: RegisterForm(
                  nameController: _nameController,
                  emailController: _emailController,
                  passwordController: _passwordController,
                  confirmPasswordController: _confirmPasswordController,
                  onRegister: () {
                    if (_validateFields()) {
                      _registerUser();
                    }
                  },
                  onLoginPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Login()),
                    );
                  },
                  showError: _showErrorDialog,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}