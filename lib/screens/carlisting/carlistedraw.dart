import 'dart:io';

import 'package:carsilla/res/assets.dart';
import 'package:carsilla/res/theme.dart';
import 'package:flutter/material.dart';
import '../../widgets/header.dart';
import 'carlistingwithsearch.dart';

class CarListedPage extends StatefulWidget {
  final String? title;
  final String? type;
  final String? desc;
  final String? price;
  final String? image;
  final String? gearF;
  final String? speedF;
  final String? cylF;
  final String? climatesF;
  final String? fuelF;
  final String? seatsF;
  const CarListedPage(
      {super.key,
      this.gearF = '',
      this.title = '',
      this.type = '',
      this.desc = '',
      this.price = '',
      this.image = '',
      this.speedF = '',
      this.cylF = '',
      this.climatesF = '',
      this.fuelF = '',
      this.seatsF = ''});

  @override
  State<CarListedPage> createState() => _CarListedPageState();
}

class _CarListedPageState extends State<CarListedPage> {
  List featuresList = [];
  @override
  void initState() {
    super.initState();
    // featuresList.add({
    //   'img': IconAssets.features1,
    //   'title': 'Gear',
    //   'subtitle': widget.gearF
    // });
    // featuresList.add({
    //   'img': IconAssets.features2,
    //   'title': 'Acceleration',
    //   'subtitle': widget.speedF,
    // });
    // featuresList.add({
    //   'img': IconAssets.features3,
    //   'title': 'Cyl',
    //   'subtitle': widget.cylF,
    // });
    // featuresList.add({
    //   'img': IconAssets.features4,
    //   'title': 'Climate Control',
    //   'subtitle': widget.climatesF,
    // });
    // featuresList.add({
    //   'img': IconAssets.features5,
    //   'title': 'Fuel Type',
    //   'subtitle': widget.fuelF,
    // });
    // featuresList.add({
    //   'img': IconAssets.features6,
    //   'title': 'Seats',
    //   'subtitle': widget.seatsF,
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Car Listed',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 14.0, left: 14, right: 14, bottom: 4),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 4.0),
                    child: Text(
                      'Your Car has been listed.',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: MainTheme.primaryColor),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.008 / 1),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Text(widget.title!,
                  //     style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  //         fontWeight: FontWeight.w500,
                  //         color: Colors.grey.shade900)),
                  // Text('\$${widget.price!}',
                  //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  //         fontWeight: FontWeight.w500,
                  //         color: MainTheme.primaryColor)),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('type',
                      // widget.type!,
                      style: textTheme.labelSmall!.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500)),
                  Row(
                    children: [
                      Icon(
                        Icons.visibility_outlined,
                        color: Colors.grey.shade400,
                        size: 17,
                      ),
                      Text('1 views',
                          style: textTheme.labelSmall!.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade500)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0, right: 8),
            //   child: Image.file(File(widget.image!),
            //       errorBuilder: (context, c, error) =>
            //           Image.asset(ImageAssets.femalecar)),
            //   // child: Image.asset(ImageAssets.femalecar),
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Features',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Share',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey.shade900)),
                      SizedBox(width: 34, child: Image.asset(IconAssets.share)),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            // Wrap(
            //     children: featuresList
            //         .map((e) => Container(
            //               decoration: const BoxDecoration(color: Colors.white),
            //               width: MediaQuery.of(context).size.width * 0.46 / 1,
            //               child: ListTile(
            //                 leading: Image.asset(e['img']),
            //                 title: Text(e['title'],
            //                     style: Theme.of(context)
            //                         .textTheme
            //                         .labelMedium!
            //                         .copyWith(
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.grey.shade500)),
            //                 subtitle: Text(e['subtitle'],
            //                     style: Theme.of(context)
            //                         .textTheme
            //                         .labelLarge!
            //                         .copyWith(
            //                             fontWeight: FontWeight.w500,
            //                             color: Colors.grey.shade900)),
            //               ),
            //             ))
            //         .toList()),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(left: 10, top: 0, bottom: 0),
              title: Text(
                'Overview',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey.shade700),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'desc',
                  // widget.desc!,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Colors.grey.shade500, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
