import 'package:carsilla/res/assets.dart';
import 'package:carsilla/services/checkradiusdistance.dart';
import 'package:carsilla/services/toast.dart';
import 'package:carsilla/services/userstorage.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

import '../../res/theme.dart';
import '../../vm/invoicesVm.dart';
import '../../vm/roadsideassis.dart';
import '../../widgets/btn.dart';
import '../../widgets/textfeild.dart';
import 'homeorroadassisopage.dart';

class HomeAssisPage extends StatefulWidget {
  final String? cityName;
  final String? locationName;
  final LatLng? currentPosition;
  const HomeAssisPage(
      {super.key,
      this.cityName = '',
      this.locationName = '',
      this.currentPosition});

  @override
  State<HomeAssisPage> createState() => _HomeAssisPageState();
}

class _HomeAssisPageState extends State<HomeAssisPage> {
  TextEditingController addressController = TextEditingController();
  TextEditingController catgController = TextEditingController();

  @override
  void initState() {
    addressController.text = widget.locationName!;
    initF();
    super.initState();
  }

  String dateVal = 'Pickup';
  String timeVal = 'Time';

  initF() {
    dateVal = formatDateF(DateTime.now());
  }

  /////////////
  showDateF() async {
    final datePickerVal = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2030));
    if (datePickerVal != null) {
      final formateDate = formatDateF(datePickerVal);
      setState(() {
        dateVal = formateDate.toString();
      });
    }
  }

  formatDateF(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }

  showTimeF() async {
    final timePickerVal =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (timePickerVal != null) {
      setState(() {
        timeVal = "${timePickerVal.hour} : ${timePickerVal.minute}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Home Assistance',
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(ImageAssets.homeassistance2),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01 / 1,
            ),
            Row(
              children: [
                Text(
                  "When To Pick Up".toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Text(
                    "Time".toUpperCase(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showDateF();
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.4 / 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(width: 0.7, color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13.0),
                        child: Center(
                            child: Text(
                          dateVal.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        )),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    showTimeF();
                  },
                  child: Container(
                      width: MediaQuery.of(context).size.width * 0.45 / 1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(9),
                        border: Border.all(width: 0.7, color: Colors.grey),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 13.0),
                        child: Center(
                            child: Text(
                          timeVal.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey.shade700),
                        )),
                      )),
                ),
              ],
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.center,
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.4 / 1,
            //       child: CustomTextFormField(
            //         hintText: "Pickup",
            //         controller: pickupcontroller,
            //         onTap: () {
            //           showDateF();
            //         },
            //       ),
            //     ),
            //     SizedBox(
            //       width: MediaQuery.of(context).size.width * 0.45 / 1,
            //       child: CustomTextFormField(
            //         hintText: "Time",
            //         controller: timecontroller,
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 12,
            ),
            Row(
              children: [
                Text(
                  "where to pick up".toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 6,
            ),

            CustomTextFormField(
              controller: addressController,
              hintText: "Your Address",
              onTap: () async {
                // await showDateF();
              },
            ),
            const SizedBox(
              height: 10,
            ),
            ////////////
            Row(
              children: [
                Text(
                  "Category".toUpperCase(),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),

            // Autocomplete(
            //   optionsBuilder: (TextEditingValue getedval) {
            //     if (getedval.text == '') {
            //       return const Iterable<String>.empty();
            //     }
            //     return dynamicname.where((String item) {
            //       return item.contains(getedval.text.toLowerCase());
            //     });
            //   },
            //   onSelected: (String item) {
            //     print('this item is selected item');
            //   },
            // ),

            GestureDetector(
              onTap: () async {
                await showCatgAlertF();
              },
              child: CustomTextFormField(
                controller: catgController,
                hintText: "Choose Your Category",
                onTap: () {},
                suffix: GestureDetector(
                  onTap: () {
                    showCatgAlertF();
                  },
                  child: Transform.rotate(
                      angle: 4.65,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey.shade400.withOpacity(0.7),
                      )),
                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            MainButton(
              onclick: () async {
                if (dateVal == 'Pickup') {
                  showtoastF(context, 'Choose Date');
                } else if (timeVal == 'Time') {
                  showtoastF(context, 'Choose Time');
                } else if (catgController.text.isEmpty) {
                  showtoastF(context, 'Choose Category');
                } else {
                  Map data = {
                    "user_id": await StorageClass.getuseridf(),
                    "when_pickup_date": dateVal,
                    "from_pickup_address": addressController.text,
                    "from_address_lat": widget.currentPosition!.latitude,
                    "from_address_lng": widget.currentPosition!.longitude,
                    "coming_to_pickup_loc": '',
                    "coming_to_pickup_loc_lat": '',
                    "coming_to_pickup_loc_lng": '',
                    "time": timeVal,
                    "category": catgController.text
                  };
                  await RoadSideAssisVmC().sendHomeAssisVmF(data, context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeOrRoadAssisPage(
                        pickupDate: dateVal,
                        pickupTime: timeVal,
                        whereToPickup: addressController.text,
                        catgory: catgController.text,
                        cityLoc: widget.cityName,
                        latLng: widget.currentPosition,
                      ),
                    ),
                  );
                }
              },
              width: double.infinity,
              label: "REQUEST YOUR ORDER",
            ),
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Text(
                  "Invoices And Payment History ",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MainTheme.primaryColor),
                ),
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            ///////////////// start a slider
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.142 / 1,
                child: Consumer<InvoicesVmC>(builder: (context, vmVal, child) {
                  vmVal.getInvoiceDataVmF(context);
                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      controller: ScrollController(),
                      itemCount: vmVal.invoicesListOfAssis.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8 / 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(
                                color: Colors.grey.shade300,
                                width: 2.0,
                              ),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      vertical: 0, horizontal: 8),
                                  title: Text(
                                    vmVal.invoicesListOfAssis[index]
                                        ['invoice_title'],
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(fontWeight: FontWeight.bold),
                                    maxLines: 1,
                                  ),
                                  subtitle: SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.8 /
                                        1,
                                    child: ReadMoreText(
                                      vmVal.invoicesListOfAssis[index]
                                          ['invoice_desc'],
                                      // "Locate the handbrake cable under \nyour vehicle,which connects to the rear brakes.",
                                      trimLines: 2,
                                      colorClickableText:
                                          MainTheme.primaryColor,
                                      trimMode: TrimMode.Line,
                                      trimCollapsedText: " ",
                                      moreStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(fontSize: 8),
                                      lessStyle: Theme.of(context)
                                          .textTheme
                                          .labelSmall!
                                          .copyWith(fontSize: 8),
                                    ),
                                  ),
                                  trailing: Image.asset(
                                    IconAssets.pdficon,
                                    height: MediaQuery.of(context).size.height *
                                        0.04 /
                                        1,
                                  ),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width *
                                      0.8 /
                                      1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Read More",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge!
                                            .copyWith(
                                                color: MainTheme.primaryColor),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 14.0),
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(
                                                text: vmVal.invoicesListOfAssis[
                                                                index]
                                                                ['created_at']
                                                            .toString()
                                                            .length >=
                                                        10
                                                    ? vmVal.invoicesListOfAssis[
                                                            index]['created_at']
                                                        .toString()
                                                        .substring(0, 10)
                                                    : vmVal.invoicesListOfAssis[
                                                        index]['created_at'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelLarge!
                                                    .copyWith(
                                                        color: Colors
                                                            .blueGrey.shade200),
                                              ),
                                            ],
                                          ),
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Due",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .copyWith(
                                                      color: MainTheme
                                                          .primaryColor),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 4.0),
                                              child: Text(
                                                "\$${vmVal.invoicesListOfAssis[index]['total_pay']}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleLarge!
                                                    .copyWith(
                                                        color: Colors.black87,
                                                        fontWeight:
                                                            FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                })),
            ///////////////// end slider
          ],
        ),
      ),
    );
  }

  showCatgAlertF() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, widget) {
            return AlertDialog(
              backgroundColor: Colors.white,
              title: const Center(child: Text('Category')),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 1,
                      child:
                          Divider(thickness: 0.6, color: Colors.grey.shade400)),
                  CupertinoListTile(
                      onTap: () {
                        setState(() {
                          catgController.text = 'Toyota';
                        });
                        Navigator.pop(context);
                      },
                      title: Text('Toyota')),
                  SizedBox(
                      height: 1,
                      child:
                          Divider(thickness: 0.6, color: Colors.grey.shade400)),
                  CupertinoListTile(
                      onTap: () {
                        setState(() {
                          catgController.text = 'Civic';
                        });
                        Navigator.pop(context);
                      },
                      title: Text('Civic')),
                  SizedBox(
                      height: 1,
                      child:
                          Divider(thickness: 0.6, color: Colors.grey.shade400)),
                  CupertinoListTile(
                      onTap: () {
                        setState(() {
                          catgController.text = 'Honda';
                        });
                        Navigator.pop(context);
                      },
                      title: Text('Honda')),
                  SizedBox(
                      height: 1,
                      child:
                          Divider(thickness: 0.6, color: Colors.grey.shade400)),
                ],
              ),
            );
          });
        });
  }
}
