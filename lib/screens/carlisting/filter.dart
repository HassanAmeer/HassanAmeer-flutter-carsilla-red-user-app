import 'package:carsilla/res/assets.dart';
import 'package:carsilla/res/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../resources/urls.dart';
import '../../vm/carlistingvm.dart';
import '../../widgets/header.dart';
import 'details.dart';

class CarFilterPage extends StatefulWidget {
  final String? searchVal;
  const CarFilterPage({super.key, this.searchVal = ''});

  @override
  State<CarFilterPage> createState() => _CarFilterPageState();
}

class _CarFilterPageState extends State<CarFilterPage> {
  final List carListing = [
    {
      'img': TempAssets.carlisting1,
      'title': 'White Suv Car',
      'price': '65.000'
    },
    {
      'img': TempAssets.carlisting2,
      'title': 'Blue Luxury Car',
      'price': '57.500'
    },
    {
      'img': TempAssets.carlisting3,
      'title': 'Red Sport Car',
      'price': '45.900'
    },
    {
      'img': TempAssets.carlisting4,
      'title': 'White Mini Car',
      'price': '43.000'
    },
    {
      'img': TempAssets.carlisting3,
      'title': 'Red Sport Car',
      'price': '45.900'
    },
    {
      'img': TempAssets.carlisting4,
      'title': 'White Mini Car',
      'price': '43.000'
    },
  ];

  String filterVal = '';
  String sortBy = 'az';

  late List displayedList;
  @override
  void initState() {
    super.initState();
    final vmIntVal = Provider.of<CarListingVmC>(context, listen: false);
    displayedList = List.from(vmIntVal.carListingDataList);
    if (widget.searchVal!.isNotEmpty) {
      filterList(widget.searchVal!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarListingVmC>(builder: (context, vmVal, child) {
      return Header(
        // title: 'Filter',
        title: filterVal.isEmpty ? 'Filter' : filterVal,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ' Sports Cars',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.black),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'We have compiled all the cars for you',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      hint: const Text('SORT'),
                      elevation: 70,
                      onChanged: (value) {},
                      items: [
                        DropdownMenuItem(
                          alignment: Alignment.center,
                          value: 1,
                          onTap: () {
                            sortBy = 'az';
                            sortList(sortBy);
                          },
                          child: const Text('A-Z'),
                        ),
                        DropdownMenuItem(
                          alignment: Alignment.center,
                          value: 2,
                          onTap: () {
                            sortBy = 'za';
                            sortList(sortBy);
                          },
                          child: const Text('Z-A'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08 / 1,
                child: ListView(
                  controller: ScrollController(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    GestureDetector(
                      onTap: () {
                        filterList('sports');
                        // setState(() {
                        //   filterVal = 'sports';
                        // });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.32 / 1,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 10),
                                  child: Text('sports',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith()),
                                ),
                                const CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Colors.white,
                                    child:
                                        Icon(Icons.close, color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        filterList('Auto');

                        // setState(() {
                        //   filterVal = 'Auto';
                        // });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.34 / 1,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 10),
                                  child: Text('Automatic',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith()),
                                ),
                                const CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Colors.white,
                                    child:
                                        Icon(Icons.close, color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        filterList('65.000');
                        // setState(() {
                        //   filterVal = '65.000';
                        // });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.32 / 1,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(7)),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 7.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 10),
                                  child: Text('\$65.000',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith()),
                                ),
                                const CircleAvatar(
                                    radius: 13,
                                    backgroundColor: Colors.white,
                                    child:
                                        Icon(Icons.close, color: Colors.grey)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Assuming you have a TextEditingController for your search field
// ...
              // GridView.builder(
              //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 2),
              //   itemCount: displayedList.length,
              //   shrinkWrap: true,
              //   controller: ScrollController(),
              //   itemBuilder: (context, index) {
              //     final e = displayedList[index];

              //     if (!(e['listing_title']!
              //             .toLowerCase()
              //             .contains(filterVal.toLowerCase()) ||
              //         e['listing_desc']!
              //             .toLowerCase()
              //             .contains(filterVal.toLowerCase().toLowerCase()) ||
              //         e['listing_price']!
              //             .toLowerCase()
              //             .contains(filterVal.toLowerCase().toLowerCase()) ||
              //         e['features_gear']!
              //             .toLowerCase()
              //             .contains(filterVal.toLowerCase().toLowerCase()) ||
              //         e['listing_type']!
              //             .toLowerCase()
              //             .contains(filterVal.toLowerCase().toLowerCase()))) {
              //       // Item doesn't match the filter, return an empty container
              //       // return Center(
              //       //   child: Padding(
              //       //     padding: const EdgeInsets.only(top: 100.0),
              //       //     child: Text(
              //       //       'No items found',
              //       //       style: Theme.of(context)
              //       //           .textTheme
              //       //           .headline6!
              //       //           .copyWith(color: Colors.grey.shade900),
              //       //     ),
              //       //   ),
              //       // );
              //       return null;
              //       // return const SizedBox(width: 0, height: 0);
              //     }

              //     return Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: SizedBox(
              //         width: MediaQuery.of(context).size.width * 0.42 / 1,
              //         child: GestureDetector(
              //           onTap: () {
              //             Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                 builder: (context) => DetailsCarsPage(
              //                   carListingDetails: e,
              //                 ),
              //               ),
              //             );
              //           },
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               ClipRRect(
              //                 borderRadius: BorderRadius.circular(10),
              //                 child: Image.network(
              //                   ApiUrls.imageUrl + e['listing_img1'],
              //                   width:
              //                       MediaQuery.of(context).size.width * 0.4 / 1,
              //                   height: MediaQuery.of(context).size.height *
              //                       0.12 /
              //                       1,
              //                   fit: BoxFit.cover,
              //                   errorBuilder: (context, child, error) =>
              //                       Image.asset(IconAssets.carvector),
              //                 ),
              //               ),
              //               Text(
              //                 e['listing_title'] ?? '',
              //                 style: Theme.of(context)
              //                     .textTheme
              //                     .labelSmall!
              //                     .copyWith(color: Colors.grey.shade900),
              //               ),
              //               SizedBox(
              //                 width:
              //                     MediaQuery.of(context).size.width * 0.4 / 1,
              //                 child: Row(
              //                   mainAxisAlignment:
              //                       MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Text(
              //                       "\$${e['listing_price']}",
              //                       style: Theme.of(context)
              //                           .textTheme
              //                           .labelLarge!
              //                           .copyWith(
              //                               color: MainTheme.primaryColor),
              //                     ),
              //                     SizedBox(
              //                       width: 13,
              //                       child: Image.asset(IconAssets.fav),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     );
              //   },
              // ),
              Wrap(
                children: displayedList
                    //     .where((e) =>
                    //         e['listing_title']!.toLowerCase().contains(filterVal.toLowerCase()) ||
                    //         e['listing_desc']!.toLowerCase().contains(
                    //             filterVal.toLowerCase().toLowerCase()) ||
                    //         e['listing_price']!.toLowerCase().contains(
                    //             filterVal.toLowerCase().toLowerCase()) ||
                    //         e['features_gear']!.toLowerCase().contains(
                    //             filterVal.toLowerCase().toLowerCase()) ||
                    //         e['listing_type']!.toLowerCase().contains(
                    //             filterVal.toLowerCase().toLowerCase()))
                    //     .isEmpty)
                    // ? [
                    //     // Display a message when no items are found
                    //     Center(
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(top: 100.0),
                    //         child: Text(
                    //           'No items found',
                    //           style: Theme.of(context)
                    //               .textTheme
                    //               .headline6!
                    //               .copyWith(color: Colors.grey.shade900),
                    //         ),
                    //       ),
                    //     ),
                    //   ]
                    // : vmVal.carListingDataList
                    //     .where((e) =>
                    //         e['listing_title']!
                    //             .toLowerCase()
                    //             .contains(filterVal.toLowerCase()) ||
                    //         e['listing_desc']!.toLowerCase().contains(
                    //             filterVal.toLowerCase().toLowerCase()) ||
                    //         e['listing_price']!.toLowerCase().contains(
                    //             filterVal.toLowerCase().toLowerCase()) ||
                    //         e['features_gear']!.toLowerCase().contains(
                    //             filterVal.toLowerCase().toLowerCase()) ||
                    //         e['listing_type']!
                    //             .toLowerCase()
                    //             .contains(filterVal.toLowerCase().toLowerCase()))

                    .map((e) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.42 / 1,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailsCarsPage(carListingDetails: e),
                                  ),
                                );
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      ApiUrls.imageUrl + e['listing_img1'],
                                      width: MediaQuery.of(context).size.width *
                                          04 /
                                          1,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.12 /
                                              1,
                                      fit: BoxFit.cover,
                                      errorBuilder: (context, child, erorr) =>
                                          Image.asset(IconAssets.carvector),
                                    ),
                                  ),
                                  Text(
                                    e['listing_title'] ?? '',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(color: Colors.grey.shade900),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.4 /
                                        1,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "AED ${e['listing_price']}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge!
                                              .copyWith(
                                                  color:
                                                      MainTheme.primaryColor),
                                        ),
                                        SizedBox(
                                            width: 15,
                                            child: GestureDetector(
                                              onTap: () {
                                                vmVal.addCarListingFav(
                                                    e['id'].toString());
                                              },
                                              child: vmVal.carListingFavId
                                                      .contains(
                                                          e['id'].toString())
                                                  ? const Icon(
                                                      Icons.bookmark,
                                                      color: Colors.grey,
                                                    )
                                                  : Image.asset(IconAssets.fav),
                                            ))
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ],
          ),
        ),
      );
    });
  }

  void sortList(String sortBy) {
    setState(() {
      displayedList.sort((a, b) {
        // Sorting logic based on sortBy parameter
        if (sortBy == 'az') {
          return a['listing_title'].compareTo(b['listing_title']);
        } else {
          return b['listing_title'].compareTo(a['listing_title']);
        }
      });
    });
  }

  void filterList(String filterValue) {
    filterVal = filterValue;
    final vmIntVal = Provider.of<CarListingVmC>(context, listen: false);
    setState(() {
      displayedList = vmIntVal.carListingDataList
          .where((e) => !(e['listing_title']!
                  .toLowerCase()
                  .contains(filterValue.toLowerCase()) ||
              e['listing_desc']!
                  .toLowerCase()
                  .contains(filterValue.toLowerCase().toLowerCase()) ||
              e['listing_price']!
                  .toLowerCase()
                  .contains(filterValue.toLowerCase().toLowerCase()) ||
              e['features_gear']!
                  .toLowerCase()
                  .contains(filterValue.toLowerCase().toLowerCase()) ||
              e['listing_type']!
                  .toLowerCase()
                  .contains(filterValue.toLowerCase().toLowerCase())))
          .toList();
    });
  }
}
