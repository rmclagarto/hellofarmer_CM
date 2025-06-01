import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/constants.dart';

class AddToCartButton extends StatelessWidget {
  final VoidCallback onPressed;
  
  const AddToCartButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Constants.primaryColor,
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: const Text(
        'Adicionar ao Carrinho',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}