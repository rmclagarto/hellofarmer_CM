// import 'package:flutter/material.dart';
// import 'package:hellofarmer_app/core/constants.dart';
// import 'package:hellofarmer_app/features/routes/app_routes.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:hellofarmer_app/features/home/widgets/notification_button.dart';
// import 'package:hellofarmer_app/features/home/widgets/notification_panel.dart';
// class Home extends StatefulWidget {
//   const Home({super.key});
//   @override
//   State<Home> createState() => _HomeState();
// }
// class _HomeState extends State<Home> {
//   bool _showNotifications = false;
//   final List<String> _notifications = [
//     'Nova mensagem recebida',
//     'Seu pedido foi enviado',
//     'Promoção especial esta semana',
//     'Atualização do aplicativo disponível'
//   ];
//   Widget _buildNotificationButton() {
//   return NotificationButton(notificationCount: notificationCount.length, onPressed: () {
//     setState(() {
//       _showNotifications != _showNotifications;
//     });
//   });
// }
//   Widget _buildDrawerHeader() {
//     return DrawerHeader(
//       decoration: const BoxDecoration(
//         color: Constants.primaryColor, // Cor de fundo do cabeçalho
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           const Text(
//             'User Name',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 5),
//           Text(
//             'A minha conta',
//             style: TextStyle(color: Colors.white, fontSize: 14),
//           ),
//         ],
//       ),
//     );
//   }
//   Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
//     return ListTile(
//       leading: Icon(icon, color: Colors.black),
//       title: Text(title),
//       onTap: onTap,
//     );
//   }
//   Widget _buildDrawer(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           _buildDrawerHeader(),
//           _buildDrawerItem(Icons.shopping_basket, 'Mercado', () {
//             Navigator.pop(context);
//             // Navegar para Mercado
//           }),
//           _buildDrawerItem(Icons.store, 'Loja', () {
//             Navigator.pop(context);
//             // Navegar para Loja
//           }),
//           _buildDrawerItem(Icons.announcement, 'Anúncios', () {
//             Navigator.pop(context);
//             // Navegar para Anúncios
//           }),
//           _buildDrawerItem(Icons.notifications, 'Notificação', () {
//             Navigator.pop(context);
//             // Navegar para Notificações
//           }),
//           _buildDrawerItem(Icons.help, 'Ajuda', () {
//             Navigator.pop(context);
//             // Navegar para Ajuda
//           }),
//           _buildDrawerItem(Icons.settings, 'Definições', () {
//             Navigator.pop(context);
//             // Navegar para Definições
//           }),
//           const Divider(),
//           _buildDrawerItem(Icons.exit_to_app, 'Sair', () {
//             Navigator.pop(context);
//             // Implementar lógica de logout
//             _logout(context);
//           }),
//         ],
//       ),
//     );
//   }
//   void _logout(BuildContext context) {
//     // Navegar para a tela de login usando rotas nomeadas
//     Navigator.pushNamedAndRemoveUntil(
//       context,
//       AppRoutes.login,
//       (Route<dynamic> route) => false, // Remove todas as rotas anteriores
//     );
//   }
//   Widget _buildMap() {
//     return FlutterMap(
//       options: MapOptions(
//         center: LatLng(38.736946, -9.142685), // Coordenadas de Lisboa (exemplo)
//         zoom: 13.0,
//       ),
//       children: [
//         TileLayer(
//           urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
//           userAgentPackageName: 'com.example.app',
//         ),
//         MarkerLayer(
//           markers: [
//             Marker(
//               point: LatLng(38.736946, -9.142685), // Posição do marcador
//               builder: (ctx) => const Icon(Icons.location_pin, color: Colors.red, size: 40),
//             ),
//           ],
//         ),
//       ],
//     );
//   }
//   Widget _buildSearchBar() {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: TextField(
//         decoration: InputDecoration(
//           hintText: 'Pesquisar...',
//           prefixIcon: const Icon(Icons.search),
//           filled: true,
//           fillColor: Colors.white,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide.none,
//           ),
//           contentPadding: const EdgeInsets.symmetric(vertical: 0),
//         ),
//       ),
//     );
//   }
//   Widget _buildFeaturedProducts() {
//     return SizedBox(
//       height: 150,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: 5,
//         itemBuilder: (context, index) {
//           return Container(
//             width: 120,
//             margin: const EdgeInsets.all(8),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.3),
//                   spreadRadius: 2,
//                   blurRadius: 5,
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 Expanded(
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(10),
//                     child: Image.asset(
//                       'assets/images/product_${index + 1}.jpg', // Substitua por suas imagens
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(4.0),
//                   child: Text(
//                     'Produto ${index + 1}',
//                     style: const TextStyle(fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
//   @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: const Text('Hello Farmer'),
//       backgroundColor: Constants.primaryColor,
//       actions: [_buildNotificationButton()],
//     ),
//     drawer: _buildDrawer(context),
//     body: Stack(
//       children: [
//         _buildMap(),
//         Positioned(
//           top: 10,
//           left: 0,
//           right: 0,
//           child: _buildSearchBar(),
//         ),
//         Positioned(
//           bottom: 0,
//           left: 0,
//           right: 0,
//           child: Container(
//             height: 180,
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.5),
//                   spreadRadius: 3,
//                   blurRadius: 7,
//                 ),
//               ],
//             ),
//             child: Column(
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'Produtos em Destaque',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 Expanded(child: _buildFeaturedProducts()),
//               ],
//             ),
//           ),
//         ),
//         // Adicione este novo Positioned para as notificações
//         if (_showNotifications)
//           Positioned(
//             top: kToolbarHeight + 10, // Abaixo da AppBar
//             right: 10,
//             width: MediaQuery.of(context).size.width * 0.7,
//             child: Material(
//               elevation: 4,
//               borderRadius: BorderRadius.circular(10),
//               child: Container(
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: [
//                     const Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: Text(
//                         'Notificações',
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     const Divider(),
//                     if (_notifications.isEmpty)
//                       const Padding(
//                         padding: EdgeInsets.all(8.0),
//                         child: Text('Nenhuma notificação'),
//                       )
//                     else
//                       ..._notifications.map((notification) => ListTile(
//                         title: Text(notification),
//                         leading: const Icon(Icons.notifications_none, size: 20),
//                         dense: true,
//                         visualDensity: VisualDensity.compact,
//                       )).toList(),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//       ],
//     ),
//   );
// }
// }

import 'package:flutter/material.dart';
import 'package:hellofarmer_app/core/constants.dart';
import 'package:hellofarmer_app/features/home/widgets/app_drawer.dart';
import 'package:hellofarmer_app/features/home/widgets/bottom_panel.dart';
import 'package:hellofarmer_app/features/home/widgets/map_widget.dart';
import 'package:hellofarmer_app/features/home/widgets/notification_button.dart';
import 'package:hellofarmer_app/features/home/widgets/notification_panel.dart';
import 'package:hellofarmer_app/features/home/widgets/search_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TextEditingController searchController = TextEditingController();

  // Simulando uma lista de notificações
  final List<String> _notifications = [
    "Notificação 1: Pedido enviado",
    "Notificação 2: Novo anúncio disponível",
  ];

  void _showNotifications() {
    showModalBottomSheet(
      context: context,
      builder: (context) => NotificationPanel(notifications: _notifications),
    );
  }

  @override
  Widget build(BuildContext context) {
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
      drawer: const AppDrawer(),
      body: Stack(
        children: [
          const MapWidget(),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: CustomSearchBar(searchController: searchController),
          ),
        ],
      ),
    );
  }
}
