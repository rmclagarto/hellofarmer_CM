import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/app_images.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/AD/widgets/add_to_cart_button.dart';
import 'package:hellofarmer_app/features/AD/widgets/delivery_option.dart';
import 'package:hellofarmer_app/features/AD/widgets/description_section.dart';
import 'package:hellofarmer_app/features/AD/widgets/price_quantity_low.dart';
import 'package:hellofarmer_app/features/AD/widgets/product_header.dart';
import 'package:hellofarmer_app/features/AD/widgets/product_image.dart';
import 'package:hellofarmer_app/features/AD/widgets/seller_info.dart';

class PreviewAd extends StatelessWidget {
  const PreviewAd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const Text('HelloFarmer'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ProductHeader(productName: 'Balde Zinco 8 Litros'),
            const SizedBox(height: 16),

            ProductImage(imagePath: AppImages.produto),

            const SizedBox(height: 16),

            PriceQuantityRow(quantity: 8, unit: '8 Litros', pricePerUnit: 3.50),
            const SizedBox(height: 24),

            DescriptionSection(
              description:
                  'Balde de zinco com capacidade de 8 litros. Resistente, '
                  'durável e ideal para uso doméstico em ambientes rurais ou '
                  'coletivos. Fabricado em zinco de alta qualidade.',
            ),
            const SizedBox(height: 24),

            const Text(
              'Opções de Entrega',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            DeliveryOption(onTap: () => debugPrint('Entrega selecionada')),
            const SizedBox(height: 24),

            const Text(
              'Dados do Vendedor',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),

            SellerInfo(
              sellerName: 'Artindo Feliz',
              rating: '4.8 ★ (120)',
              onTap: () {
                // Add what should happen when the seller info is tapped
                debugPrint('Seller info tapped');
              },
              address: '801 Pennsylvania Ave. SE, Washington, DC 20003, EUA',
              phone: '+351 999 999 999',
            ),

            const SizedBox(height: 32),

            // ... resto do código permanece igual ...
            AddToCartButton(
              onPressed: () {
                // Add what should happen when the button is pressed
                debugPrint('Add to cart button pressed');
                // Typically you would add logic to add the item to cart here
              },
            ),
          ],
        ),
      ),
    );
  }
}
