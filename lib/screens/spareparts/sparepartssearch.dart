import 'package:carsilla/res/assets.dart';
import 'package:carsilla/resources/urls.dart';
import 'package:carsilla/screens/spareparts/breakpads.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/headerwithimg.dart';
import 'package:carsilla/widgets/textfeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../res/theme.dart';
import '../../services/toast.dart';
import '../../vm/chooseCarModelYearVm.dart';
import '../../vm/sparepartsVm.dart';
import '../../widgets/bottomnavbar.dart';
import 'sparepartslist.dart';

class SparePartSearchPage extends StatefulWidget {
  const SparePartSearchPage({super.key});

  @override
  State<SparePartSearchPage> createState() => _SparePartSearchPageState();
}

class _SparePartSearchPageState extends State<SparePartSearchPage> {
  TextEditingController pickupcontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();

////////////
  String? selectedCar;
  String? selectedModel;
  String? selectedYear;

  List<String> sparePartsNames = [
    'Brake Pads',
    'Oil Filter',
    'Air Filter',
    'Spark Plugs',
    'Battery'
  ];

  String? selectedSparePart = 'Brake Pads';
////////////
  @override
  void initState() {
    super.initState();
    Provider.of<SparePartsVmC>(context, listen: false).getRepairingVmF(context);
    Provider.of<SparePartsVmC>(context, listen: false)
        .getSparePartsVmF(context);
    Provider.of<SparePartsVmC>(context, listen: false)
        .getSparePartsShopsVmF(context);
  }

  @override
  Widget build(BuildContext context) {
    pickupcontroller.text = 'Car';
    timecontroller.text = 'Car';
    return Builder(builder: (context) {
      return Consumer<SparePartsVmC>(builder: (context, vmVal, child) {
        vmVal.getRepairingVmF(context);
        return HeaderWithImage(
          title: 'Auto Spare Parts',
          headeimg: ImageAssets.workshop,
          marginToTopHeadeImg: 0.0,
          marginbodyfrombottom: 0.06,
          onTopOfheImage: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9 / 1,
                  height: MediaQuery.of(context).size.height * 0.055 / 1,
                  child: SearchBar(
                    hintText: 'Search ...',
                    hintStyle: MaterialStateProperty.all(
                        TextStyle(color: Colors.grey.shade500, fontSize: 14)),
                    leading: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  BreakPads(data: vmVal.sparePartsList.first),
                            ),
                          );
                        },
                        icon: Icon(Icons.search, color: Colors.grey.shade600)),
                  ))),
          navbar: const NavBarWidget(),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
                Row(
                  children: [
                    Text('Choose Your Vehicle',
                        style: textTheme.titleSmall!.copyWith(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: MainTheme.primaryColor)),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
                SizedBox(
                    // width: MediaQuery.of(context).size.width * 0.28 / 1,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text('TYPE',
                          style: textTheme.labelSmall!.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600)),
                      GestureDetector(
                        onTap: () {
                          showCustomDropDownBottomSheet(context);
                        },
                        child: Container(
                            // width: MediaQuery.of(context).size.width * 0.32 / 1,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.8, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 13),
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(selectedCar.toString().isEmpty ||
                                              selectedCar == null
                                          ? "Choose"
                                          : selectedCar.toString()),
                                      Transform.rotate(
                                          angle: 4.7,
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 3.0),
                                              child: Icon(
                                                  Icons.arrow_back_ios_outlined,
                                                  color: Colors.grey.shade500,
                                                  size: 15)))
                                    ]))),
                      )
                    ])),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.085 / 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.47 / 1,
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('MODEL',
                                      style: textTheme.labelSmall!.copyWith(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey.shade600)),
                                  Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.46 /
                                          1,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 0.8,
                                              color: Colors.grey.shade400),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                          child: Center(
                                              child: DropdownButton<String>(
                                                  value: selectedModel,
                                                  hint: const Text(
                                                      ' Model        '),
                                                  underline: Container(),
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      color: Colors.black),
                                                  icon: Transform.rotate(
                                                      angle: 4.7,
                                                      child: Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  left: 3.0),
                                                          child:
                                                              Icon(Icons.arrow_back_ios_outlined,
                                                                  color: Colors
                                                                      .grey
                                                                      .shade500,
                                                                  size: 17))),
                                                  onChanged:
                                                      (String? newValue) {
                                                    setState(() {
                                                      selectedModel = newValue;
                                                      selectedYear = null;
                                                    });
                                                  },
                                                  items: selectedCar != null
                                                      ? ChooseCarModelYearVmC
                                                              .modelsByCar[selectedCar!]
                                                              ?.map((String model) {
                                                            return DropdownMenuItem<
                                                                    String>(
                                                                value: model,
                                                                child: Text(
                                                                    model));
                                                          }).toList() ??
                                                          []
                                                      : []))))
                                ])),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.43 / 1,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('YEAR ',
                                  style: textTheme.labelSmall!.copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey.shade600)),
                              Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.42 /
                                      1,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 0.8,
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    child: Center(
                                      child: DropdownButton<String>(
                                        underline: Container(),
                                        value: selectedYear,
                                        hint: const Text(' Year      '),
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedYear = newValue;
                                          });
                                        },
                                        icon: Transform.rotate(
                                            angle: 4.7,
                                            child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 3.0),
                                                child: Icon(
                                                    Icons
                                                        .arrow_back_ios_outlined,
                                                    color: Colors.grey.shade500,
                                                    size: 17))),
                                        items: selectedModel != null
                                            ? ChooseCarModelYearVmC
                                                    .yearsByModel[
                                                        selectedModel!]
                                                    ?.map((String year) {
                                                  return DropdownMenuItem<
                                                      String>(
                                                    value: year,
                                                    child: Text(year),
                                                  );
                                                }).toList() ??
                                                []
                                            : [],
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
                Row(
                  children: [
                    Text('Categories'.toUpperCase(),
                        style: textTheme.labelSmall!.copyWith(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey.shade600)),
                  ],
                ),
                // Text(selectedSparePart.toString()),
                Container(
                    width: MediaQuery.of(context).size.width * 0.9 / 1,
                    decoration: BoxDecoration(
                        border:
                            Border.all(width: 0.8, color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: DropdownButton<String>(
                          value: selectedSparePart,
                          hint: const Text(
                              'Select Spare Part Category                   '),
                          underline: Container(),
                          icon: Align(
                            alignment: Alignment.centerRight,
                            child: Transform.rotate(
                                angle: 4.7,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 3.0),
                                  child: Icon(
                                    Icons.arrow_back_ios_outlined,
                                    color: Colors.grey.shade500,
                                    size: 15,
                                  ),
                                )),
                          ),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedSparePart = newValue;
                            });
                          },
                          items: sparePartsNames.map((String sparepart) {
                            return DropdownMenuItem<String>(
                              value: sparepart,
                              child: Text(sparepart),
                            );
                          }).toList(),
                        ))),
                SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
                MainButton(
                  width: 0.9,
                  onclick: () {
                    // underWorkAlert(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FindSparePartsPage(
                                selectedCar: selectedCar,
                                selectedModel: selectedModel,
                                selectedYear: selectedYear,
                                selectedSparePart: selectedSparePart)));
                  },
                  label: 'FIND THE SPARE PART',
                ),
/////////////////////////

                SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
                Row(children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15 / 1,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ListView.builder(
                      itemCount: vmVal.repairingCarsList.length,
                      shrinkWrap: true,
                      controller: ScrollController(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final repairedCars = vmVal.repairingCarsList[index];
                        return Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                                width: MediaQuery.of(context).size.width *
                                    0.28 /
                                    1,
                                decoration: BoxDecoration(
                                    color: MainTheme.primaryColor.shade50
                                        .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.22 /
                                              1,
                                          child: Image.network(
                                              ApiUrls.imageUrl +
                                                  repairedCars['vicle_img'],
                                              errorBuilder:
                                                  (context, error, value) {
                                            return Image.asset(
                                                ImageAssets.sparepartcar1);
                                          })),
                                      Padding(
                                          padding:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                              repairedCars['model'] +
                                                  '\n' +
                                                  repairedCars['year'],
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .copyWith(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500)))
                                    ])));
                      },

                      // Padding(
                      //   padding: const EdgeInsets.all(4.0),
                      //   child: Container(
                      //     width: MediaQuery.of(context).size.width * 0.28 / 1,
                      //     decoration: BoxDecoration(
                      //         color: MainTheme.primaryColor.shade50
                      //             .withOpacity(0.5),
                      //         borderRadius: BorderRadius.circular(20)),
                      //     child: Column(
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       children: [
                      //         SizedBox(
                      //             width: MediaQuery.of(context).size.width *
                      //                 0.22 /
                      //                 1,
                      //             child: Image.asset(ImageAssets.whitecar)),
                      //         Padding(
                      //           padding: const EdgeInsets.only(top: 5.0),
                      //           child: Text('Toyota Yaris 2008',
                      //               textAlign: TextAlign.center,
                      //               style: Theme.of(context)
                      //                   .textTheme
                      //                   .titleSmall!
                      //                   .copyWith(
                      //                       color: Colors.black,
                      //                       fontWeight: FontWeight.w500)),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.31,
                      child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: GestureDetector(
                              onTap: () async {
                                if (selectedCar!.toString().isEmpty) {
                                  showtoastF(context, 'Choose Type');
                                } else if (selectedModel!.isEmpty) {
                                  showtoastF(context, 'Choose Model');
                                } else if (selectedYear!.isEmpty) {
                                  showtoastF(context, 'Choose Year');
                                } else {
                                  final data = {
                                    "user_id": "1",
                                    "car": selectedCar.toString(),
                                    "model": selectedModel.toString(),
                                    "year": selectedYear.toString(),
                                    "choosed_spare_parts":
                                        selectedCar.toString(),
                                    "details": "something about This",
                                    "location": "dubai",
                                  };
                                  await vmVal.addSparePartsVmF(data, context);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: const Text('In Review'),
                                          duration: const Duration(seconds: 1),
                                          action: SnackBarAction(
                                              label: 'Undo',
                                              onPressed: () {})));
                                }
                              },
                              child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      0.28 /
                                      1,
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2 /
                                                1,
                                            child: Image.asset(IconAssets.add)),
                                        Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10.0),
                                            child: Text('Add New Car',
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: MainTheme
                                                            .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w500)))
                                      ])))))
                ]),

                SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
                Row(
                  children: [
                    Text(' Last Repaired',
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.black))
                  ],
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.008 / 1),

                vmVal.repairingCarsList.isEmpty
                    ? Center(
                        child: Text(
                        'Record Is Empty',
                        style: TextStyle(
                            fontSize: 26, color: Colors.grey.shade400),
                      ))
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.13 / 1,
                        child: ListView.builder(
                            shrinkWrap: true,
                            controller: ScrollController(),
                            itemCount: vmVal.repairingCarsList.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              final repairedCars =
                                  vmVal.repairingCarsList[index];
                              return Padding(
                                  padding: const EdgeInsets.only(right: 6.0),
                                  child: Card(
                                      elevation: 0.09,
                                      child: ClipRRect(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(20)),
                                          child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.78 /
                                                  1,
                                              decoration: const BoxDecoration(
                                                color: Colors.white,
                                              ),
                                              child: Row(children: [
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.12 /
                                                            1,
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3 /
                                                            1,
                                                    child: Image.network(
                                                        ApiUrls.imageUrl +
                                                            repairedCars[
                                                                'vicle_img'],
                                                        errorBuilder: (context,
                                                            error, r) {
                                                      return Image.asset(
                                                        index == 1
                                                            ? ImageAssets
                                                                .repaird1
                                                            : ImageAssets
                                                                .repaird2,
                                                        fit: BoxFit.cover,
                                                      );
                                                    })),
                                                Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 6.0),
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              repairedCars[
                                                                      'car']
                                                                  .toString(),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelLarge!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .black)),
                                                          SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.005 /
                                                                  1),
                                                          Text(
                                                              repairedCars[
                                                                      'details']
                                                                  .toString(),
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelLarge!
                                                                  .copyWith(
                                                                      color: Colors
                                                                          .grey
                                                                          .shade500)),
                                                          SizedBox(
                                                              height: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .height *
                                                                  0.005 /
                                                                  1),
                                                          Row(children: [
                                                            const Icon(
                                                                Icons
                                                                    .location_on_outlined,
                                                                color: MainTheme
                                                                    .primaryColor,
                                                                size: 16),
                                                            Text(
                                                                repairedCars[
                                                                        'location']
                                                                    .toString(),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .labelLarge!
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade500))
                                                          ])
                                                        ]))
                                              ])))));
                            }),
                      ),
              ],
            ),
          ),
        );
      });
    });
  }

  // updateTypef() {}

  void showCustomDropDownBottomSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Choose a Car',
              style: TextStyle(
                  color: MainTheme.primaryColor, fontWeight: FontWeight.bold)),
          actions: [
            Container(
              height: 300.0,
              color: Colors.blueGrey.shade200,
              child: ListView(
                children:
                    ChooseCarModelYearVmC.carNames.mapIndexed((index, car) {
                  final opacity = (selectedCar == car) ? 1.0 : 0.4;
                  return Opacity(
                    opacity: opacity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 1),
                      child: CupertinoListTile(
                          onTap: () {
                            selectedCar = car;
                            selectedModel = null;
                            selectedYear = null;
                            setState(() {});
                            Navigator.pop(context);
                          },
                          backgroundColor: (selectedCar == car)
                              ? Colors.blueGrey.shade200.withOpacity(0.3)
                              : Colors.blueGrey.shade100,
                          title: Text(car,
                              style: TextStyle(
                                  fontSize: (index == 2) ? 22 : 18.0)),
                          trailing: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.08,
                              child: Image.asset(IconAssets.kiyaIcon))),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
          cancelButton: SizedBox(
            height: MediaQuery.of(context).size.height * 0.06 / 1,
            child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      side: BorderSide(width: 0.3, color: Colors.red.shade800),
                      borderRadius: BorderRadius.circular(12))),
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blueGrey.shade50)),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style:
                    TextStyle(color: MainTheme.primaryColor.withOpacity(0.4)),
              ),
            ),
          ),
        );
      },
    );
  }
}

extension IterableExtension<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E e) f) sync* {
    var index = 0;
    for (final element in this) {
      yield f(index++, element);
    }
  }
}
