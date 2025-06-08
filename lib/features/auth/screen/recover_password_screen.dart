import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/app_images.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/routes/app_routes.dart';
import 'package:hellofarmer_app/features/auth/widgets/recover_password_form.dart';



class RecoverPassword extends StatefulWidget {
  const RecoverPassword({super.key});

  @override
  State<RecoverPassword> createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  final TextEditingController _emailController = TextEditingController();

  void _handleSendRecoveryLink() {
    // Lógica para envio de link de recuperação
    final email = _emailController.text.trim();
    debugPrint('Recover password requested for email: $email');

    // Implementar chamada ao controller/service
  }

  void _handleBackToLogin() {
    Navigator.pushReplacementNamed(
      context,
      AppRoutes.login,
    );
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
                child: RecoverPasswordForm(
                  emailController: _emailController,
                  onSendPressed: _handleSendRecoveryLink,
                  onBackToLogin: _handleBackToLogin,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
