// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/headerwithimg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../res/theme.dart';
import '../../services/checkradiusdistance.dart';
import '../../vm/profilevm.dart';
import '../../widgets/bottomnavbar.dart';
import 'homeassi.dart';
import 'roadassispage.dart';

class RoadSideAssisPage extends StatefulWidget {
  const RoadSideAssisPage({super.key});

  @override
  State<RoadSideAssisPage> createState() => _RoadSideAssisPageState();
}

class _RoadSideAssisPageState extends State<RoadSideAssisPage> {
  GoogleMapController? mapController;
  // LocationData? currentLocation;
  @override
  void initState() {
    super.initState();
    initF();
    HelpersC().checkLocationPermission(context);
    determinePosition();
  }

  bool isInitMap = false;

  String userName = '';
  String locationName = '';
  String cityName = '';

  late LatLng currentPosition;

  ///////////////////////////////////////
  Completer<GoogleMapController> gmapControllerCompleter =
      Completer<GoogleMapController>();
  Set<Marker> markers = {
    // Marker(
    //     markerId: const MarkerId('id1'),
    //     position: const LatLng(31.582045, 74.329376),
    //     draggable: true,
    //     flat: true,
    //     icon: BitmapDescriptor.defaultMarkerWithHue(50.6),
    //     infoWindow: const InfoWindow(title: 'Driver location1')),
  };
  Future<void> determinePosition() async {
    // bool serviceEnabled;
    // LocationPermission permission;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Location services are disabled.'),
    //       duration: Duration(seconds: 2),
    //     ),
    //   );
    // }

    // permission = await Geolocator.checkPermission();
    // if (permission == LocationPermission.denied) {
    //   permission = await Geolocator.requestPermission();
    //   if (permission == LocationPermission.denied) {
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text('Location permissions are denied.'),
    //         duration: Duration(seconds: 2),
    //       ),
    //     );
    //     return;
    //   }
    // }

    // if (permission == LocationPermission.deniedForever) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Location permissions are permanently denied.'),
    //       duration: Duration(seconds: 2),
    //     ),
    //   );
    //   return;
    // }

    Position position = await Geolocator.getCurrentPosition();
    currentPosition = LatLng(position.latitude, position.longitude);
    // BitmapDescriptor customMarker = await createCustomMarkerFromImage(
    //   IconAssets.markred,
    // );
    setState(() {
      markers.add(Marker(
          markerId: const MarkerId('current_location'),
          position: currentPosition,
          infoWindow: InfoWindow(title: userName.toString()),
          // icon: customMarker,
          draggable: true,
          onDragEnd: (value) {
            setState(() {
              currentPosition = LatLng(value.latitude, value.longitude);
            });
          }));
      isInitMap = true;
    });
    _handleTapOnMap(currentPosition);
    GoogleMapController controller = await gmapControllerCompleter.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(currentPosition, 15));
  }
  // InvoicesVmC

  // Future<BitmapDescriptor> createCustomMarkerFromImage(String imagePath) async {
  //   final ByteData byteData = await rootBundle.load(imagePath);
  //   final Uint8List imageData = byteData.buffer.asUint8List();
  //   final BitmapDescriptor bitmapDescriptor =
  //       BitmapDescriptor.fromBytes(imageData);
  //   return bitmapDescriptor;
  // }

// AIzaSyA7DwS07ALxveomntaOK2cCybUPCcjqZA8
// AIzaSyAj-Y4mL2Vk_PgMpgD0fOh9wvyHGITjMew
  initF() async {
    ProfileVmC vmvalueval = Provider.of<ProfileVmC>(context, listen: false);
    if (vmvalueval.prfiledata.isEmpty) {
      await vmvalueval.checkProfileVmF(context, '0301234567');
    }
    userName = vmvalueval.prfiledata[0]['fname'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return HeaderWithImage(
      title: 'Home or Road Assistance',
      marginToTopHeadeImg: 0.02,
      marginbodyfrombottom: 0.08,
      headeimg: ImageAssets.roadassistance1,
      navbar: const NavBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //           builder: (context) => const ShowMapPage(),
            //         ),
            //       );
            //     },
            //     child: const Text('show map')),
            const SizedBox(
              height: 6,
            ),

            Row(
              children: [
                Text(
                  "Choose Type of Assistance",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MainTheme.primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 06),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 43.9 / 100,
                    height: MediaQuery.of(context).size.height * 13 / 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 148, 3, 3),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          overlayColor: MaterialStateProperty.all(
                              Colors.blueGrey.shade900),
                          splashFactory: InkRipple.splashFactory),
                      onPressed: isInitMap == false
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeAssisPage(
                                    locationName: locationName,
                                    currentPosition: currentPosition,
                                    cityName: cityName,
                                  ),
                                ),
                              );
                            },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/home 1.png'),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Home Assistance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )),
                const Spacer(),
                Container(
                    width: MediaQuery.of(context).size.width * 43.9 / 100,
                    height: MediaQuery.of(context).size.height * 13 / 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 148, 3, 3),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          overlayColor: MaterialStateProperty.all(
                              Colors.blueGrey.shade900),
                          splashFactory: InkRipple.splashFactory),
                      onPressed: isInitMap == false
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RoadAssisPage(
                                    locationName: locationName,
                                    currentPosition: currentPosition,
                                    cityName: cityName,
                                  ),
                                ),
                              );
                            },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/Shape.png'),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Road Assistance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Text(
                    "Your current Location",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: MainTheme.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10),
                  isInitMap == false
                      ? const SizedBox(
                          height: 10,
                          width: 10,
                          child: CircularProgressIndicator(strokeWidth: 1))
                      : const Text(''),
                ],
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.21 / 1,
              child:
                  //  Text(
                  //   'API Key Disabled For Google Map',
                  //   style: Theme.of(context)
                  //       .textTheme
                  //       .labelMedium!
                  //       .copyWith(color: Colors.deepOrange),
                  // )
                  GoogleMap(
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                initialCameraPosition: const CameraPosition(
                    target: LatLng(31.582045, 74.329376), zoom: 13),
                // compassEnabled: true,
                scrollGesturesEnabled: true,
                mapToolbarEnabled: true,
                mapType: MapType.normal,
                markers: markers,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,
                onTap: (argument) async {
                  setState(() {
                    currentPosition =
                        LatLng(argument.latitude, argument.longitude);
                    markers.clear();
                    markers.add(Marker(
                        markerId: const MarkerId('current_location'),
                        position: currentPosition,
                        infoWindow: InfoWindow(title: userName),
                        // icon: customMarker,
                        draggable: true,
                        onDragEnd: (value) async {
                          setState(() {
                            currentPosition =
                                LatLng(value.latitude, value.longitude);
                          });
                        }));

                    //////// call
                    _handleTapOnMap(currentPosition);
                  });
                },
                onMapCreated: (GoogleMapController controller) {
                  gmapControllerCompleter.complete(controller);
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color.fromARGB(255, 243, 240, 240),
                child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.grey.shade500,
                ),
              ),
              title: Text(
                cityName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(locationName),
            ),

            ///////////////// end slider
          ],
        ),
      ),
    );
  }
  //////////////

  // bool isunder500meters = false;
  // /////////////
  // void calculateAndDisplayDistance(context) async {
  //   try {
  //     double maxDistance = 0.5; // 500 meters in kilometers
  //     Position currentLocation = await Geolocator.getCurrentPosition(
  //         // desiredAccuracy: LocationAccuracy.high,
  //         );
  //     double currentLat = currentLocation.latitude;
  //     double currentLon = currentLocation.longitude;
  //     double targetLat = 31.511900543125236;
  //     double targetLong = 74.43805270740967;

  //     double distance = HelpersC()
  //         .calculateDistance(currentLat, currentLon, targetLat, targetLong);
  //     // For Miles: devide Kilometers / to 1.609 ;
  //     //  final milesDistance = Convert.decimalendpointsf(distance / 1.609, 3).toString();
  //     if (distance <= maxDistance) {
  //       isunder500meters = true;
  //     } else {
  //       isunder500meters = false;
  //     }
  //     //////////////
  //     debugPrint('Distance to destination: $distance km');
  //   } catch (e) {
  //     debugPrint('${e}when calculate distance');
  //   }
  // }

  ///////////////
  void _handleTapOnMap(LatLng position) async {
    // Perform reverse geocoding to get location name
    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      setState(() {
        cityName = placemarks[0].locality ?? "Unknown";
        String street = placemarks[0].street ?? "Unknown";
        String sublocality = placemarks[0].subLocality ?? "Unknown";
        locationName = '$sublocality $street';
      });
    }
  }
}
