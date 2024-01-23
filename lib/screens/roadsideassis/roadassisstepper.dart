import 'dart:async';

import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../../vm/profilevm.dart';
import 'homeorroadassisopage.dart';

// class RoadAssisStepperPage extends StatelessWidget {
//   const RoadAssisStepperPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Header(
//         title: 'Road Assistance',
//         body: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.height * .03 / 1,
//               ),
//               SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.9 / 1,
//                   child: Image.asset(ImageAssets.steper1)),
//               ListTile(
//                 contentPadding: const EdgeInsets.only(top: 10, bottom: 1),
//                 title: Text(
//                   'Calm Down We Are Coming',
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleMedium!
//                       .copyWith(color: Colors.black),
//                 ),
//               ),
//               SizedBox(
//                   width: MediaQuery.of(context).size.width * 0.93 / 1,
//                   child: Image.asset(ImageAssets.map2)),
//               SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
//               ListTile(
//                 contentPadding:
//                     const EdgeInsets.only(left: 5, top: 0, bottom: 0),
//                 title: Text(
//                   'Name',
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleMedium!
//                       .copyWith(color: Colors.grey.shade700),
//                 ),
//                 subtitle: Padding(
//                   padding: const EdgeInsets.only(top: 5.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'Piff jenkins',
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleMedium!
//                             .copyWith(
//                                 color: Colors.grey.shade500,
//                                 fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: 1,
//                         child: Divider(
//                           color: Colors.grey.shade400,
//                           thickness: 0.4,
//                           endIndent: 6,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               ListTile(
//                 contentPadding:
//                     const EdgeInsets.only(left: 5, top: 0, bottom: 0),
//                 title: Text(
//                   'Phone Number',
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleMedium!
//                       .copyWith(color: Colors.grey.shade700),
//                 ),
//                 subtitle: Padding(
//                   padding: const EdgeInsets.only(top: 5.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         '0011 222 333 444',
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleMedium!
//                             .copyWith(
//                                 color: Colors.grey.shade500,
//                                 fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: 1,
//                         child: Divider(
//                           color: Colors.grey.shade400,
//                           thickness: 0.4,
//                           endIndent: 6,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               ListTile(
//                 contentPadding:
//                     const EdgeInsets.only(left: 5, top: 0, bottom: 0),
//                 title: Text(
//                   'E-mail',
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleMedium!
//                       .copyWith(color: Colors.grey.shade700),
//                 ),
//                 subtitle: Padding(
//                   padding: const EdgeInsets.only(top: 5.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'piff@jenkins.com',
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleMedium!
//                             .copyWith(
//                                 color: Colors.grey.shade500,
//                                 fontWeight: FontWeight.w500),
//                       ),
//                       SizedBox(
//                         height: 1,
//                         child: Divider(
//                           color: Colors.grey.shade400,
//                           thickness: 0.4,
//                           endIndent: 6,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }

// import 'dart:async';

// import 'package:carsilla/res/assets.dart';
// import 'package:carsilla/widgets/header.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:provider/provider.dart';

// import '../../vm/profilevm.dart';

class RoadAssisStepperPage extends StatefulWidget {
  final String? whereToPickup;
  final String? catgory;
  final String? cityLoc;
  final LatLng? latLng;
  const RoadAssisStepperPage(
      {super.key,
      this.whereToPickup = '',
      this.catgory = '',
      this.cityLoc = '',
      this.latLng});

  @override
  State<RoadAssisStepperPage> createState() => _RoadAssisStepperPageState();
}

class _RoadAssisStepperPageState extends State<RoadAssisStepperPage> {
  /////////////////////////////////
  late LatLng currentPosition;
  String userName = '';
  String userPhone = '';
  String userEmail = '';
  ///////////////////////////////////////
  Completer<GoogleMapController> gmapControllerCompleter =
      Completer<GoogleMapController>();
  Set<Marker> markers = {};
  Future<void> determinePosition() async {
    currentPosition = LatLng(widget.latLng!.latitude, widget.latLng!.longitude);

    setState(() {
      markers.add(Marker(
          markerId: const MarkerId('current_location'),
          position: currentPosition,
          infoWindow: InfoWindow(title: userName.toString())));
    });
    GoogleMapController controller = await gmapControllerCompleter.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(currentPosition, 15));
  }

  /////////////////////////////////
  initF() async {
    ProfileVmC vmvalueval = Provider.of<ProfileVmC>(context, listen: false);
    if (vmvalueval.prfiledata.isEmpty) {
      await vmvalueval.checkProfileVmF(context, '0301234567');
    }
    userName = vmvalueval.prfiledata[0]['fname'].toString();
    userPhone = vmvalueval.prfiledata[0]['phone'].toString();
    userEmail = vmvalueval.prfiledata[0]['email'].toString();
  }

  /////////////
  @override
  void initState() {
    super.initState();
    initF();
    determinePosition();
  }

  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Road Assistance',
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * .03 / 1,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9 / 1,
                  child: Image.asset(ImageAssets.steper1)),
              ListTile(
                contentPadding: const EdgeInsets.only(top: 10, bottom: 1),
                title: Text(
                  'Calm Down We Are Coming',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.black),
                ),
              ),
              // SizedBox(
              //     width: MediaQuery.of(context).size.width * 0.93 / 1,
              //     child: Image.asset(ImageAssets.map2)),
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

                  onMapCreated: (GoogleMapController controller) {
                    gmapControllerCompleter.complete(controller);
                  },
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              ListTile(
                contentPadding:
                    const EdgeInsets.only(left: 5, top: 0, bottom: 0),
                title: Text(
                  'Name',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey.shade700),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userName,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1,
                        child: Divider(
                          color: Colors.grey.shade400,
                          thickness: 0.4,
                          endIndent: 6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.only(left: 5, top: 0, bottom: 0),
                title: Text(
                  'Phone Number',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey.shade700),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userPhone,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1,
                        child: Divider(
                          color: Colors.grey.shade400,
                          thickness: 0.4,
                          endIndent: 6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                contentPadding:
                    const EdgeInsets.only(left: 5, top: 0, bottom: 0),
                title: Text(
                  'E-mail',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey.shade700),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        userEmail,
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                color: Colors.grey.shade500,
                                fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 1,
                        child: Divider(
                          color: Colors.grey.shade400,
                          thickness: 0.4,
                          endIndent: 6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
