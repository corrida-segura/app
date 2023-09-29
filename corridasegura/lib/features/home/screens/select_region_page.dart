import 'dart:async';
import 'package:corridasegura/constants/images.dart';
import 'package:corridasegura/features/home/controller/filter_controller.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class SelectRegionPage extends StatefulWidget {
  final bool? firstTime;
  const SelectRegionPage({super.key, this.firstTime});

  @override
  State<SelectRegionPage> createState() => _SelectRegionPageState();
}

class _SelectRegionPageState extends State<SelectRegionPage> {
  final FilterController filterController = Get.find<FilterController>();
  LatLng? selectedPosition;
  bool _isMounted = false;
  LatLng motorista = const LatLng(0, 0);
  String? mapStyle;
  late BitmapDescriptor motoristaIcon;
  bool loading = false;

  final Completer<GoogleMapController> _controller = Completer();

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
    try {
      bool isLocationServiceEnabled =
          await Geolocator.isLocationServiceEnabled();
      if (isLocationServiceEnabled) {
        LocationPermission permission = await Geolocator.checkPermission();
        if (permission == LocationPermission.denied) {
          permission = await Geolocator.requestPermission();
          if (permission == LocationPermission.denied) {
            Get.snackbar('Erro', 'Não foi possível obter sua localização');
            return;
          }
        }
        if (permission == LocationPermission.deniedForever) {
          Get.snackbar('Erro', 'Não foi possível obter sua localização');
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
        Get.snackbar(
            'Localização', 'Por favor, ative o serviço de localização');
        await Future.delayed(const Duration(seconds: 3));
        await Geolocator.openLocationSettings();
        if (_isMounted) {
          setState(() {
            _getLocation();
          });
        }
      }
    } catch (e) {
      // Handle the exception here
      Get.snackbar('Erro', 'Erro ao obter sua localização');
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

  Future<String?> getNeighborhoodName(LatLng position) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );
      if (placemarks.isNotEmpty) {
        return placemarks.first.subLocality;
      }
    } catch (e) {
      return null;
    }

    return null;
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
                onTap: (LatLng position) async {
                  setState(() {
                    selectedPosition = position;
                  });
                  String? local = (await getNeighborhoodName(position)) ?? '';
                  await Future.delayed(const Duration(milliseconds: 400));
                  Get.back(result: local);
                },
                onLongPress: (LatLng position) {
                  setState(() {
                    selectedPosition = null;
                  });
                },
                circles: selectedPosition != null
                    ? {
                        Circle(
                          circleId: const CircleId('blockedRegion'),
                          center: selectedPosition!,
                          radius:
                              500, // Set the desired radius of the circle in meters
                          fillColor: Colors.blue.withOpacity(0.5),
                          strokeColor: Colors.blue,
                          strokeWidth: 2,
                        ),
                      }
                    : <Circle>{},
                markers: {
                  Marker(
                    markerId: const MarkerId('motorista'),
                    position: motorista,
                    icon: motoristaIcon,
                  ),
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
