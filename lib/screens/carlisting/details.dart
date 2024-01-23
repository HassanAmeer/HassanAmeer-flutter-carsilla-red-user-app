import 'package:carsilla/res/assets.dart';
import 'package:carsilla/res/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

import '../../resources/urls.dart';
import '../../services/colorparser.dart';
import '../../widgets/btn.dart';
import '../../widgets/header.dart';
import 'aboutcar.dart';
import 'package:faabul_color_picker/faabul_color_picker.dart';

class DetailsCarsPage extends StatefulWidget {
  final Map? carListingDetails;
  const DetailsCarsPage({super.key, this.carListingDetails});

  @override
  State<DetailsCarsPage> createState() => _DetailsCarsPageState();
}

class _DetailsCarsPageState extends State<DetailsCarsPage> {
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

  @override
  void initState() {
    super.initState();
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
      title: 'Details',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.03 / 1),
            Center(
              child: Text(
                widget.carListingDetails!['listing_title'],
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlutterCarousel(
                  items: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.network(
                            ApiUrls.imageUrl +
                                widget.carListingDetails!['listing_img1'],
                            width: MediaQuery.of(context).size.width * 0.95 / 1,
                            height:
                                MediaQuery.of(context).size.height * 0.25 / 1,
                            fit: BoxFit.fitWidth)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.network(
                            ApiUrls.imageUrl +
                                widget.carListingDetails!['listing_img2'],
                            width: MediaQuery.of(context).size.width * 0.95 / 1,
                            height:
                                MediaQuery.of(context).size.height * 0.25 / 1,
                            fit: BoxFit.fitWidth)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.network(
                            ApiUrls.imageUrl +
                                widget.carListingDetails!['listing_img3'],
                            width: MediaQuery.of(context).size.width * 0.95 / 1,
                            height:
                                MediaQuery.of(context).size.height * 0.25 / 1,
                            fit: BoxFit.fitWidth)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.network(
                            ApiUrls.imageUrl +
                                widget.carListingDetails!['listing_img4'],
                            width: MediaQuery.of(context).size.width * 0.95 / 1,
                            height:
                                MediaQuery.of(context).size.height * 0.25 / 1,
                            fit: BoxFit.fitWidth)),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(13),
                        child: Image.network(
                            ApiUrls.imageUrl +
                                widget.carListingDetails!['listing_img5'],
                            width: MediaQuery.of(context).size.width * 0.95 / 1,
                            height:
                                MediaQuery.of(context).size.height * 0.25 / 1,
                            fit: BoxFit.fitWidth)),
                  ],
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.28 / 1,
                    aspectRatio: 16 / 9,
                    viewportFraction: 1.0,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    controller: CarouselController(),
                    pageSnapping: true,
                    scrollDirection: Axis.horizontal,
                    pauseAutoPlayOnTouch: true,
                    pauseAutoPlayOnManualNavigate: true,
                    pauseAutoPlayInFiniteScroll: false,
                    enlargeStrategy: CenterPageEnlargeStrategy.scale,
                    disableCenter: false,
                    floatingIndicator: true,
                    showIndicator: true,
                    slideIndicator: CircularSlideIndicator(
                        indicatorRadius: 4,
                        indicatorBorderWidth: 2,
                        currentIndicatorColor: MainTheme.primaryColor,
                        indicatorBackgroundColor: Colors.grey.shade300),
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05 / 1,
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
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   children: [
            //     Column(
            //       children: [
            //         Image.asset(IconAssets.features1),
            //         Text(
            //           'Gear',
            //           style: Theme.of(context)
            //               .textTheme
            //               .labelSmall!
            //               .copyWith(color: Colors.grey.shade600),
            //         ),
            //         Text(
            //           carListingDetails!['features_gear'],
            //           style: Theme.of(context)
            //               .textTheme
            //               .titleSmall!
            //               .copyWith(color: Colors.grey.shade900),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         Image.asset(IconAssets.features3),
            //         Text(
            //           'Cyl',
            //           style: Theme.of(context)
            //               .textTheme
            //               .labelSmall!
            //               .copyWith(color: Colors.grey.shade600),
            //         ),
            //         Text(
            //           carListingDetails!['features_cylinders'],
            //           style: Theme.of(context)
            //               .textTheme
            //               .titleSmall!
            //               .copyWith(color: Colors.grey.shade900),
            //         ),
            //       ],
            //     ),
            //     Column(
            //       children: [
            //         Image.asset(IconAssets.features5),
            //         Text(
            //           'Fuel',
            //           style: Theme.of(context)
            //               .textTheme
            //               .labelSmall!
            //               .copyWith(color: Colors.grey.shade600),
            //         ),
            //         Text(
            //           carListingDetails!['features_fuel_type'],
            //           style: Theme.of(context)
            //               .textTheme
            //               .titleSmall!
            //               .copyWith(color: Colors.grey.shade900),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),

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

            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            ListTile(
              trailing: Text(
                'AED ${widget.carListingDetails!['listing_price']}',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: MainTheme.primaryColor, fontWeight: FontWeight.w500),
              ),
            ),
            MainButton(
                width: 0.87,
                onclick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutCarPage(
                          carListingDetails: widget.carListingDetails),
                    ),
                  );
                },
                label: 'Buy Now'),
          ],
        ),
      ),
    );
  }
}
