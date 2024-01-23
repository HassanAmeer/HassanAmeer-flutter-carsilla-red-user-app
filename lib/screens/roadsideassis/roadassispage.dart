import 'dart:async';

import 'package:carsilla/screens/roadsideassis/roadassispage2.dart';
import 'package:carsilla/widgets/headerwithimg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../res/theme.dart';
import '../../services/toast.dart';
import '../../widgets/btn.dart';
import '../../widgets/header.dart';
import '../../widgets/textfeild.dart';

class RoadAssisPage extends StatefulWidget {
  final String? cityName;
  final String? locationName;
  final LatLng? currentPosition;
  const RoadAssisPage(
      {super.key,
      this.cityName = '',
      this.locationName = '',
      this.currentPosition});

  @override
  State<RoadAssisPage> createState() => _RoadAssisPageState();
}

class _RoadAssisPageState extends State<RoadAssisPage> {
  TextEditingController catgController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  late LatLng currentPosition;
  String userName = '';
  String userPhone = '';
  String userEmail = '';
  ///////////////////////////////////////
  Completer<GoogleMapController> gmapControllerCompleter =
      Completer<GoogleMapController>();
  Set<Marker> markers = {};
  Future<void> determinePosition() async {
    addressController.text = widget.locationName!;
    currentPosition = LatLng(
        widget.currentPosition!.latitude, widget.currentPosition!.longitude);

    setState(() {
      markers.add(Marker(
          markerId: const MarkerId('current_location'),
          position: currentPosition,
          infoWindow: InfoWindow(title: userName.toString())));
    });
    GoogleMapController controller = await gmapControllerCompleter.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(currentPosition, 15));
  }

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
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.115 / 1,
            color: MainTheme.primaryColor,
            // child: Icon(Icons.padding),
          ),
          Transform.translate(
            offset: Offset(
              0,
              -MediaQuery.of(context).size.height * 0.1 / 1,
            ),
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/roadassistance.png'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01 / 1,
                    ),

                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Text(
                          "Category".toUpperCase(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      height: 45,
                      child: GestureDetector(
                        onTap: () async {
                          await showCatgAlertF();
                        },
                        child: CustomTextFormField(
                          controller: catgController,
                          hintText: "Choose Your Category",
                          onTap: () {},
                          suffix: GestureDetector(
                            onTap: () {
                              showCatgAlertF();
                            },
                            child: Transform.rotate(
                                angle: 4.65,
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.grey.shade400.withOpacity(0.7),
                                )),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ////////////
                    Row(
                      children: [
                        Text(
                          "where to pick up".toUpperCase(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      controller: addressController,
                      hintText: "Your Address",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.3 / 1,
                      child: GoogleMap(
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
                      height: 18,
                    ),
                    MainButton(
                      onclick: () {
                        if (catgController.text.isEmpty) {
                          showtoastF(context, 'Choose Category');
                        } else if (addressController.text.isEmpty) {
                          showtoastF(context, 'Choose Category');
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RoadAssisPage2(
                                  catg: catgController.text,
                                  userLoc: widget.locationName,
                                  userLocLatLng: widget.currentPosition,
                                  toPickUpLoc: addressController.text,
                                  toLocLatLng: currentPosition),
                            ),
                          );
                        }
                      },
                      width: double.infinity,
                      label: "REQUEST YOUR ORDER",
                    ),
                    const SizedBox(
                      height: 18,
                    ),
                  ],
                ),
              ),
            ),
          ),
          /////////// end container rounded
        ],
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
        addressController.text = locationName;
      });
    }
  }

  showCatgAlertF() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, widget) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Center(child: Text('Category')),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 1,
                      child:
                          Divider(thickness: 0.6, color: Colors.grey.shade400)),
                  CupertinoListTile(
                      onTap: () {
                        setState(() {
                          catgController.text = 'Toyota';
                        });
                        Navigator.pop(context);
                      },
                      title: const Text('Toyota')),
                  SizedBox(
                      height: 1,
                      child:
                          Divider(thickness: 0.6, color: Colors.grey.shade400)),
                  CupertinoListTile(
                      onTap: () {
                        setState(() {
                          catgController.text = 'Civic';
                        });
                        Navigator.pop(context);
                      },
                      title: const Text('Civic')),
                  SizedBox(
                      height: 1,
                      child:
                          Divider(thickness: 0.6, color: Colors.grey.shade400)),
                  CupertinoListTile(
                      onTap: () {
                        setState(() {
                          catgController.text = 'Honda';
                        });
                        Navigator.pop(context);
                      },
                      title: const Text('Honda')),
                  SizedBox(
                      height: 1,
                      child:
                          Divider(thickness: 0.6, color: Colors.grey.shade400)),
                ],
              ),
            );
          });
        });
  }
}
