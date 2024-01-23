import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../services/checkradiusdistance.dart';

class ShowMapPage extends StatefulWidget {
  const ShowMapPage({Key? key}) : super(key: key);

  @override
  State<ShowMapPage> createState() => _ShowMapPageState();
}

class _ShowMapPageState extends State<ShowMapPage> {
  GoogleMapController? mapController;
  bool isMapInit = false;

  @override
  void initState() {
    super.initState();
    HelpersC().checkLocationPermission(context);
    getlocf();
  }

  double currentLat = 31.511900543125236;
  double currentLon = 74.43805270740967;

  ///// get locatiion
  getlocf() async {
    Position currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLat = currentLocation.latitude;
    currentLon = currentLocation.longitude;
    setState(() {
      isMapInit = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isMapInit
          ? Expanded(
              child: GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('map loaded'),
                      duration: const Duration(seconds: 5),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ),
                    ),
                  );
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    currentLat,
                    currentLon,
                  ),
                  zoom: 14.0,
                ),
                myLocationEnabled: true,
                markers: <Marker>{
                  Marker(
                    markerId: const MarkerId("userLocation"),
                    position: LatLng(
                      currentLat,
                      currentLon,
                    ),
                    infoWindow: const InfoWindow(title: "Your Location"),
                  ),
                },
              ),
            )
          : SizedBox(
              height: 160,
              width: MediaQuery.of(context).size.width * 0.92 / 1,
              child: Image.asset(
                'assets/images/map.png',
                fit: BoxFit.cover,
              ),
            ),
    );
  }
}
