import 'package:carsilla/chat.dart';
import 'package:carsilla/res/assets.dart';
import 'package:carsilla/res/theme.dart';
import 'package:carsilla/resources/urls.dart';
// import 'package:carsilla/screens/spareparts/breakpads.dart';
import 'package:carsilla/vm/sparepartsVm.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/cupertino.dart';
// import 'package:carsilla/widgets/headerwithimg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
// import '../../res/theme.dart';

class FindSparePartsPage extends StatefulWidget {
  final String? selectedCar;
  final String? selectedModel;
  final String? selectedYear;
  final String? selectedSparePart;
  const FindSparePartsPage(
      {super.key,
      this.selectedCar,
      this.selectedModel,
      this.selectedYear,
      this.selectedSparePart});

  @override
  State<FindSparePartsPage> createState() => _FindSparePartsPageState();
}

class _FindSparePartsPageState extends State<FindSparePartsPage> {
  List sparepartsList = [
    {
      'img': TempAssets.sparepart1,
      'title': 'Brake Pads',
      'rates': '4.0',
      'location': 'Florida, USA',
      'price': '55',
    },
    {
      'img': TempAssets.sparepart2,
      'title': 'Brake Pads',
      'rates': '4.0',
      'location': 'Florida, USA',
      'price': '55',
    },
    {
      'img': TempAssets.sparepart3,
      'title': 'Brake Pads',
      'rates': '4.0',
      'location': 'Florida, USA',
      'price': '55',
    },
    {
      'img': TempAssets.sparepart1,
      'title': 'Brake Pads',
      'rates': '4.0',
      'location': 'Florida, USA',
      'price': '55',
    },
  ];

  List servicesList = [
    {
      'img': TempAssets.spareservice1,
      'title': 'Thomas Auto Workshop',
      'rates': '4.0',
      'location': 'Alaska, USA',
      'price': '55',
    },
    {
      'img': TempAssets.spareservice2,
      'title': 'Thomas Auto Workshop',
      'rates': '4.0',
      'location': 'Alaska, USA',
      'price': '55',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<SparePartsVmC>(builder: (context, vmVal, child) {
      List spareParts4Length = [];
      if (vmVal.allSparePartsToShow) {
        spareParts4Length = vmVal.sparePartsList;
      } else {
        spareParts4Length =
            vmVal.sparePartsList.sublist(0, vmVal.maxSparePartsToShow);
      }

      return Header(
          title: 'Auto Workshops',
          body: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.02 / 1),
              // vmVal.sparePartsList.isEmpty
              //     ? Center(
              //         child: Text(
              //         'Record Is Empty',
              //         style:
              //             TextStyle(fontSize: 26, color: Colors.grey.shade400),
              //       ))
              //     : Wrap(
              //         spacing: 8.0,
              //         runSpacing: 8.0,
              //         children: spareParts4Length
              //             .map(
              //               (e) => GestureDetector(
              //                 onTap: () {
              //                   Navigator.push(
              //                     context,
              //                     MaterialPageRoute(
              //                       builder: (context) => BreakPads(data: e),
              //                     ),
              //                   );
              //                 },
              //                 child: SizedBox(
              //                   height: MediaQuery.of(context).size.height *
              //                       0.23 /
              //                       1,
              //                   child: Stack(
              //                     children: [
              //                       Column(
              //                         children: [
              //                           SizedBox(
              //                               height: MediaQuery.of(context)
              //                                       .size
              //                                       .height *
              //                                   0.06 /
              //                                   1),
              //                           Container(
              //                             width: MediaQuery.of(context)
              //                                     .size
              //                                     .width *
              //                                 0.45,
              //                             height: MediaQuery.of(context)
              //                                     .size
              //                                     .height *
              //                                 0.15,
              //                             decoration: BoxDecoration(
              //                               color: Colors.white,
              //                               borderRadius:
              //                                   BorderRadius.circular(8.0),
              //                               boxShadow: [
              //                                 BoxShadow(
              //                                   color: Colors.grey.shade300,
              //                                   blurRadius: 5.0,
              //                                   offset: const Offset(0, 2),
              //                                 ),
              //                               ],
              //                             ),
              //                             child: Column(
              //                               crossAxisAlignment:
              //                                   CrossAxisAlignment.start,
              //                               children: [
              //                                 Padding(
              //                                   padding: const EdgeInsets.only(
              //                                       top: 10, right: 20.0),
              //                                   child: Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment.end,
              //                                     children: [
              //                                       Image.asset(
              //                                         IconAssets.yellowstar,
              //                                         width: 12.0,
              //                                       ),
              //                                       Text(
              //                                         "(${e['reviews']}.0)",
              //                                         style: Theme.of(context)
              //                                             .textTheme
              //                                             .labelSmall!
              //                                             .copyWith(
              //                                                 color: Colors.grey
              //                                                     .shade500),
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 Padding(
              //                                   padding: const EdgeInsets.only(
              //                                       left: 8.0, top: 5),
              //                                   child: Column(
              //                                     crossAxisAlignment:
              //                                         CrossAxisAlignment.start,
              //                                     children: [
              //                                       Text(
              //                                         e['sparepart_title'],
              //                                         style: Theme.of(context)
              //                                             .textTheme
              //                                             .subtitle1,
              //                                       ),
              //                                       Row(
              //                                         children: [
              //                                           Icon(
              //                                               Icons
              //                                                   .location_on_outlined,
              //                                               color: Colors
              //                                                   .grey.shade500,
              //                                               size: 14),
              //                                           Text(
              //                                             e['location'],
              //                                             style: TextStyle(
              //                                               color: Colors
              //                                                   .grey.shade600,
              //                                               fontSize: 12.0,
              //                                             ),
              //                                           ),
              //                                         ],
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 const SizedBox(
              //                                   height: 2,
              //                                 ),
              //                                 const SizedBox(
              //                                     height: 1, child: Divider()),
              //                                 Padding(
              //                                   padding: const EdgeInsets.only(
              //                                       left: 8.0,
              //                                       right: 8,
              //                                       top: 5),
              //                                   child: Row(
              //                                     mainAxisAlignment:
              //                                         MainAxisAlignment
              //                                             .spaceBetween,
              //                                     children: [
              //                                       Text('AED ${e['price']}'),
              //                                       Row(
              //                                         children: [
              //                                           GestureDetector(
              //                                             onTap: () async {
              //                                               final String url =
              //                                                   'tel:${e['phone']}';
              //                                               if (await canLaunch(
              //                                                   url)) {
              //                                                 await launch(url);
              //                                               } else {
              //                                                 throw 'Could not launch $url';
              //                                               }
              //                                             },
              //                                             child: SizedBox(
              //                                                 width: MediaQuery.of(
              //                                                             context)
              //                                                         .size
              //                                                         .width *
              //                                                     0.08 /
              //                                                     1,
              //                                                 child: Image.asset(
              //                                                     IconAssets
              //                                                         .phonered)),
              //                                           ),
              //                                           const SizedBox(
              //                                               width: 8.0),
              //                                           GestureDetector(
              //                                             onTap: () {
              //                                               Navigator.push(
              //                                                 context,
              //                                                 MaterialPageRoute(
              //                                                   builder:
              //                                                       (context) =>
              //                                                           const ChatPage(),
              //                                                 ),
              //                                               );
              //                                             },
              //                                             child: SizedBox(
              //                                                 width: MediaQuery.of(
              //                                                             context)
              //                                                         .size
              //                                                         .width *
              //                                                     0.08 /
              //                                                     1,
              //                                                 child: Image.asset(
              //                                                     IconAssets
              //                                                         .mailred)),
              //                                           ),
              //                                         ],
              //                                       ),
              //                                     ],
              //                                   ),
              //                                 ),
              //                               ],
              //                             ),
              //                           ),
              //                         ],
              //                       ),
              //                       Positioned(
              //                         top: 0,
              //                         left: 10,
              //                         child: SizedBox(
              //                             width: MediaQuery.of(context)
              //                                     .size
              //                                     .width *
              //                                 0.2 /
              //                                 1,
              //                             child: Image.network(
              //                                 ApiUrls.imageUrl +
              //                                     e['sparepart_img'],
              //                                 errorBuilder:
              //                                     (context, error, c) {
              //                               return Image.asset(e['img']);
              //                             })),
              //                       )
              //                     ],
              //                   ),
              //                 ),
              //               ),
              //             )
              //             .toList(),
              //       ),
              // vmVal.allSparePartsToShow
              //     ? Center(
              //         child: TextButton(
              //             onPressed: () {
              //               vmVal.changeMaxSparePartsToShowVmF();
              //             },
              //             child: Text(
              //               'See Less...',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .labelLarge!
              //                   .copyWith(color: MainTheme.primaryColor),
              //             )),
              //       )
              //     : Center(
              //         child: TextButton(
              //             onPressed: () {
              //               vmVal.changeMaxSparePartsToShowVmF();
              //             },
              //             child: Text(
              //               'See More...',
              //               style: Theme.of(context)
              //                   .textTheme
              //                   .labelLarge!
              //                   .copyWith(color: MainTheme.primaryColor),
              //             )),
              //       ),

              widget.selectedCar == null || widget.selectedCar!.isEmpty
                  ? Center(
                      child: Text(
                      "All Category",
                      style: TextStyle(color: MainTheme.primaryColor.shade300),
                    ))
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: ExpansionTile(
                        title: const Text("____________ Your Car ___________"),
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 5),
                              child: CupertinoListTile(
                                  backgroundColor: Colors.blueGrey.shade50,
                                  title: Text("Car Type",
                                      style: TextStyle(
                                          color: Colors.blueGrey.shade300)),
                                  trailing:
                                      Text(widget.selectedCar.toString()))),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 5),
                            child: CupertinoListTile(
                                backgroundColor: Colors.blueGrey.shade50,
                                title: Text(
                                  "Car Model",
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade300),
                                ),
                                trailing:
                                    Text(widget.selectedModel.toString())),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 5),
                            child: CupertinoListTile(
                                backgroundColor: Colors.blueGrey.shade50,
                                title: Text(
                                  "Car Year",
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade300),
                                ),
                                trailing: Text(widget.selectedYear.toString())),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 1, horizontal: 5),
                            child: CupertinoListTile(
                                backgroundColor: Colors.blueGrey.shade50,
                                title: Text(
                                  "Category",
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade300),
                                ),
                                trailing:
                                    Text(widget.selectedSparePart.toString())),
                          ),
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 1, horizontal: 5),
                              child: Opacity(
                                opacity: 0.5,
                                child: MainButton(
                                  width: 0.9,
                                  onclick: () {
                                    Navigator.pop(context);
                                  },
                                  label: "Choose New",
                                ),
                              )),
                        ],
                      ),
                    ),

              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Text(
                      'Nearby Services Providers',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.grey.shade800),
                    ),
                  ),
                ],
              ),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: vmVal.sparePartsShopsList
                    .map(
                      (e) => SizedBox(
                        height: MediaQuery.of(context).size.height * 0.23 / 1,
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.06 /
                                        1),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.45,
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
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
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 10, right: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Image.asset(
                                              IconAssets.yellowstar,
                                              width: 12.0,
                                            ),
                                            Text(
                                              e['reviews'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .copyWith(
                                                      color:
                                                          Colors.grey.shade500),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, top: 5),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              e['shop_tilte']
                                                          .toString()
                                                          .length >
                                                      17
                                                  ? e['shop_tilte']
                                                      .toString()
                                                      .substring(0, 17)
                                                  : e['shop_tilte'],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge,
                                            ),
                                            Row(
                                              children: [
                                                Icon(Icons.location_on_outlined,
                                                    color: Colors.grey.shade500,
                                                    size: 14),
                                                Text(
                                                  e['location'],
                                                  style: TextStyle(
                                                    color: Colors.grey.shade600,
                                                    fontSize: 12.0,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      const SizedBox(
                                          height: 1, child: Divider()),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 8.0, right: 8, top: 5),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                    'AED${e['charge_price'].toString()}'),
                                                Transform.translate(
                                                  offset: const Offset(4, -2),
                                                  child: Text(
                                                    e['charge_type'],
                                                    style: TextStyle(
                                                      color:
                                                          Colors.grey.shade600,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                GestureDetector(
                                                  onTap: () async {
                                                    final String url =
                                                        'tel:${e['phone']}';
                                                    if (await canLaunch(url)) {
                                                      await launch(url);
                                                    } else {
                                                      throw 'Could not launch $url';
                                                    }
                                                  },
                                                  child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.08 /
                                                              1,
                                                      child: Image.asset(
                                                          IconAssets.phonered)),
                                                ),
                                                const SizedBox(width: 8.0),
                                                GestureDetector(
                                                  onTap: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const ChatPage(),
                                                      ),
                                                    );
                                                  },
                                                  child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width *
                                                              0.08 /
                                                              1,
                                                      child: Image.asset(
                                                          IconAssets.mailred)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Positioned(
                              top: 0,
                              left: 10,
                              child: SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.2 /
                                      1,
                                  child: Image.network(
                                      ApiUrls.imageUrl + e['shop_img'],
                                      errorBuilder: (context, error, value) {
                                    return Image.asset(e['img']);
                                  })),
                            )
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ));
    });
  }
}
