import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/app_images.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/routes/app_routes.dart';
import 'package:hellofarmer_app/services/users.dart';
import 'package:hellofarmer_app/services/auth_service.dart';

class AppDrawer extends StatelessWidget {
  final User user;

  const AppDrawer({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context); // Guarda o NavigatorState
    final String userName = user.email;
    final String userPhotoUrl = AppImages.agricultor;

    // Lista dentro do build para poder usar o context nas funções onTap
    final List<Map<String, dynamic>> menuItems = [
      {
        'icon': Icons.shopping_basket,
        'title': 'Mercado',
        'onTap': () {
          navigator.pop();
          // ação para Mercado
        },
      },
      {
        'icon': Icons.shop,
        'title': 'Loja',
        'onTap': () {
          navigator.pop();
          navigator.pushNamed(AppRoutes.previewAds);
        },
      },
      {
        'icon': Icons.announcement_rounded,
        'title': 'Anúncios',
        'onTap': () async {
          navigator.pop();
          await Future.delayed(const Duration(milliseconds: 30));
          navigator.pushNamed(AppRoutes.payAds);
        },
      },
      {
        'icon': Icons.notifications,
        'title': 'Notificação',
        'onTap': () {
          navigator.pop();
          // ação para Notificações
        },
      },
      {
        'icon': Icons.help,
        'title': 'Ajuda',
        'onTap': () {
          navigator.pop();
          // ação para Ajuda
        },
      },
      {
        'icon': Icons.settings,
        'title': 'Definições',
        'onTap': () {
          navigator.pop();
          // ação para Definições
        },
      },
      {
        'icon': Icons.logout,
        'title': 'Sair',
        'onTap': () async {
          await AuthService().logout();
          navigator.pop();
          navigator.pushReplacementNamed(AppRoutes.login);
        },
      },
    ];

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Constants.primaryColor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(userPhotoUrl),
                ),
                const SizedBox(height: 10),
                Text(
                  userName,
                  style: const TextStyle(
                    color: Constants.textColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ...menuItems.map((Map<String, dynamic> item) => ListTile(
              leading: Icon(item['icon'] as IconData),
              title: Text(item['title'] as String),
              onTap: item['onTap'] as VoidCallback,
            ),
          ),
        ],
      ),
    );
  }
}
