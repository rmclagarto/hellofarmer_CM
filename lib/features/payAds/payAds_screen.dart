import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/payAds/widget/ad_plan_card.dart';
import 'package:hellofarmer_app/features/payAds/widget/confirm_pay_button.dart';
import 'package:hellofarmer_app/features/payAds/widget/payment_method_card.dart';

class AdPaymentScreen extends StatefulWidget {
  const AdPaymentScreen({super.key});

  @override
  State<AdPaymentScreen> createState() => _AdPaymentScreenState();
}

class _AdPaymentScreenState extends State<AdPaymentScreen> {
  String? _selectedPlan;
  String? _selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: const Text('Pagamento Anúncio'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            
            // Título
            const Center(
              child: Text(
                'Pagamento Anúncio',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
            
            // Planos
            const Text(
              'Planos:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            Row(
              children: [
                // Plano Básico
                Expanded(
                  child: AdPlanCard(
                    title: 'Básico',
                    price: '\$ 4.99',
                    duration: '7 Dias',
                    isSelected: _selectedPlan == 'basic',
                    onTap: () => setState(() => _selectedPlan = 'basic'),
                  ),
                ),
                const SizedBox(width: 16),
                
                // Plano Premium
                Expanded(
                  child: AdPlanCard(
                    title: 'Premium',
                    price: '\$ 12.99',
                    duration: '30 Dias',
                    isSelected: _selectedPlan == 'premium',
                    onTap: () => setState(() => _selectedPlan = 'premium'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Métodos de Pagamento
            const Text(
              'Métodos Pagamento',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            
            Column(
              children: [
                PaymentMethodCard(
                  icon: Icons.credit_card,
                  label: 'VISA',
                  isSelected: _selectedPaymentMethod == 'visa',
                  onTap: () => setState(() => _selectedPaymentMethod = 'visa'),
                ),
                const SizedBox(height: 8),
                PaymentMethodCard(
                  icon: Icons.account_balance,
                  label: 'MB-way',
                  isSelected: _selectedPaymentMethod == 'mb',
                  onTap: () => setState(() => _selectedPaymentMethod = 'mb'),
                ),
                const SizedBox(height: 8),
                PaymentMethodCard(
                  icon: Icons.payment,
                  label: 'Pay',
                  isSelected: _selectedPaymentMethod == 'pay',
                  onTap: () => setState(() => _selectedPaymentMethod = 'pay'),
                ),
              ],
            ),
            const SizedBox(height: 32),
            
            // Botão Confirmar
            ConfirmPaymentButton(
              isEnabled: _selectedPlan != null && _selectedPaymentMethod != null,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Pagamento processado com sucesso!'),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}