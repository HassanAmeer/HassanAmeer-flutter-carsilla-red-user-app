import 'package:carsilla/res/assets.dart';
import 'package:carsilla/resources/urls.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../chat.dart';

class BreakPads extends StatelessWidget {
  final dynamic data;
  const BreakPads({super.key, this.data = ''});

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Auto Spare Parts',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5 / 1,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Column(
                      children: [
                        Image.network(ApiUrls.imageUrl + data['sparepart_img'],
                            height:
                                MediaQuery.of(context).size.height * 0.35 / 1,
                            width: MediaQuery.of(context).size.width * 0.45 / 1,
                            errorBuilder: (context, error, valeu) {
                          return Image.asset(
                            TempAssets.breakpadnocurve,
                            height:
                                MediaQuery.of(context).size.height * 0.35 / 1,
                            width: MediaQuery.of(context).size.width * 0.45 / 1,
                          );
                        }),
                        // Text(
                        //   'Brake Pads',
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .titleMedium!
                        //       .copyWith(color: Colors.grey.shade900),
                        // ),
                        // Text(
                        //   'Auto Centre Spare Parts',
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .labelSmall!
                        //       .copyWith(color: Colors.grey.shade500),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.35 / 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 15, child: Image.asset(IconAssets.page)),
                          Column(
                            children: [
                              Text(
                                '${data['experience_years']}       ',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.grey.shade900),
                              ),
                              Text(
                                '   Work experience',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 13),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: 15,
                              child: Image.asset(IconAssets.yellowstar)),
                          Column(
                            children: [
                              Text(
                                "(${data['reviews']}.0)     ",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.grey.shade900),
                              ),
                              Text(
                                '   User review',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .copyWith(color: Colors.grey.shade500),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 13),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 15,
                              child: Icon(Icons.location_on_outlined,
                                  size: 15, color: Colors.grey)),
                          Text(
                            data['location'],
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.grey.shade700),
                          ),
                        ],
                      ),
                      const SizedBox(height: 13),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                              width: 15,
                              child: Icon(Icons.phone_outlined,
                                  size: 15, color: Colors.grey)),
                          Text(
                            data['phone'],
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              final String url = 'tel:${data['phone']}';
                              if (await canLaunch(url)) {
                                await launch(url);
                              } else {
                                throw 'Could not launch $url';
                              }
                            },
                            child: SizedBox(
                                width: 30,
                                child: Image.asset(IconAssets.phoneoutline)),
                          ),
                          const SizedBox(width: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const ChatPage(),
                                ),
                              );
                            },
                            child: SizedBox(
                                width: 30,
                                child: Image.asset(IconAssets.msgoutline)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              title: Text(
                data['sparepart_title'],
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey.shade900,
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                data['sparepart_shop'],
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.grey.shade600),
              ),
              trailing: Text(
                'AED ${data['price']}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey.shade900,
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
            ),
            ListTile(
              title: Text(
                'Details',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey.shade900),
              ),
              subtitle: Text(
                data['details'],
                // 'Address: XYZ Road, Sunset Boulevard, Chicago Timings: 9am - 9pm Days Open: Mon - Sat',
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: Colors.grey.shade500),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(' Reviews',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.black)),
                ),
                Text(' (2+)',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.grey.shade500))
              ],
            ),
            //////////
            ///
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.18 / 1,
              child: ListView.builder(
                itemCount: 2,
                shrinkWrap: true,
                controller: ScrollController(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.77 / 1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade300,
                            blurRadius: 5.0,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: Column(
                          children: [
                            SizedBox(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.blueGrey.shade100,
                                    child: const Icon(Icons.person_4_outlined),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          'John wick',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .copyWith(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          '12/25/2023',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                  color: Colors.grey.shade500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20.0, right: 5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Image.asset(
                                          IconAssets.yellowstar,
                                          width: 15.0,
                                        ),
                                        Text(
                                          ' (2.0)',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .copyWith(
                                                  color: Colors.grey.shade500),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                                height: MediaQuery.of(context).size.height *
                                    0.01 /
                                    1),
                            Text(
                              '"I recently purchased brake pads for my vehicle, and I must say, they exceeded my expectations. ',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(color: Colors.grey.shade500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
