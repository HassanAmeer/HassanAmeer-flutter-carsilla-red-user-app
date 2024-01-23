import 'dart:async';

import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../res/theme.dart';
import '../../services/userstorage.dart';
import '../../vm/roadsideassis.dart';
import 'roadassisstepper.dart';

class RoadAssisPage2 extends StatefulWidget {
  final String? catg;
  final String? userLoc;
  final LatLng? userLocLatLng;
  final String? toPickUpLoc;
  final LatLng? toLocLatLng;
  const RoadAssisPage2(
      {super.key,
      this.catg = '',
      this.userLoc = '',
      this.userLocLatLng,
      this.toPickUpLoc = '',
      this.toLocLatLng});

  @override
  State<RoadAssisPage2> createState() => _RoadAssisPage2State();
}

class _RoadAssisPage2State extends State<RoadAssisPage2> {
  TextEditingController pickupcontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();
  late LatLng currentPosition;

  ///////////////////////////////////////
  Completer<GoogleMapController> gmapControllerCompleter =
      Completer<GoogleMapController>();
  Set<Marker> markers = {};
  Future<void> determinePosition() async {
    currentPosition =
        LatLng(widget.toLocLatLng!.latitude, widget.toLocLatLng!.longitude);

    setState(() {
      markers.add(Marker(
          markerId: const MarkerId('current_location'),
          position: currentPosition,
          infoWindow: InfoWindow(title: userName.toString())));
    });
    GoogleMapController controller = await gmapControllerCompleter.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(currentPosition, 15));
  }

  String userName = '';
  String locationName = '';
  String cityName = '';

  @override
  void initState() {
    super.initState();
    determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Road Assistance',
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Text(
                    "nearby service provider",
                    // "Searching for nearby service provider \nPlease Wait.....",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: MainTheme.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.92 / 1,
            //   // height: 150,
            //   child: Image.asset(
            //     ImageAssets.map3,
            //     fit: BoxFit.cover,
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.5 / 1,
              child: GoogleMap(
                initialCameraPosition: const CameraPosition(
                    target: LatLng(31.582045, 74.329376), zoom: 13),
                // compassEnabled: true,
                scrollGesturesEnabled: true,
                mapToolbarEnabled: true,
                mapType: MapType.normal,
                markers: markers,
                zoomControlsEnabled: true,
                zoomGesturesEnabled: true,

                onMapCreated: (GoogleMapController controller) {
                  gmapControllerCompleter.complete(controller);
                },
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Transform.translate(
              offset: Offset(0, -MediaQuery.of(context).size.height * 0.04 / 1),
              child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade400.withOpacity(0.7),
                          offset: const Offset(0, -2),
                          blurRadius: 10)
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        const Center(
                            child: Icon(Icons.horizontal_rule_rounded)),
                        Row(
                          children: [
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.13 / 1,
                              child: Image.asset('assets/images/fromto.png'),
                            ),
                            Transform.translate(
                              offset: const Offset(0, -10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'PICKUP',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.userLoc!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    height: 5,
                                    width: MediaQuery.of(context).size.width *
                                        0.7 /
                                        1,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 0.5,
                                                color: Colors.grey.shade400))),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    'Drop-off',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .copyWith(
                                            color: Colors.grey.shade400,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.toPickUpLoc!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium!
                                        .copyWith(
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w400),
                                  ),
                                  Container(
                                    height: 5,
                                    width: MediaQuery.of(context).size.width *
                                        0.7 /
                                        1,
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                width: 0.5,
                                                color: Colors.grey.shade400))),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04 / 1,
                        ),
                        MainButton(
                          onclick: () async {
                            //  "user_id",
                            //       "category",
                            //       "when_pickup_date",
                            //       "from_pickup_address",
                            //       "from_address_lat",
                            //       "from_address_lng",
                            //       "where_pickup_address",
                            //       "where_address_lat",
                            //       "where_address_lng",
                            //       "time",
                            //       "invoice_id"

                            Map data = {
                              "user_id": await StorageClass.getuseridf(),
                              "category": widget.catg!,
                              // "when_pickup_date": dateVal,
                              "from_pickup_address": widget.userLoc,
                              "from_address_lat":
                                  widget.userLocLatLng!.latitude,
                              "from_address_lng":
                                  widget.userLocLatLng!.longitude,
                              "where_pickup_address": widget.toPickUpLoc,
                              "where_address_lat": widget.toLocLatLng!.latitude,
                              "where_address_lng":
                                  widget.toLocLatLng!.longitude,
                              // "time": timeVal,
                            };
                            await RoadSideAssisVmC()
                                .sendRoadAssisVmF(data, context);

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const RoadAssisStepperPage(),
                              ),
                            );
                          },
                          width: double.infinity,
                          label: "Next",
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

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
