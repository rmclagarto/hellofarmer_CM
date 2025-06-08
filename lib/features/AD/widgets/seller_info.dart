// import 'package:flutter/material.dart';
// import 'package:hellofarmer_app/core/app_images.dart';

// class SellerInfo extends StatelessWidget {
//   final String sellerName;
//   final String rating;
//   final VoidCallback onTap;
  
//   const SellerInfo({
//     super.key,
//     required this.sellerName,
//     required this.rating,
//     required this.onTap,
//   });


  

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       child: ListTile(
//         contentPadding: EdgeInsets.zero,
//         leading: CircleAvatar(
//           // child: Icon(Icons.person),
//           backgroundImage: AssetImage(AppImages.agricultor),
//         ),
//         title: Text(sellerName),
//         subtitle: Text('Avaliação: $rating'),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/app_images.dart';

class SellerInfo extends StatelessWidget {
  
  final String sellerName;
  final String rating;
  final VoidCallback onTap;
  final String? address; // Novo parâmetro
  final String? phone; // Novo parâmetro// Novo parâmetro para as localizações

  const SellerInfo({
    super.key,
    required this.sellerName,
    required this.rating,
    required this.onTap,
    this.address,
    this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 24,
                  backgroundImage: AssetImage(AppImages.agricultor),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sellerName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      rating,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            
            // Informações de contato
            if (phone != null || address != null) ...[
              const Divider(),
              if (phone != null) _buildInfoRow(Icons.phone, phone!),
              if (address != null) _buildInfoRow(Icons.location_on, address!),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[600]),
          const SizedBox(width: 12),
          Expanded(child: Text(text)),
        ],
      ),
    );
  }
}