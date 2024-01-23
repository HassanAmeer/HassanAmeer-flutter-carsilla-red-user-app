import 'package:carsilla/widgets/textfeild.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/assets.dart';
import '../../res/theme.dart';
import '../../resources/urls.dart';
import '../../vm/carlistingvm.dart';
import '../../widgets/header.dart';
import 'details.dart';
import 'filter.dart';

class CarListingWithSearchPage extends StatefulWidget {
  const CarListingWithSearchPage({super.key});

  @override
  State<CarListingWithSearchPage> createState() =>
      _CarListingWithSearchPageState();
}

class _CarListingWithSearchPageState extends State<CarListingWithSearchPage> {
  final searchController = TextEditingController();
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
    Provider.of<CarListingVmC>(context, listen: false)
        .getDealersDataVmF(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CarListingVmC>(builder: (context, vmVal, child) {
      return Header(
        title: 'Car Listing',
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.03 / 1),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9 / 1,
                  child: CustomTextFormField(
                    controller: searchController,
                    hintText: 'Search',
                    prefix: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarFilterPage(
                                  searchVal: searchController.text),
                            ),
                          );
                        },
                        icon: const Icon(Icons.search),
                        color: Colors.grey),
                    suffix: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CarFilterPage(
                                  searchVal: searchController.text),
                            ),
                          );
                        },
                        child: Image.asset(IconAssets.filter)),
                  )),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text('Select Car',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900)),
                ]),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.19 / 1,
                child: ListView.builder(
                  itemCount: vmVal.carListingDataList.length,
                  shrinkWrap: true,
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5 / 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsCarsPage(
                                  carListingDetails:
                                      vmVal.carListingDataList[index],
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
                                        vmVal.carListingDataList[index]
                                            ['listing_img1'],
                                    width: MediaQuery.of(context).size.width *
                                        0.4 /
                                        1,
                                    height: MediaQuery.of(context).size.height *
                                        0.1 /
                                        1,
                                    fit: BoxFit.fitWidth,
                                    errorBuilder: (context, child, erorr) =>
                                        Image.asset(IconAssets.carvector),
                                  )),
                              // child: Image.asset(carListing[index]['img'])),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  vmVal.carListingDataList[index]
                                      ['listing_title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(color: Colors.grey.shade900),
                                ),
                              ),
                              SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.4 / 1,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Start from:',
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                              color: Colors.grey.shade500),
                                    ),
                                    Text(
                                      "AED ${vmVal.carListingDataList[index]['listing_price']}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .copyWith(
                                              color: MainTheme.primaryColor),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Text('Popular Dealers',
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900)),
                ]),
              ),
              ListView.builder(
                itemCount: vmVal.carDealersDataList.length,
                shrinkWrap: true,
                controller: ScrollController(),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.16 / 1,
                        child: Image.network(
                            ApiUrls.imageUrl +
                                vmVal.carListingDataList[index]['company_img']
                                    .toString(),
                            errorBuilder: (context, v, error) =>
                                Image.asset(IconAssets.carred))),
                    title: Text(
                        vmVal.carDealersDataList[index]['company_name']
                            .toString(),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade900)),
                    subtitle: Text(
                        vmVal.carDealersDataList[index]['company_address']
                            .toString(),
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade500)),
                    trailing: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(IconAssets.yellowstar),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                              vmVal.carDealersDataList[index]['reviews']
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade600)),
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
