import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/routes/app_routes.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista dentro do build para poder usar o context nas funções onTap
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.shopping_basket,
        'title': 'Mercado',
        'onTap': () {
          Navigator.pop(context);
          // ação para Mercado
        },
      },
      {
        'icon': Icons.shop,
        'title': 'Loja',
        'onTap': ()  {
          Navigator.pop(context);
          // await Future.delayed(const Duration(milliseconds: 30));
          Navigator.pushNamed(context, AppRoutes.previewAds);
        },
      },
      {
        'icon': Icons.announcement_rounded,
        'title': 'Anúncios',
        'onTap': () async {
          Navigator.pop(context);
          await Future.delayed(const Duration(milliseconds: 30));
          Navigator.pushNamed(context, AppRoutes.payAds);
        },
      },
      {
        'icon': Icons.notifications,
        'title': 'Notificação',
        'onTap': () {
          Navigator.pop(context);
          // ação para Notificações
        },
      },
      {
        'icon': Icons.help,
        'title': 'Ajuda',
        'onTap': () {
          Navigator.pop(context);
          // ação para Ajuda
        },
      },
      {
        'icon': Icons.settings,
        'title': 'Definições',
        'onTap': () {
          Navigator.pop(context);
          // ação para Definições
        },
      },

      {
        'icon': Icons.logout,
        'title': 'Sair',
        'onTap': () {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(context, AppRoutes.login);
          // ação para Definições
        },
      },
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Constants.primaryColor),
            child: Text(
              "bem-vindo Teste",
              style: TextStyle(color: Constants.textColor, fontSize: 24),
            ),
          ),
          ...menuItems.map((item) {
            return ListTile(
              leading: Icon(item['icon']),
              title: Text(item['title']),
              onTap: item['onTap'],
            );
          }).toList(),
        ],
      ),
    );
  }
}
