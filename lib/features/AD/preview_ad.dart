import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/AD/widgets/add_to_cart_button.dart';
import 'package:hellofarmer_app/features/AD/widgets/delivery_option.dart';
import 'package:hellofarmer_app/features/AD/widgets/description_section.dart';
import 'package:hellofarmer_app/features/AD/widgets/price_quantity_low.dart';
import 'package:hellofarmer_app/features/AD/widgets/product_header.dart';
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
            
            PriceQuantityRow(
              quantity: 8,
              unit: '8 Litros',
              pricePerUnit: 3.50,
            ),
            const SizedBox(height: 24),
            
            DescriptionSection(
              description: 'Balde de zinco com capacidade de 8 litros. Resistente, '
                          'durável e ideal para uso doméstico em ambientes rurais ou '
                          'coletivos. Fabricado em zinco de alta qualidade.',
            ),
            const SizedBox(height: 24),
            
            const Text(
              'Opções de Entrega',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            DeliveryOption(
              onTap: () => debugPrint('Entrega selecionada'),
            ),
            const SizedBox(height: 24),
            
            const Text(
              'Dados do Vendedor',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            SellerInfo(
              sellerName: 'Nome do Vendedor',
              rating: '4.8 ★ (120)',
              onTap: () => debugPrint('Vendedor selecionado'),
            ),
            const SizedBox(height: 32),
            
            AddToCartButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Produto adicionado ao carrinho')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}