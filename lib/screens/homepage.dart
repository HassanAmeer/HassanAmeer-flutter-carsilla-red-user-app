import 'package:carsilla/res/assets.dart';
import 'package:carsilla/screens/spareparts/sparepartssearch.dart';
import 'package:carsilla/vm/profilevm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

import '../resources/urls.dart';
import '../services/checkradiusdistance.dart';
import '../vm/carlistingvm.dart';
import '../vm/insuranceVM.dart';
import 'carinsurance/carinsurance.dart';
import '../res/theme.dart';
import '../widgets/bottomnavbar.dart';
import '../widgets/header.dart';
import '../widgets/textfeild.dart';
import 'carinsurance/insurancecompany2.dart';
import 'carlisting/carlisting.dart';
import 'carlisting/details.dart';
import 'carlisting/filter.dart';
import 'roadsideassis/roadsideassis.dart';
import 'transportation/vehicletransportaionpage.dart';
import 'workshopservices/workshopservices.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController searchController = TextEditingController();

  List servicesList = [
    {
      "icon": IconAssets.menu1,
      "title": "Workshop",
    },
    {
      "icon": IconAssets.menu2,
      "title": "Roadside \nAssitance",
    },
    {
      "icon": IconAssets.menu3,
      "title": "Car \nInsurance",
    },
    {
      "icon": IconAssets.menu4,
      "title": "Spare Parts",
    },
    {
      "icon": IconAssets.menu5,
      "title": "Vehicle \nTransportat",
    },
    {
      "icon": IconAssets.menu6,
      "title": "Car Listing",
    },
  ];

  int selectedservice = 888888;

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
  ];

  bool isShowAllListing = false;

  void initState() {
    super.initState();
    HelpersC().checkLocationPermission(context);
    Provider.of<CarListingVmC>(context, listen: false)
        .getCarListingDataVmF(context);
    Provider.of<CarListingVmC>(context, listen: false).getCarListingFav();
    Provider.of<InsuranceVmC>(context, listen: false)
        .getInsuranceCompaniesVmF(context);
    // Provider.of<ProfileVmC>(context, listen: false).checkProfileVmF(context);
    getlocf();
  }

  String locName = "DUBAI, UAE";
  double currentLat = 31.511900543125236;
  double currentLon = 74.43805270740967;

  ///// get locatiion
  getlocf() async {
    Position currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLat = currentLocation.latitude;
    currentLon = currentLocation.longitude;
    List<Placemark> placemarks = await placemarkFromCoordinates(
      currentLat,
      currentLon,
    );

    if (placemarks.isNotEmpty) {
      setState(() {
        dynamic cityName = placemarks[0].locality ?? "Unknown";
        dynamic street = placemarks[0].street ?? "Unknown";
        locName = '$cityName, $street';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Home',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            Row(
              children: [
                Text('Welcome to Carsilla',
                    style: textTheme.headlineLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 21)),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  size: 14,
                  color: Colors.grey.shade500.withOpacity(0.9),
                ),
                Text(
                    locName.toString().length >= 36
                        ? locName.toString().substring(0, 35)
                        : locName.toString(),
                    style: textTheme.labelMedium!.copyWith(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w400,
                    )),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.06 / 1,
              child: CustomTextFormField(
                width: MediaQuery.of(context).size.width * 0.92 / 1,
                hintText: 'Search',
                prefix: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CarFilterPage(
                                  searchVal: searchController.text)));
                    },
                    icon: Icon(Icons.search,
                        color: Colors.grey.shade700, size: 23)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FlutterCarousel(
                  items: [
                    Container(
                        width: MediaQuery.of(context).size.width * 0.91 / 1,
                        height: MediaQuery.of(context).size.height * 0.185 / 1,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 0.7,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Stack(
                          children: [
                            Image.asset(ImageAssets.homebanner),
                            Positioned(
                              top: 10,
                              left: 10,
                              child: Text(
                                'BEST CAR \nREPAIR \nSERVICES',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        )),
                  ],
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height * 0.185 / 1,
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Services",
                    textAlign: TextAlign.left,
                    style: textTheme.titleSmall!.copyWith(
                        color: MainTheme.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "See All",
                    textAlign: TextAlign.left,
                    style: textTheme.titleSmall!.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            _buildList1(context),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Top Brands",
                    textAlign: TextAlign.left,
                    style: textTheme.titleSmall!.copyWith(
                        color: MainTheme.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(IconAssets.brandsicons),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "See All",
                    textAlign: TextAlign.left,
                    style: textTheme.titleSmall!.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.17 / 1,
              child: Consumer<InsuranceVmC>(
                  builder: (context, insuranceCompanyValVm, child) {
                if (insuranceCompanyValVm.insuranceCompaniesList.isEmpty) {
                  return const SizedBox(height: 10);
                }

                return ListView.builder(
                  itemCount:
                      insuranceCompanyValVm.insuranceCompaniesList.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  controller: ScrollController(),
                  itemBuilder: (BuildContext context, int index) {
                    final data =
                        insuranceCompanyValVm.insuranceCompaniesList[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    Insurancecompany2(companydata: data),
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.47 / 1,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                    color: MainTheme.primaryColor, width: 1),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(00.7),
                                      offset: const Offset(0.1, 0.1),
                                      blurRadius: 10),
                                ]),
                            child: Center(
                              child: Stack(
                                children: [
                                  // company_name
                                  Align(
                                    alignment: Alignment.center,
                                    child: Image.network(
                                        ApiUrls.imageUrl + data['company_img']),
                                  ),

                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      // bottom: 0,
                                      // left: 0,
                                      // right: 0,
                                      child: Transform.translate(
                                        offset: const Offset(0, 20),
                                        child: Card(
                                          shape: BeveledRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          color: Colors.black12,
                                          surfaceTintColor: Colors.black12,
                                          child: SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9 /
                                                1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04 /
                                                1,
                                            child: Row(
                                              children: [
                                                Card(
                                                  shape: BeveledRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  color: MainTheme
                                                      .primaryColor.shade900
                                                      .withOpacity(0.6),
                                                  surfaceTintColor: MainTheme
                                                      .primaryColor.shade900
                                                      .withOpacity(0.6),
                                                  child: Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 2),
                                                    child: Text(
                                                      " AED ${data['monthly_charges']} ",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .labelMedium!
                                                          .copyWith(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                  ),
                                                ),
                                                const Text(
                                                  " / Month",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );

                    // : Center(
                    //     child: Text('Have No Insurance Company',
                    //         style: Theme.of(context)
                    //             .textTheme
                    //             .titleLarge!
                    //             .copyWith(color: Colors.grey)),
                    //   );
                  },
                );
              }),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Top Car Listing",
                    textAlign: TextAlign.left,
                    style: textTheme.titleSmall!.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),

            Consumer<CarListingVmC>(
              builder: (context, carListingValVm, child) {
                return carListingValVm.carListingDataList.isNotEmpty
                    ? GridView.builder(
                        itemCount:
                            carListingValVm.carListingDataList.length >= 8
                                ? 8
                                : carListingValVm.carListingDataList.length,
                        controller: ScrollController(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2),
                        itemBuilder: (BuildContext context, int index) {
                          final e = carListingValVm.carListingDataList[index];
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.42 / 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailsCarsPage(
                                        carListingDetails: e,
                                      ),
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
                                            ApiUrls.imageUrl +
                                                e['listing_img1'],
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.4 /
                                                1,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1 /
                                                1,
                                            fit: BoxFit.fitWidth)),
                                    Text(
                                      e['listing_title'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(
                                              color: Colors.grey.shade900),
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
                                                  carListingValVm
                                                      .addCarListingFav(
                                                          e['id'].toString());
                                                },
                                                child: carListingValVm
                                                        .carListingFavId
                                                        .contains(
                                                            e['id'].toString())
                                                    ? const Icon(
                                                        Icons.bookmark,
                                                        color: Colors.grey,
                                                      )
                                                    : Image.asset(
                                                        IconAssets.fav),
                                              ))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        })
                    : Center(
                        child: Text('Car Listing Empty',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Colors.grey)),
                      );
              },
            ),
            Center(
              child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CarListingPage(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'See More...',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: MainTheme.primaryColor),
                      ),
                      const Icon(Icons.visibility_outlined)
                    ],
                  )),
            ),

            // Wrap(
            //   children: carListing
            //       .map((e) => Padding(
            //             padding: const EdgeInsets.all(8.0),
            //             child: SizedBox(
            //               width: MediaQuery.of(context).size.width * 0.42 / 1,
            //               child: GestureDetector(
            //                 onTap: () {},
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.start,
            //                   crossAxisAlignment: CrossAxisAlignment.start,
            //                   children: [
            //                     ClipRRect(
            //                         borderRadius: BorderRadius.circular(10),
            //                         child: Image.asset(e['img'])),
            //                     Text(
            //                       e['title'],
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .labelSmall!
            //                           .copyWith(color: Colors.grey.shade900),
            //                     ),
            //                     SizedBox(
            //                       width: MediaQuery.of(context).size.width *
            //                           0.4 /
            //                           1,
            //                       child: Row(
            //                         mainAxisAlignment:
            //                             MainAxisAlignment.spaceBetween,
            //                         children: [
            //                           Text(
            //                             "\$${e['price']}",
            //                             style: Theme.of(context)
            //                                 .textTheme
            //                                 .labelLarge!
            //                                 .copyWith(
            //                                     color: MainTheme.primaryColor),
            //                           ),
            //                           SizedBox(
            //                               width: 13,
            //                               child: Image.asset(IconAssets.fav))
            //                         ],
            //                       ),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ))
            //       .toList(),
            // ),
          ],
        ),
      ),
      navbar: const NavBarWidget(),
    );
  }

  /// Section Widget
  Widget _buildList1(BuildContext context) {
    return SizedBox(
      height: 122,
      child: ListView.separated(
        itemCount: servicesList.length,
        // ),
        padding: const EdgeInsets.only(right: 6),
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) {
          return const SizedBox(width: 4);
        },
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 6),
            child: GestureDetector(
              onTap: () {
                if (index == 0) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WorkShopServicesPage()));
                } else if (index == 1) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RoadSideAssisPage()));
                } else if (index == 2) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CarInsurancePage(),
                    ),
                  );
                } else if (index == 3) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SparePartSearchPage()));
                } else if (index == 4) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoadSideAssisPage(),
                        // builder: (context) => const VehicleTransportaionPage(),
                      ));
                } else if (index == 5) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CarListingPage()));
                }

                setState(() {
                  selectedservice = index;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: selectedservice == index
                    ? BoxDecoration(
                        color: MainTheme.primaryColor,
                        borderRadius: BorderRadius.circular(17),
                        border:
                            Border.all(color: Colors.grey.shade800, width: 1),
                        boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 0.7,
                                offset: const Offset(0, 1))
                          ])
                    : BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(17),
                        border: Border.all(color: Colors.grey, width: 0),
                        boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300.withOpacity(0.8),
                                blurRadius: 4,
                                offset: const Offset(0, 7))
                          ]),
                width: 86,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 57,
                      width: 57,
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Center(
                        child: CircleAvatar(
                            radius: 29,
                            backgroundColor: selectedservice == index
                                ? Colors.white
                                : Colors.grey.shade300,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Image.asset(servicesList[index]['icon']),
                            )),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(servicesList[index]['title'],
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelSmall!.copyWith(
                            color: selectedservice == index
                                ? Colors.white
                                : Colors.grey.shade500,
                            fontSize: 12)),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
  ////////////////
}
