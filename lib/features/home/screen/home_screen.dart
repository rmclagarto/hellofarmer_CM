import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/home/widgets/app_drawer.dart';
import 'package:hellofarmer_app/features/home/widgets/bottom_panel.dart';
import 'package:hellofarmer_app/features/home/widgets/map_widget.dart';
import 'package:hellofarmer_app/features/home/widgets/notification_button.dart';
import 'package:hellofarmer_app/features/home/widgets/notification_panel.dart';
import 'package:hellofarmer_app/features/home/widgets/search_bar.dart';
import 'package:hellofarmer_app/services/users.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();

  late final User user;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    user = ModalRoute.of(context)!.settings.arguments as User;
  }

  // Simulando uma lista de notificações
  final List<String> _notifications = [
    "Notificação 1: Pedido enviado",
    "Notificação 2: Novo anúncio disponível",
  ];

  final List<String> _ads = [
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",

    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
    "Anúncio 1: Vendo batatas biológicas",
    "Anúncio 2: Serviço de colheita disponível",
    "Anúncio 3: Aluguer de trator",
  ];

  void _showNotifications() {
    showModalBottomSheet(
      context: context,
      builder: (context) => NotificationPanel(notifications: _notifications),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as User;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Center(child: Text('Hello Farmer')),
        actions: [
          NotificationButton(
            notificationCount: _notifications.length,
            onPressed: _showNotifications, // alterar aqui para a função
          ),
        ],
      ),
      drawer: AppDrawer(user: user),
      body: Stack(
        children: [
          const MapWidget(),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: CustomSearchBar(searchController: searchController),
          ),
          BottomPanel(ads: _ads),
        ],
      ),
    );
  }
}
