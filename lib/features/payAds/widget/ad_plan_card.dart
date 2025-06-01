import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/constants.dart';

class AdPlanCard extends StatelessWidget {
  final String title;
  final String price;
  final String duration;
  final bool isSelected;
  final VoidCallback onTap;

  const AdPlanCard({
    super.key,
    required this.title,
    required this.price,
    required this.duration,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? Constants.primaryColor : Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? Constants.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isSelected ? Constants.primaryColor : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              price,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: isSelected ? Constants.primaryColor : Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              duration,
              style: TextStyle(
                color: isSelected ? Constants.primaryColor : Colors.grey[600],
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Select',
              style: TextStyle(
                color: isSelected ? Constants.primaryColor : Colors.grey[600],
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}