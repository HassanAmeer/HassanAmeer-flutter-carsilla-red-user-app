import 'package:carsilla/res/assets.dart';
import 'package:carsilla/res/theme.dart';
import 'package:carsilla/widgets/headerwithimg.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/urls.dart';
import '../../vm/carlistingvm.dart';
import 'addyourcar.dart';
import 'carlistingwithsearch.dart';
import 'details.dart';

class CarListingPage extends StatefulWidget {
  const CarListingPage({super.key});

  @override
  State<CarListingPage> createState() => _CarListingPageState();
}

class _CarListingPageState extends State<CarListingPage> {
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

  @override
  void initState() {
    super.initState();
    Provider.of<CarListingVmC>(context, listen: false)
        .getCarListingDataVmF(context);
    Provider.of<CarListingVmC>(context, listen: false).getCarListingFav();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarListingVmC>(builder: (context, vmVal, child) {
      return HeaderWithImage(
        title: 'Car Listing',
        headeimg: ImageAssets.insurnceimg1,
        marginToTopHeadeImg: -0.0,
        marginbodyfrombottom: 0.03,
        onTopOfheImage: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.9 / 1,
                height: MediaQuery.of(context).size.height * 0.055 / 1,
                child: SearchBar(
                    hintText: 'Search',
                    hintStyle: MaterialStateProperty.all(
                        TextStyle(color: Colors.grey.shade500, fontSize: 14)),
                    leading: Icon(Icons.search, color: Colors.grey.shade600),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CarListingWithSearchPage()));
                    }))),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Car Listing',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.black),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.35 / 1,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  MainTheme.primaryColor),
                              padding: MaterialStateProperty.all(
                                  const EdgeInsets.only(top: 3, bottom: 3)),
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10)))),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddYourCarPage(),
                              ),
                            );
                          },
                          child: Text(
                            'ADD YOUR CAR',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: Colors.white),
                          ),
                        ))
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  children: [
                    Text(
                      'We have compiled all the cars for you',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: Colors.grey.shade600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Transform.rotate(
                        angle: 1.5,
                        child: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.grey.shade400,
                          size: 18,
                        ))
                  ],
                ),
              ),
              vmVal.carListingDataList.isNotEmpty
                  ? Wrap(
                      children: vmVal.carListingDataList
                          .map((e) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.42 /
                                      1,
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
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
                                                        color: MainTheme
                                                            .primaryColor),
                                              ),
                                              SizedBox(
                                                  width: 15,
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      vmVal.addCarListingFav(
                                                          e['id'].toString());
                                                    },
                                                    child: vmVal.carListingFavId
                                                            .contains(e['id']
                                                                .toString())
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
                              ))
                          .toList(),
                    )
                  : Center(
                      child: Text('Car Listing Empty',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.grey)),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
