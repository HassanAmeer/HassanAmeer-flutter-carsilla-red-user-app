import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/headerwithimg.dart';
import 'package:carsilla/widgets/textfeild.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../res/theme.dart';
import '../../../widgets/alert.dart';
import '../../resources/urls.dart';
import '../../services/toast.dart';
import '../../vm/chooseCarModelYearVm.dart';
import '../../vm/insuranceVM.dart';
import '../../widgets/bottomnavbar.dart';
import 'insurancecompanies.dart';

class CarInsurancePage extends StatefulWidget {
  const CarInsurancePage({super.key});

  @override
  State<CarInsurancePage> createState() => _CarInsurancePageState();
}

class _CarInsurancePageState extends State<CarInsurancePage> {
  TextEditingController pickupcontroller = TextEditingController();
  TextEditingController timecontroller = TextEditingController();

//////////////
  String? selectedCar;
  String? selectedModel;
  String? selectedYear;
//////////////

  @override
  void initState() {
    super.initState();
    Provider.of<InsuranceVmC>(context, listen: false).getInsuranceVmF(context);
  }

  @override
  Widget build(BuildContext context) {
    // pickupcontroller.text = 'Car';
    // timecontroller.text = 'Car';
    return HeaderWithImage(
      title: 'Car Insurance',
      headeimg: ImageAssets.insurnceimg1,
      marginToTopHeadeImg: 0.0,
      marginbodyfrombottom: 0.06,
      navbar: const NavBarWidget(),
      ontopimagecontentleft: MediaQuery.of(context).size.width * 0.13 / 1,
      onTopOfheImage: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Upgrade your Motor Insurance Plan',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.white,
                  ),
            ),
            Text(
              'Enjoy more courage on the \nComprehensive Motor Insurance',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Colors.grey.shade200, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
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
                                          padding:
                                              const EdgeInsets.only(left: 3.0),
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
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                      child: Center(
                                          child: DropdownButton<String>(
                                              value: selectedModel,
                                              hint:
                                                  const Text(' Model        '),
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
                                                      child: Icon(
                                                          Icons
                                                              .arrow_back_ios_outlined,
                                                          color: Colors
                                                              .grey.shade500,
                                                          size: 17))),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  selectedModel = newValue;
                                                  selectedYear = null;
                                                });
                                              },
                                              items: selectedCar != null
                                                  ? ChooseCarModelYearVmC
                                                          .modelsByCar[
                                                              selectedCar!]
                                                          ?.map((String model) {
                                                        return DropdownMenuItem<
                                                                String>(
                                                            value: model,
                                                            child: Text(model));
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
                              width:
                                  MediaQuery.of(context).size.width * 0.42 / 1,
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
                                                Icons.arrow_back_ios_outlined,
                                                color: Colors.grey.shade500,
                                                size: 17))),
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
                //

                Consumer<InsuranceVmC>(
                    builder: (context, insuranceValVm, child) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15 / 1,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ListView.builder(
                      itemCount: insuranceValVm.insuranceList.length,
                      shrinkWrap: true,
                      controller: ScrollController(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final data = insuranceValVm.insuranceList[index];
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.28 / 1,
                            decoration: BoxDecoration(
                                color: MainTheme.primaryColor.shade50
                                    .withOpacity(0.5),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.22 /
                                        1,
                                    child: Image.network(
                                        ApiUrls.imageUrl + data['car_img'],
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            0.2 /
                                            1,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.085 /
                                                1,
                                        errorBuilder: (context, error, value) {
                                      return Image.asset(
                                          ImageAssets.sparepartcar1);
                                    })),
                                Padding(
                                  padding: const EdgeInsets.only(top: 2.0),
                                  child: Text(
                                      " ${data['car']} \n ${data['year']}",
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),

                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.31,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: GestureDetector(
                      onTap: () async {
                        // if (selectedCar!.toString().isEmpty) {
                        //   showtoastF(context, 'Choose Type');
                        // } else if (selectedModel!.isEmpty) {
                        //   showtoastF(context, 'Choose Model');
                        // } else if (selectedYear!.isEmpty) {
                        //   showtoastF(context, 'Choose Year');
                        // } else {
                        //   Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //       builder: (context) => Companies(
                        //           type: selectedCar,
                        //           model: selectedModel,
                        //           year: selectedYear),
                        //     ),
                        //   );
                        // final data = {
                        //   "user_id": "1",
                        //   "car": selectedCar.toString(),
                        //   "model": selectedModel.toString(),
                        //   "year": selectedYear.toString(),
                        //   "choosed_spare_parts": selectedCar.toString(),
                        //   "details": "something about This",
                        //   "location": "dubai",
                        // };
                        // await vmVal.addSparePartsVmF(data, context);
                        // }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Companies(
                                    type: selectedCar,
                                    model: selectedModel,
                                    year: selectedYear)));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.28 / 1,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width:
                                    MediaQuery.of(context).size.width * 0.2 / 1,
                                child: Image.asset(IconAssets.add)),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10.0),
                              child: Text('Add New Car',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: MainTheme.primaryColor,
                                          fontWeight: FontWeight.w500)),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),

            MainButton(
              width: 0.9,
              onclick: () {
                // if (selectedCar!.toString().isEmpty) {
                //   showtoastF(context, 'Choose Type');
                // } else if (selectedModel!.isEmpty) {
                //   showtoastF(context, 'Choose Model');
                // } else if (selectedYear!.isEmpty) {
                //   showtoastF(context, 'Choose Year');
                // } else {
                //   Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => Companies(
                //           type: selectedCar,
                //           model: selectedModel,
                //           year: selectedYear),
                //     ),
                //   );
                // }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Companies(
                            type: selectedCar,
                            model: selectedModel,
                            year: selectedYear)));
              },
              label: 'FIND INSURANCE COMPANIES',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),

            // SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            // Row(
            //   children: [
            //     Text(' Reviews',
            //         style: Theme.of(context)
            //             .textTheme
            //             .titleSmall!
            //             .copyWith(color: Colors.black)),
            //     Text(' (210+)',
            //         style: Theme.of(context)
            //             .textTheme
            //             .labelMedium!
            //             .copyWith(color: Colors.grey.shade500))
            //   ],
            // ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.008 / 1),
          ],
        ),
      ),
    );
  }
  ///////////////////

  updateCarTypeValiue(value) {
    selectedCar = value;
    selectedModel = null;
    selectedYear = null;
    setState(() {});
  }

  void showCustomDropDownBottomSheet(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: const Text('Choose a Car',
              style: TextStyle(
                  color: MainTheme.primaryColor, fontWeight: FontWeight.bold)),
          actions: [
            StatefulBuilder(builder: (context, setState) {
              return Container(
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
                              updateCarTypeValiue(car.toString());
                              Navigator.pop(context);
                              setState(() {});
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
              );
            }),
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
