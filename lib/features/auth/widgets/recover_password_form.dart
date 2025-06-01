import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/app_images.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/routes/app_routes.dart';


class RecoverPasswordForm extends StatelessWidget {
  final TextEditingController emailController;
  final VoidCallback onSendPressed;
  final VoidCallback onBackToLogin;

  const RecoverPasswordForm({
    super.key,
    required this.emailController,
    required this.onSendPressed,
    required this.onBackToLogin,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildForgetPasswordTitleText(),
              const SizedBox(height: 40),
              _buildEmailInputField(),
              const SizedBox(height: 50),
              _buildSendRecoveryLinkButton(context),
              const SizedBox(height: 80),
              _buildSignUpLink(context),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildForgetPasswordTitleText() {
    return const Center(
      child: Text(
        'Recuperar Senha',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildEmailInputField() {
    return TextFormField(
      controller: emailController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildSendRecoveryLinkButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onSendPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Constants.secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: const Text(
          "Enviar Link de Recuperação",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return TextButton(
      onPressed: onBackToLogin,
      child: RichText(
        text: const TextSpan(
          style: TextStyle(color: Constants.textColor, fontSize: 16),
          children: [
            TextSpan(text: "Lembrou-se da senha? "),
            TextSpan(
              text: "Voltar ao Login", 
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}