import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/constants.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final VoidCallback onRegister;
  final VoidCallback onLoginPressed;
  final Function(String) showError;

  const RegisterForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.onRegister,
    required this.onLoginPressed,
    required this.showError,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildRegisterTitleText(),
              const SizedBox(height: 40),
              _buildNameInputField(),
              const SizedBox(height: 20),
              _buildEmailInputField(),
              const SizedBox(height: 20),
              _buildPasswordInputField(),
              const SizedBox(height: 20),
              _buildConfirmPasswordInputField(),
              const SizedBox(height: 50),
              _buildRegisterSubmitButton(context),
              const SizedBox(height: 40),
              _buildSignUpLink(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterTitleText() {
    return const Center(
      child: Text(
        'Registrar',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    bool obscureText = false,
    IconData? prefixIcon,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(40)),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(40),
          borderSide: const BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildNameInputField() =>
      _buildInputField(controller: nameController, label: 'Nome', prefixIcon: Icons.person,);

  Widget _buildEmailInputField() =>
      _buildInputField(controller: emailController, label: 'Email', prefixIcon: Icons.email,);

  Widget _buildPasswordInputField() => _buildInputField(
    controller: passwordController,
    label: 'Senha',
    obscureText: true,
    prefixIcon: Icons.lock,
  );

  Widget _buildConfirmPasswordInputField() => _buildInputField(
    controller: confirmPasswordController,
    label: 'Confirme Senha',
    obscureText: true,
    prefixIcon: Icons.lock,
  );

  Widget _buildRegisterSubmitButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onRegister,
        style: ElevatedButton.styleFrom(
          backgroundColor: Constants.secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
        child: const Text(
          "Registrar",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return TextButton(
      onPressed: onLoginPressed,
      child: RichText(
        text: const TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(text: "Já tem conta? "),
            TextSpan(text: "Login", style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}