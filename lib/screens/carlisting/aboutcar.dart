import 'package:carsilla/res/assets.dart';
import 'package:carsilla/res/theme.dart';
import 'package:faabul_color_picker/faabul_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../resources/urls.dart';
import '../../services/colorparser.dart';
import '../../widgets/btn.dart';
import '../../widgets/header.dart';
import 'dart:math' as math;

class AboutCarPage extends StatefulWidget {
  final Map? carListingDetails;
  const AboutCarPage({super.key, this.carListingDetails});

  @override
  State<AboutCarPage> createState() => _AboutCarPageState();
}

class _AboutCarPageState extends State<AboutCarPage> {
  List carList = [];
  String degreeImage = '';

  List featuresList = [
    // {'img': IconAssets.features1, 'title': 'Gear', 'subtitle': 'Autometic'},
    // {
    //   'img': IconAssets.features2,
    //   'title': 'Acceleration',
    //   'subtitle': '1.2s 100km/hr'
    // },
    // {'img': IconAssets.features3, 'title': 'Cyl', 'subtitle': '12 Cyl'},
    // {
    //   'img': IconAssets.features4,
    //   'title': 'Climate Control',
    //   'subtitle': 'Autometic'
    // },
    // {'img': IconAssets.features5, 'title': 'open', 'subtitle': 'Gasoline'},
    // {
    //   'img': IconAssets.features6,
    //   'title': 'Seat Heating',
    //   'subtitle': 'Two Seat'
    // },
  ];
  double rotation = 0;

  @override
  void initState() {
    super.initState();

    degreeImage = ApiUrls.imageUrl + widget.carListingDetails!['listing_img1'];
    carList.add(ApiUrls.imageUrl + widget.carListingDetails!['listing_img1']);
    carList.add(ApiUrls.imageUrl + widget.carListingDetails!['listing_img2']);
    carList.add(ApiUrls.imageUrl + widget.carListingDetails!['listing_img3']);
    carList.add(ApiUrls.imageUrl + widget.carListingDetails!['listing_img4']);
    carList.add(ApiUrls.imageUrl + widget.carListingDetails!['listing_img5']);

    featuresList.add({
      'img': IconAssets.features1,
      'title': 'Gear',
      'subtitle': widget.carListingDetails!['features_gear']
    });
    featuresList.add({
      'img': IconAssets.features2,
      'title': 'Mileage',
      'subtitle': widget.carListingDetails!['features_speed']
    });
    featuresList.add({
      'img': IconAssets.features3,
      'title': 'Color',
      'subtitle': widget.carListingDetails!['features_cylinders']
    });
    featuresList.add({
      'img': IconAssets.features4,
      'title': 'Warranty',
      'subtitle': widget.carListingDetails!['features_climate_zone']
    });
    featuresList.add({
      'img': IconAssets.features5,
      'title': 'Fuel Type',
      'subtitle': widget.carListingDetails!['features_fuel_type']
    });
    featuresList.add({
      'img': IconAssets.features6,
      'title': 'Seats',
      'subtitle': widget.carListingDetails!['features_seats']
    });
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'About Car',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onPanUpdate: (details) {
                  setState(() {
                    rotation += details.delta.dx / 300;
                  });
                },
                child: Transform(
                  transform: Matrix4.identity()..rotateY(math.pi * rotation),
                  alignment: FractionalOffset.center,
                  filterQuality: FilterQuality.low,
                  child: Image.network(degreeImage),
                ),
              ),
              // child: Image.asset(TempAssets.carblue),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005 / 1),
            Center(
              child: Image.asset(IconAssets.angle360),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03 / 1),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.14 / 1,
              child: ListView.builder(
                itemCount: carList.length,
                shrinkWrap: true,
                controller: ScrollController(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        setState(() {
                          degreeImage = carList[index];
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.network(carList[index]),
                      ));
                },
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05 / 1),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Row(
                children: [
                  Text(
                    'About Car',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.black),
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text(
                widget.carListingDetails!['listing_desc'],
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.grey.shade600),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Wrap(
                children: featuresList
                    .map((e) => Container(
                          decoration: const BoxDecoration(color: Colors.white),
                          width: MediaQuery.of(context).size.width * 0.46 / 1,
                          child: ListTile(
                            leading: Image.asset(e['img']),
                            title: Text(e['title'],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey.shade500)),
                            subtitle: e['title'] == 'Color'
                                ? FaabulColorSample(
                                    size: 10, color: parseColor(e['subtitle']))
                                : Text(e['subtitle'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.grey.shade900)),
                          ),
                        ))
                    .toList()),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Column(
            //       children: [
            //         Image.asset(IconAssets.features1),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             'Automatic',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .titleSmall!
            //                 .copyWith(color: Colors.grey.shade900),
            //           ),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         Image.asset(IconAssets.features6),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             'Heating',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .titleSmall!
            //                 .copyWith(color: Colors.grey.shade900),
            //           ),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         Image.asset(IconAssets.features4),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             'Two-zone',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .titleSmall!
            //                 .copyWith(color: Colors.grey.shade900),
            //           ),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         Image.asset(IconAssets.features3),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             '12 Cyl',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .titleSmall!
            //                 .copyWith(color: Colors.grey.shade900),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            MainButton(width: 0.87, onclick: () {}, label: 'Buy Now'),
          ],
        ),
      ),
    );
  }
}
