import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  final LatLng initialPosition;
  final double initialZoom;

  const MapWidget({
    Key? key,
    this.initialPosition = const LatLng(38.7169, -9.1399), // Lisboa
    this.initialZoom = 16.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: initialPosition,
        initialZoom: initialZoom,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://cartodb-basemaps-a.global.ssl.fastly.net/light_all/{z}/{x}/{y}.png',

          // userAgentPackageName: 'com.seuprojeto.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: initialPosition,
              width: 40,
              height: 40,
              child: Container(
                width: 4,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 3),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
