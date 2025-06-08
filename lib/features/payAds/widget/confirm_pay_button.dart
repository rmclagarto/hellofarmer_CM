import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/constants.dart';

class ConfirmPaymentButton extends StatelessWidget {
  final bool isEnabled;
  final VoidCallback onPressed;

  const ConfirmPaymentButton({
    super.key,
    required this.isEnabled,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Constants.primaryColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          
        ),
        onPressed: isEnabled ? onPressed : null,
        child: const Text(
          'Confirmar',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}