import 'dart:io';

import 'package:carsilla/res/assets.dart';
import 'package:carsilla/res/theme.dart';
import 'package:carsilla/services/toast.dart';
import 'package:carsilla/services/userstorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:faabul_color_picker/faabul_color_picker.dart';
import '../../vm/carlistingvm.dart';
import '../../vm/chooseCarModelYearVm.dart';
import '../../widgets/btn.dart';
import '../../widgets/header.dart';
import '../../widgets/textfeild.dart';
import 'carlistedpage.dart';

class AddYourCarPage extends StatefulWidget {
  const AddYourCarPage({super.key});

  @override
  State<AddYourCarPage> createState() => _AddYourCarPageState();
}

class _AddYourCarPageState extends State<AddYourCarPage> {
  final typecontroller = TextEditingController();
  final modelcontroller = TextEditingController();
  final yearcontroller = TextEditingController();
  final featuresController = TextEditingController();
  final speedController = TextEditingController();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final priceController = TextEditingController();

  List imagesList = [];
  List featuresList = [];

  String gear = 'Select';
  String speed = 'Select';
  Color cyl = Colors.red;
  String climate = 'Select';
  String fuel = 'Select';
  String seats = 'Select';

////////////
  String? selectedCar;
  String? selectedModel;
  String? selectedYear;

////////////
  @override
  Widget build(BuildContext context) {
    typecontroller.text = 'Car';
    modelcontroller.text = 'X4';
    yearcontroller.text = '2016';
    return Header(
      title: 'Add Your Car',
      body: Column(
        children: [
          ///////////

          Padding(
            padding: const EdgeInsets.only(
                top: 14.0, left: 14, right: 14, bottom: 4),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    'Vehicle Details',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MainTheme.primaryColor),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14.0, right: 14),
            child: GestureDetector(
              onTap: () async {
                var image = await ImagePicker()
                    .pickImage(source: ImageSource.gallery, imageQuality: 40);
                if (image != null) {
                  setState(() {
                    imagesList.add(image.path);
                  });
                }
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.25 / 1,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(13),
                    image: imagesList.isNotEmpty
                        ? DecorationImage(
                            image: FileImage(File(imagesList.last)),
                            fit: BoxFit.cover,
                            opacity: 0.3)
                        : DecorationImage(
                            image: AssetImage(
                              IconAssets.camera,
                            ),
                            fit: BoxFit.fill,
                            opacity: 0)),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        'Add Image',
                        style: TextStyle(color: Colors.white),
                      ),
                      Image.asset(
                        IconAssets.camera,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          imagesList.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1 / 1,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(),
                    itemCount: imagesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            imagesList.removeAt(index);
                            setState(() {});
                          },
                          child: Badge(
                            label: const Icon(
                              Icons.delete_outlined,
                              color: Colors.white,
                              size: 13,
                            ),
                            child: Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.2 / 1,
                              height:
                                  MediaQuery.of(context).size.height * 0.1 / 1,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 0.5,
                                      color: MainTheme.primaryColor)),
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Image.file(File(imagesList[index]),
                                    width: MediaQuery.of(context).size.width *
                                        0.2 /
                                        1,
                                    height: MediaQuery.of(context).size.height *
                                        0.1 /
                                        1,
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(height: 0),

          // SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
          // Row(
          //   children: [
          //     Text('Choose Your Vehicle',
          //         style: textTheme.titleSmall!.copyWith(
          //             fontSize: 13,
          //             fontWeight: FontWeight.w500,
          //             color: MainTheme.primaryColor)),
          //   ],
          // ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.085 / 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28 / 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TYPE',
                            style: textTheme.labelSmall!.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600)),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.32 / 1,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.8, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Center(
                                child: DropdownButton<String>(
                                  value: selectedCar,
                                  hint: const Text('Car'),
                                  underline: Container(),
                                  icon: Transform.rotate(
                                      angle: 4.7,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 3.0),
                                        child: Icon(
                                          Icons.arrow_back_ios_outlined,
                                          color: Colors.grey.shade500,
                                          size: 15,
                                        ),
                                      )),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedCar = newValue;
                                      selectedModel = null;
                                      selectedYear = null;
                                    });
                                  },
                                  items: ChooseCarModelYearVmC.carNames
                                      .map((String car) {
                                    return DropdownMenuItem<String>(
                                      value: car,
                                      child: Text(car),
                                    );
                                  }).toList(),
                                ),
                              ),
                            )),

                        // CustomTextFormField(
                        //   controller: typecontroller,
                        //   hintText: 'Type',
                        //   suffix: Transform.rotate(
                        //       angle: 4.65,
                        //       child: const Icon(
                        //         Icons.arrow_back_ios_outlined,
                        //         color: Colors.transparent,
                        //         // color: Colors.grey.shade500,
                        //       )),
                        //   textStyle: Theme.of(context)
                        //       .textTheme
                        //       .labelMedium!
                        //       .copyWith(),
                        // )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28 / 1,
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
                            width: MediaQuery.of(context).size.width * 0.32 / 1,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.8, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Center(
                                child: DropdownButton<String>(
                                  value: selectedModel,
                                  hint: const Text(' Model'),
                                  underline: Container(),
                                  icon: Transform.rotate(
                                      angle: 4.7,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 3.0),
                                        child: Icon(
                                          Icons.arrow_back_ios_outlined,
                                          color: Colors.grey.shade500,
                                          size: 17,
                                        ),
                                      )),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedModel = newValue;
                                      selectedYear = null;
                                    });
                                  },
                                  items: selectedCar != null
                                      ? ChooseCarModelYearVmC
                                              .modelsByCar[selectedCar!]
                                              ?.map((String model) {
                                            return DropdownMenuItem<String>(
                                              value: model,
                                              child: Text(model),
                                            );
                                          }).toList() ??
                                          []
                                      : [],
                                ),
                              ),
                            )),
                        // CustomTextFormField(
                        //   controller: modelcontroller,
                        //   hintText: 'Model',
                        //   suffix: Transform.rotate(
                        //       angle: 4.65,
                        //       child: const Icon(
                        //         Icons.arrow_back_ios_outlined,
                        //         color: Colors.transparent,

                        //         // color: Colors.grey.shade500,
                        //       )),
                        //   textStyle: Theme.of(context)
                        //       .textTheme
                        //       .labelMedium!
                        //       .copyWith(),
                        // )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.28 / 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('YEAR',
                            style: textTheme.labelSmall!.copyWith(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey.shade600)),
                        Container(
                            width: MediaQuery.of(context).size.width * 0.32 / 1,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 0.8, color: Colors.grey.shade400),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: Center(
                                child: DropdownButton<String>(
                                  underline: Container(),
                                  value: selectedYear,
                                  hint: const Text(' Year'),
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedYear = newValue;
                                    });
                                  },
                                  icon: Transform.rotate(
                                      angle: 4.7,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 3.0),
                                        child: Icon(
                                          Icons.arrow_back_ios_outlined,
                                          color: Colors.grey.shade500,
                                          size: 17,
                                        ),
                                      )),
                                  items: selectedModel != null
                                      ? ChooseCarModelYearVmC
                                              .yearsByModel[selectedModel!]
                                              ?.map((String year) {
                                            return DropdownMenuItem<String>(
                                              value: year,
                                              child: Text(year),
                                            );
                                          }).toList() ??
                                          []
                                      : [],
                                ),
                              ),
                            )),
                        // CustomTextFormField(
                        //   controller: yearcontroller,
                        //   hintText: 'Year',
                        //   suffix: Transform.rotate(
                        //       angle: 4.65,
                        //       child: const Icon(
                        //         Icons.arrow_back_ios_outlined,
                        //         color: Colors.transparent,
                        //         // color: Colors.grey.shade500,
                        //       )),
                        //   textStyle: Theme.of(context)
                        //       .textTheme
                        //       .labelMedium!
                        //       .copyWith(),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Text('Features'.toUpperCase(),
                    style: textTheme.labelSmall!.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500)),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
            child: CustomTextFormField(
              hintText: ' ',
              controller: featuresController,
              suffix: Transform.rotate(
                  angle: 4.65,
                  child: IconButton(
                    onPressed: () {
                      if (featuresController.text.trim().isNotEmpty) {
                        featuresList.add(featuresController.text);
                        featuresController.clear();
                        setState(() {});
                      }
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey.shade500,
                    ),
                  )),
            ),
          ),

          featuresList.isNotEmpty
              ? SizedBox(
                  height: MediaQuery.of(context).size.height * 0.07 / 1,
                  child: ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    scrollDirection: Axis.horizontal,
                    itemCount: featuresList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Opacity(
                        opacity: 0.5,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Chip(
                            label: Text(featuresList[index].toString()),
                            deleteIconColor: Colors.grey,
                            onDeleted: () {
                              featuresList.removeAt(index);
                              setState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox(height: 0),
          // Padding(
          //   padding: const EdgeInsets.all(14.0),
          //   child: Image.asset(IconAssets.Features),
          // ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Row(
              children: [
                Text('Specifications'.toUpperCase(),
                    style: textTheme.labelSmall!.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade500)),
              ],
            ),
          ),
          /////////// added features from selection satrt
          Wrap(children: [
            GestureDetector(
              onTap: () {
                showGearDialogF();
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.46 / 1,
                child: ListTile(
                  leading: Image.asset(IconAssets.features1),
                  title: Text('Gear',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500)),
                  subtitle: Text(gear,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showSpeedDialogF();
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.46 / 1,
                child: ListTile(
                  leading: Image.asset(IconAssets.features2),
                  title: Text('Mileage',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500)),
                  subtitle: Text("$speed KM/h",
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {
                final color = await showColorPickerDialog(
                  context: context,
                  selected: Colors.white,
                  colors: [
                    FaabulColorShades(color: Colors.yellow, shades: [
                      Colors.yellow.shade200,
                      Colors.yellow,
                      Colors.yellowAccent,
                      Colors.yellow.shade700,
                    ]),
                    const FaabulColorShades(color: Colors.red, shades: [
                      Colors.red,
                      Colors.redAccent,
                    ]),
                    const FaabulColorShades(color: Colors.green, shades: [
                      Colors.lightGreen,
                      Colors.green,
                      Colors.lightGreenAccent,
                      Colors.greenAccent,
                    ]),
                    const FaabulColorShades(color: Colors.blue, shades: [
                      Colors.lightBlue,
                      Colors.blue,
                      Colors.lightBlueAccent,
                      Colors.blueAccent,
                    ]),
                    FaabulColorShades(color: Colors.white, shades: [
                      Colors.white,
                      Colors.grey.shade300,
                      Colors.grey.shade500,
                      Colors.grey.shade700,
                    ]),
                    FaabulColorShades(color: Colors.black, shades: [
                      Colors.grey.shade700,
                      Colors.grey.shade900,
                      Colors.black,
                    ]),
                  ],
                );
                if (color != null) {
                  setState(() {
                    cyl = color;
                  });
                }

                // showCylDialogF();
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.46 / 1,
                child: ListTile(
                  leading: Image.asset(IconAssets.features3),
                  title: Text('Color',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500)),
                  subtitle: FaabulColorSample(color: cyl, size: 10),
                  // subtitle: Text(cyl,
                  //     style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  //         fontWeight: FontWeight.w500,
                  //         color: Colors.grey.shade900)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showClimateF();
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.46 / 1,
                child: ListTile(
                  leading: Image.asset(IconAssets.features4),
                  title: Text('Warranty',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500)),
                  subtitle: Text(climate,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showFuelF();
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.46 / 1,
                child: ListTile(
                  leading: Image.asset(IconAssets.features5),
                  title: Text('Fuel Type',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500)),
                  subtitle: Text(fuel,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900)),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                showSeatsF();
              },
              child: Container(
                decoration: const BoxDecoration(color: Colors.white),
                width: MediaQuery.of(context).size.width * 0.46 / 1,
                child: ListTile(
                  leading: Image.asset(IconAssets.features6),
                  title: Text('Seats',
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500)),
                  subtitle: Text(seats,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade900)),
                ),
              ),
            ),
          ]),
          /////////// added features from selection end
          SizedBox(height: MediaQuery.of(context).size.height * 0.015 / 1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: CustomTextFormField(
              hintText: 'Name',
              controller: titleController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: CustomTextFormField(
              maxLines: 3,
              hintText: 'Description',
              controller: descriptionController,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
            child: CustomTextFormField(
              hintText: 'Price',
              controller: priceController,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.015 / 1),
          MainButton(
            width: 0.9,
            onclick: () async {
              if (selectedCar!.isEmpty) {
                showtoastF(context, 'Choose Type');
              } else if (selectedModel!.isEmpty) {
                showtoastF(context, 'Choose Model');
              } else if (selectedYear!.isEmpty) {
                showtoastF(context, 'Choose Year');
              } else if (titleController.text.isEmpty) {
                showtoastF(context, 'Enter Name');
              } else if (priceController.text.isEmpty) {
                showtoastF(context, 'Enter Price');
              } else if (gear == 'Select') {
                showtoastF(context, 'Choose Gear Fetures');
              } else if (speed == 'Select') {
                showtoastF(context, 'Choose Speed Fetures');
              } else if (cyl == 'Select') {
                showtoastF(context, 'Choose Cylinders Fetures');
              } else if (gear == 'Select') {
                showtoastF(climate, 'Choose Gear Fetures');
              } else if (fuel == 'Select') {
                showtoastF(context, 'Choose Fuel Fetures');
              } else if (seats == 'Select') {
                showtoastF(context, 'Choose Seats Fetures');
              } else {
                Provider.of<CarListingVmC>(context, listen: false)
                    .addCarListingDataVmF(context,
                        user_id:
                            await StorageClass.getuseridf() ?? 1.toString(),
                        // dealer_id: 'your_dealer_id_value',
                        // total_views: 'your_total_views_value',
                        listing_type: selectedYear ?? ' ',
                        listing_model: selectedModel ?? ' ',
                        listing_year: selectedYear ?? ' ',
                        listing_title: titleController.text ?? ' ',
                        listing_desc: descriptionController.text ??
                            'Something About This',
                        imagesList: imagesList,
                        listing_price: priceController.text ?? '00',
                        features_gear: gear,
                        features_speed: speed,
                        features_seats: seats,
                        features_door: seats,
                        features_fuel_type: fuel,
                        features_climate_zone: climate,
                        features_cylinders: cyl.toString(),
                        features_bluetooth: 'yes',
                        features_others: featuresList ?? ['Extra features']);

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CarListedPage(
                      title: titleController.text ?? '',
                      type: typecontroller.text ?? '',
                      desc: descriptionController.text ?? '',
                      price: priceController.text ?? '',
                      image:
                          imagesList.isNotEmpty ? imagesList[0].toString() : '',
                      gearF: gear,
                      speedF: speed,
                      cylF: cyl.toString(),
                      climatesF: climate,
                      fuelF: fuel,
                      seatsF: seats,
                    ),
                  ),
                );
              }
            },
            label: 'DONE',
          )
        ],
      ),
    );
  }

  ///////////////////////////////////////

  ///////////////////////////////////////
  updateGear(val) {
    setState(() {
      gear = val;
    });
  }

  showGearDialogF() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return CupertinoAlertDialog(
            title: const Text('Gear'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoListTile(
                  onTap: () {
                    updateGear('Auto');
                    Navigator.pop(context);
                  },
                  title: const Text('Auto'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateGear('Manual');
                    Navigator.pop(context);
                  },
                  title: const Text('Manual'),
                ),
                const SizedBox(height: 1, child: Divider()),
              ],
            ),
            insetAnimationCurve: Curves.slowMiddle,
            insetAnimationDuration: const Duration(seconds: 2),
          );
        });
      },
    );
  }

  ///////////////////////////////////////
  ///////////////////////////////////////
  showSpeedDialogF() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Mileage'),
            content: TextField(
              controller: speedController,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    updateSpeedF(speedController.text.isEmpty
                        ? '00'
                        : speedController.text);
                    Navigator.pop(context);
                  },
                  child: const Text('Save'))
            ],
          );
        });
      },
    );
  }

  updateSpeedF(val) {
    setState(() {
      speed = val;
    });
  }

  ///////////////////////////////////////

  ///////////////////////////////////////
  showCylDialogF() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text('Pick Color'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoListTile(
                  onTap: () {
                    updateCylF('2');
                    Navigator.pop(context);
                  },
                  title: const Text('2'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateCylF('4');
                    Navigator.pop(context);
                  },
                  title: const Text('4'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateCylF('6');
                    Navigator.pop(context);
                  },
                  title: const Text('6'),
                ),
                const SizedBox(height: 1, child: Divider()),
              ],
            ),
          );
        });
      },
    );
  }

  updateCylF(val) {
    setState(() {
      cyl = val;
    });
  }

  ///////////////////////////////////////
  ///////////////////////////////////////
  updateClimateF(val) {
    setState(() {
      climate = val;
    });
  }

  showClimateF() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return CupertinoAlertDialog(
            title: const Text('Warranty'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoListTile(
                  onTap: () {
                    updateClimateF('Under Warranty');
                    Navigator.pop(context);
                  },
                  title: const Text('Under Warranty'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateClimateF('Not Available');
                    Navigator.pop(context);
                  },
                  title: const Text('Not Availble'),
                ),
                const SizedBox(height: 1, child: Divider()),
              ],
            ),
            insetAnimationCurve: Curves.slowMiddle,
            insetAnimationDuration: const Duration(seconds: 2),
          );
        });
      },
    );
  }

  ///////////////////////////////////////
  ///////////////////////////////////////
  updateFuelF(val) {
    setState(() {
      fuel = val;
    });
  }

  showFuelF() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return CupertinoAlertDialog(
            title: const Text('Climate Control'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoListTile(
                  onTap: () {
                    updateFuelF('Single');
                    Navigator.pop(context);
                  },
                  title: const Text('Single'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateFuelF('Gasoline (Petrol)');
                    Navigator.pop(context);
                  },
                  title: const Text('Gasoline (Petrol)'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateFuelF('Diesel');
                    Navigator.pop(context);
                  },
                  title: const Text('Diesel'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateFuelF('Hybrid');
                    Navigator.pop(context);
                  },
                  title: const Text('Hybrid'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateFuelF('Electric');
                    Navigator.pop(context);
                  },
                  title: const Text('Electric'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateFuelF('Flex Fuel');
                    Navigator.pop(context);
                  },
                  title: const Text('Flex Fuel'),
                ),
                const SizedBox(height: 1, child: Divider()),
              ],
            ),
            insetAnimationCurve: Curves.slowMiddle,
            insetAnimationDuration: const Duration(seconds: 2),
          );
        });
      },
    );
  }

  ///////////////////////////////////////
  ///////////////////////////////////////
  updateSeatsF(val) {
    setState(() {
      seats = val;
    });
  }

  showSeatsF() {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(builder: (BuildContext context, setState) {
          return CupertinoAlertDialog(
            title: const Text('Climate Control'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoListTile(
                  onTap: () {
                    updateSeatsF('Single');
                    Navigator.pop(context);
                  },
                  title: const Text('Single'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateSeatsF('2');
                    Navigator.pop(context);
                  },
                  title: const Text('2'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateSeatsF('4');
                    Navigator.pop(context);
                  },
                  title: const Text('4'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateSeatsF('6');
                    Navigator.pop(context);
                  },
                  title: const Text('6'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateSeatsF('8');
                    Navigator.pop(context);
                  },
                  title: const Text('8'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateSeatsF('10');
                    Navigator.pop(context);
                  },
                  title: const Text('10'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateSeatsF('12');
                    Navigator.pop(context);
                  },
                  title: const Text('12'),
                ),
                const SizedBox(height: 1, child: Divider()),
                CupertinoListTile(
                  onTap: () {
                    updateSeatsF('14');
                    Navigator.pop(context);
                  },
                  title: const Text('14'),
                ),
                const SizedBox(height: 1, child: Divider()),
              ],
            ),
            insetAnimationCurve: Curves.slowMiddle,
            insetAnimationDuration: const Duration(seconds: 2),
          );
        });
      },
    );
  }

  ///////////////////////////////////////
}
