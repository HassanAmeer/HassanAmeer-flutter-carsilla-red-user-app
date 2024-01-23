// import 'dart:async';

import 'package:carsilla/res/assets.dart';
import 'package:carsilla/screens/workshopservices/orderdetailspage.dart';
import 'package:carsilla/services/toast.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/headerwithimg.dart';
import 'package:carsilla/widgets/textfeild.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
import 'package:readmore/readmore.dart';

import '../../res/theme.dart';
// import '../../services/checkradiusdistance.dart';
// import '../../services/convert.dart';
// import '../../widgets/alert.dart';
import '../../vm/invoicesVm.dart';
import '../../widgets/bottomnavbar.dart';

class WorkShopServicesPage extends StatefulWidget {
  const WorkShopServicesPage({super.key});

  @override
  State<WorkShopServicesPage> createState() => _WorkShopServicesPageState();
}

class _WorkShopServicesPageState extends State<WorkShopServicesPage> {
  // TextEditingController whenfrompickupcontroller = TextEditingController();
  TextEditingController wherecontroller = TextEditingController();
  // TextEditingController timecontroller = TextEditingController();

  String dateVal = 'Pickup';
  String timeVal = 'Time';

  initF() {
    dateVal = formatDateF(DateTime.now()).toString();
    setState(() {});
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
    // whenfrompickupcontroller.text = 'Thu, 17 Feb';
    // timecontroller.text = '10:00 AM';
    return HeaderWithImage(
      title: 'Workshop Services',
      headeimg: ImageAssets.workshop,
      marginToTopHeadeImg: 0.0,
      marginbodyfrombottom: 0.06,
      navbar: const NavBarWidget(),
      onTopOfheImage: Text(
        'Welcome to \nCarsilla Workshop',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Row(
              children: [
                Text('Make a car maintenance appointment',
                    style: textTheme.titleSmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: MainTheme.primaryColor)),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4 / 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('WHEN TO PICKUP',
                          style: textTheme.labelSmall!.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600)),
                      GestureDetector(
                        onTap: () {
                          showDateF();
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.4 / 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              border:
                                  Border.all(width: 0.7, color: Colors.grey),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 13.0),
                              child: Center(
                                  child: Text(
                                dateVal.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade700),
                              )),
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4 / 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('TIME',
                          style: textTheme.labelSmall!.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey.shade600)),
                      GestureDetector(
                        onTap: () {
                          showTimeF();
                        },
                        child: Container(
                            width: MediaQuery.of(context).size.width * 0.45 / 1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              border:
                                  Border.all(width: 0.7, color: Colors.grey),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 13.0),
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
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Row(
              children: [
                Text('WHERE TO PICKUP',
                    style: textTheme.labelSmall!.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey.shade600)),
              ],
            ),
            CustomTextFormField(
              hintText: 'Your Address',
              controller: wherecontroller,
              textStyle: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            MainButton(
              width: 0.9,
              onclick: () {
                if (dateVal == 'Pickup') {
                  showtoastF(context, 'Choose Date');
                } else if (timeVal == 'Time') {
                  showtoastF(context, 'Choose Time');
                } else if (wherecontroller.text.isEmpty) {
                  showtoastF(context, 'Enter Your Address');
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderDetailsPage(
                          wherefrompickup: wherecontroller.text,
                          whentopickup: dateVal,
                          timeonpickup: timeVal),
                    ),
                  );
                }
                // underWorkAlert(context);
              },
              label: 'REQUEST YOUR ORDER',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Row(
              children: [
                Text('Invoices And Payment History ',
                    style: textTheme.titleSmall!.copyWith(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: MainTheme.primaryColor)),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.007 / 1),
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
            ///////////////// end slider
            SizedBox(height: MediaQuery.of(context).size.height * 0.04 / 1),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset(ImageAssets.homebanner),
            ),
          ],
        ),
      ),
    );
  }
}
