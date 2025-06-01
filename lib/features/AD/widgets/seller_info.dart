import 'package:flutter/material.dart';

class SellerInfo extends StatelessWidget {
  final String sellerName;
  final String rating;
  final VoidCallback onTap;
  
  const SellerInfo({
    super.key,
    required this.sellerName,
    required this.rating,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: const CircleAvatar(
          child: Icon(Icons.person),
        ),
        title: Text(sellerName),
        subtitle: Text('Avaliação: $rating'),
      ),
    );
  }
}