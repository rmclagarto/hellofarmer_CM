import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/app_images.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/routes/app_routes.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLogin;
  final bool isLoading;
  final String? errorMessage;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLogin,
    this.isLoading = false,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Constants.borderRadiusCard)),
      child: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildTitle(),
              const SizedBox(height: Constants.spacingMedium),
              _buildEmailField(),
              const SizedBox(height: Constants.spacingMedium),
              _buildPasswordField(),
              const SizedBox(height: Constants.spacingSmall),
              _buildForgotPassword(context),
              const SizedBox(height: Constants.spacingMedium),
              _buildLoginButton(),
              const SizedBox(height: Constants.spacingLarge),
              _buildDivider(),
              const SizedBox(height: Constants.spacingLarge),
              _buildSocialButtons(),
              const SizedBox(height: Constants.spacingMedium),
              _buildSignUp(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return const Text(
      Constants.loginTitle,
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: emailController,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(Constants.borderRadiusLarge)),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.borderRadiusLarge),
          borderSide: BorderSide(color: Colors.grey),
        )
      ),
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: passwordController,
      obscureText: true,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        labelText: 'Senha',
        prefixIcon: const Icon(Icons.lock),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(Constants.borderRadiusLarge)),
        filled: true,
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Constants.borderRadiusLarge),
          borderSide: BorderSide(color: Colors.grey),
        ),
      ),
    );
  }

  Widget _buildForgotPassword(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed:
            () => Navigator.pushReplacementNamed(
              context,
              AppRoutes.recoverPassword,
            ),
        child: const Text(
          Constants.forgotPassword,
          style: TextStyle(color: Constants.textColor, fontSize: 14),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onLogin,
        style: ElevatedButton.styleFrom(
          backgroundColor: Constants.secondaryColor,
          padding: const EdgeInsets.symmetric(vertical: Constants.buttonVerticalPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Constants.spacingLarge),
          ),
        ),
        child: const Text(
          Constants.loginButton,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(Constants.orDivider),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSocialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _socialBtn('Google'),
        const SizedBox(width: 16),
        _socialBtn('Facebook'),
        const SizedBox(width: 16),
        _socialBtn('IOS'),
      ],
    );
  }

  Widget _socialBtn(String name) {
    String assetPath;
    switch (name) {
      case 'Google':
        assetPath = AppImages.googleLogo;
        break;
      case 'Facebook':
        assetPath = AppImages.facebbokLogo;
        break;
      case 'IOS':
        assetPath = AppImages.iosLogo;
        break;
      default:
        assetPath = 'assets/default_logo.png';
    }

    return ElevatedButton(
      onPressed: () {},

      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Image(
        image: AssetImage(assetPath),
        height: 24,
        width: 24,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildSignUp(BuildContext context) {
    return TextButton(
      onPressed:
          () => Navigator.pushReplacementNamed(context, AppRoutes.register),
      child: RichText(
        text: const TextSpan(
          style: TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(text: Constants.notAMember),
            TextSpan(text: Constants.signUpNow, style: TextStyle(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
