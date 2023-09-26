import 'dart:async';

import 'package:corridasegura/constants/colors.dart';
import 'package:corridasegura/constants/images.dart';
import 'package:corridasegura/constants/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapPage extends StatefulWidget {
  final bool? firstTime;
  const MapPage({super.key, this.firstTime});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  bool _isMounted = false;
  LatLng motorista = const LatLng(0, 0);
  String? mapStyle;
  late BitmapDescriptor motoristaIcon;
  bool loading = false;

  final Completer<GoogleMapController> _controller = Completer();

  final origin = const LatLng(-16.601746322085198, -49.26196239332546);
  final destination = const LatLng(-16.677207143419842, -49.24370496206215);
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    super.initState();
    _isMounted = true;

    //getPolyPoints(origin, destination);
    DefaultAssetBundle.of(context)
        .loadString('assets/dark_map_style.json')
        .then(
          (value) => {mapStyle = value},
        );
    _getLocation();
    _startLocationMonitoring();
    _loadCustomLocationIcon();
    loading = true;
  }

  @override
  void dispose() {
    _isMounted = false;
    super.dispose();
  }

  Future<void> _getLocation() async {
    bool isLocationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (isLocationServiceEnabled) {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          Get.snackbar('Erro', 'Não foi possivel obter sua localização');
          return;
        }
      }
      if (permission == LocationPermission.deniedForever) {
        Get.snackbar('Erro', 'Não foi possivel obter sua localização');
        return;
      }
      Position position = await Geolocator.getCurrentPosition();
      if (_isMounted) {
        setState(() {
          motorista = LatLng(position.latitude, position.longitude);
          loading = false;
        });
      }
    } else {
      Get.snackbar('Localização', 'Por favor, ative o serviço de localização');
      await Future.delayed(const Duration(seconds: 3));
      await Geolocator.openLocationSettings();
      if (_isMounted) {
        setState(() {
          _getLocation();
        });
      }
    }
  }

  void _startLocationMonitoring() {
    Geolocator.getPositionStream().listen((Position position) {
      if (_isMounted) {
        setState(() {
          motorista = LatLng(position.latitude, position.longitude);
        });
      }
    });
  }

  Future<void> _loadCustomLocationIcon() async {
    motoristaIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration.empty,
      tCar,
    );
  }

  void getPolyPoints(origin, destination) async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        apiKey,
        PointLatLng(origin.latitude, origin.longitude),
        PointLatLng(destination.latitude, destination.longitude));

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      }
      if (_isMounted) {
        setState(() {});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: loading
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Image.asset(tLogoImage),
                  Visibility(
                    visible: widget.firstTime ?? true,
                    child: Text('Bem vindo',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                ])
          : Scaffold(
              body: GoogleMap(
                myLocationButtonEnabled: true,
                mapToolbarEnabled: false,
                zoomControlsEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: motorista,
                  zoom: 14,
                ),
                polylines: {
                  Polyline(
                    polylineId: const PolylineId('route'),
                    points: polylineCoordinates,
                    color: tRouteColor,
                    width: 4,
                  ),
                },
                markers: {
                  Marker(
                    markerId: const MarkerId('motorista'),
                    position: motorista,
                    icon: motoristaIcon,
                  ),
                  /* Marker(markerId: const MarkerId('origem'), position: origin),
                  Marker(
                      markerId: const MarkerId('destino'),
                      position: destination), */
                },
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _controller.complete(controller);
                  controller.setMapStyle(mapStyle);
                },
              ),
            ),
    );
  }
}
