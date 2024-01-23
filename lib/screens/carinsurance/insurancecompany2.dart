import 'package:carsilla/chat.dart';
import 'package:carsilla/res/assets.dart';
import 'package:carsilla/resources/urls.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/btn.dart';
import 'step1insurance.dart';

class Insurancecompany2 extends StatefulWidget {
  final String? type;
  final String? model;
  final String? year;
  final dynamic companydata;

  const Insurancecompany2(
      {super.key, this.companydata = '', this.type, this.model, this.year});

  @override
  State<Insurancecompany2> createState() => _Insurancecompany2State();
}

class _Insurancecompany2State extends State<Insurancecompany2> {
  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Insurance Companies',
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
                        Image.network(
                          ApiUrls.imageUrl + widget.companydata['company_img'],
                          height: MediaQuery.of(context).size.height * 0.35 / 1,
                          width: MediaQuery.of(context).size.width * 0.45 / 1,
                        ),
                        // Image.asset(
                        //   TempAssets.details2,
                        //   height: MediaQuery.of(context).size.height * 0.35 / 1,
                        //   width: MediaQuery.of(context).size.width * 0.45 / 1,
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
                                '${widget.companydata['experience'].toString()}     ',
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
                                '${widget.companydata['reviews']}     ',
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
                            "${widget.companydata['location']}",
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
                          GestureDetector(
                            onTap: () async {
                              final Uri launchUri = Uri(
                                scheme: 'tel',
                                path: widget.companydata['phone'],
                              );
                              await launchUrl(launchUri);
                            },
                            child: Text(
                              "  ${widget.companydata['phone']}",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(color: Colors.grey.shade600),
                            ),
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
                widget.companydata['company_name'],
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey.shade900,
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
              subtitle: Text(
                widget.companydata['company_subtitle'],
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.grey.shade600),
              ),
              trailing: Text(
                'AED ${widget.companydata['monthly_charges']}',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.grey.shade900,
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                MainButton(
                    radius: 30,
                    width: 0.75,
                    onclick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Step1InsurancePage(
                              type: widget.type,
                              model: widget.model,
                              year: widget.year,
                              charges: widget.companydata['monthly_charges']
                                  .toString()),
                        ),
                      );
                    },
                    label: 'Order Now'.toUpperCase()),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ChatPage(),
                      ),
                    );
                  },
                  child: CircleAvatar(
                    child: Image.asset(IconAssets.bluechat),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
//////////////////////////////////////
            //   Row(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.only(left: 8.0),
            //         child: Text(' Reviews',
            //             style: Theme.of(context)
            //                 .textTheme
            //                 .titleSmall!
            //                 .copyWith(color: Colors.black)),
            //       ),
            //       Text(' (210+)',
            //           style: Theme.of(context)
            //               .textTheme
            //               .labelMedium!
            //               .copyWith(color: Colors.grey.shade500))
            //     ],
            //   ),
            //   //////////
            //   ///
            //   SizedBox(
            //     height: MediaQuery.of(context).size.height * 0.18 / 1,
            //     child: ListView.builder(
            //       itemCount: 2,
            //       shrinkWrap: true,
            //       controller: ScrollController(),
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (BuildContext context, int index) {
            //         return Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Container(
            //             width: MediaQuery.of(context).size.width * 0.77 / 1,
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               borderRadius: BorderRadius.circular(8.0),
            //               boxShadow: [
            //                 BoxShadow(
            //                   color: Colors.grey.shade300,
            //                   blurRadius: 5.0,
            //                   offset: const Offset(0, 2),
            //                 ),
            //               ],
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(6.0),
            //               child: Column(
            //                 children: [
            //                   SizedBox(
            //                     child: Row(
            //                       mainAxisAlignment:
            //                           MainAxisAlignment.spaceBetween,
            //                       children: [
            //                         CircleAvatar(
            //                             backgroundColor: Colors.blueGrey.shade100,
            //                             child: Image.asset(ImageAssets.profile2)),
            //                         Padding(
            //                           padding: const EdgeInsets.only(left: 8.0),
            //                           child: Column(
            //                             children: [
            //                               Text(
            //                                 'Ursula Gurnmeister',
            //                                 style: Theme.of(context)
            //                                     .textTheme
            //                                     .titleMedium!
            //                                     .copyWith(
            //                                         color: Colors.grey.shade700,
            //                                         fontWeight: FontWeight.w500),
            //                               ),
            //                               Text(
            //                                 '11:30 am 01.02.2022',
            //                                 style: Theme.of(context)
            //                                     .textTheme
            //                                     .labelLarge!
            //                                     .copyWith(
            //                                         color: Colors.grey.shade500),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                         Padding(
            //                           padding: const EdgeInsets.only(
            //                               top: 10, left: 20.0, right: 5),
            //                           child: Row(
            //                             mainAxisAlignment: MainAxisAlignment.end,
            //                             children: [
            //                               Image.asset(
            //                                 IconAssets.yellowstar,
            //                                 width: 15.0,
            //                               ),
            //                               Text(
            //                                 ' (5.0)',
            //                                 style: Theme.of(context)
            //                                     .textTheme
            //                                     .labelMedium!
            //                                     .copyWith(
            //                                         color: Colors.grey.shade500),
            //                               ),
            //                             ],
            //                           ),
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                   SizedBox(
            //                       height: MediaQuery.of(context).size.height *
            //                           0.01 /
            //                           1),
            //                   Text(
            //                     'Proin quis ipsum rutru consectet dictum ex. Phasellus ultrices dapibus libero, sit amet sagittis',
            //                     style: Theme.of(context)
            //                         .textTheme
            //                         .labelSmall!
            //                         .copyWith(color: Colors.grey.shade500),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
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
