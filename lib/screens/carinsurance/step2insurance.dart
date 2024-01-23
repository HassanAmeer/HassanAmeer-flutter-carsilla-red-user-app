import 'dart:io';

import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../res/theme.dart';
import 'step3insurance.dart';

class Step2InsurancePage extends StatefulWidget {
  final String? type;
  final String? model;
  final String? year;
  final String? charges;
  final String? fname;
  final String? lname;
  final String? homeAddress;
  final String? dateofBirth;
  const Step2InsurancePage(
      {super.key,
      this.fname = '',
      this.lname = '',
      this.homeAddress = '',
      this.dateofBirth = '',
      this.type = '',
      this.model = '',
      this.year = '',
      this.charges = ''});

  @override
  State<Step2InsurancePage> createState() => _Step2InsurancePageState();
}

class _Step2InsurancePageState extends State<Step2InsurancePage> {
  TextEditingController carName = TextEditingController();
  TextEditingController plateno = TextEditingController();
  // TextEditingController buydate = TextEditingController();

  String filePath = '';
  String imagpath = '';
  String dateValue = '';

  @override
  Widget build(BuildContext context) {
    // dateContr.text = '25 - January - 1890';
    return Header(
      title: 'Insurance Claim',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02 / 1,
              width: double.infinity,
            ),
            Row(
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back))),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Upgrade to Comprehensive \nMotor Insurance Plan',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015 / 1),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Fill or Update your information and we’ll get your vehicle \ncovered in no time.',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.015 / 1),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(ImageAssets.dotsteper2),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            ListTile(
              leading: CircleAvatar(
                child: Image.asset(IconAssets.filered),
              ),
              title: Text(
                filePath.isEmpty ? 'File Not Choosed' : filePath.toString(),
                // 'Driver’s License/Dami-Benson',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.w400),
              ),
              // subtitle: SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.8 / 1,
              //   child: LinearProgressIndicator(
              //     value: 0.7,
              //     backgroundColor: Colors.red.shade200,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              // ),
              // trailing: const Text('87%'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Icon(
                  Icons.add,
                  color: Colors.orange,
                ),
                GestureDetector(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      filePath = result.files.single.path!;
                      // File file = File(result.files.single.path!);
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Text(
                    'Upload',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.grey, fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            SizedBox(
              height: 1,
              child: Divider(
                thickness: 0.5,
                color: Colors.grey.shade400,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Vehicle Information',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.15 / 1,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  imagpath.isEmpty
                      ? const SizedBox(height: 0, width: 0)
                      : Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.28 / 1,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    width: 1, color: MainTheme.primaryColor),
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.22 /
                                        1,
                                    child: Image.file(File(imagpath))
                                    // child: Image.asset(ImageAssets.whitecar),
                                    ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 5.0),
                                  child: Text(carName.text,
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .copyWith(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500)),
                                ),
                                Text(widget.year.toString(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            color: Colors.grey.shade500,
                                            fontWeight: FontWeight.w500))
                              ],
                            ),
                          ),
                        ),
                  // Padding(
                  //   padding: const EdgeInsets.all(4.0),
                  //   child: Container(
                  //     width: MediaQuery.of(context).size.width * 0.28 / 1,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(20)),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       crossAxisAlignment: CrossAxisAlignment.center,
                  //       children: [
                  //         SizedBox(
                  //             width:
                  //                 MediaQuery.of(context).size.width * 0.22 / 1,
                  //             child: Image.asset(ImageAssets.sparepartcar1)),
                  //         Padding(
                  //           padding: const EdgeInsets.only(top: 5.0),
                  //           child: Text('Benz CL250',
                  //               textAlign: TextAlign.center,
                  //               style: Theme.of(context)
                  //                   .textTheme
                  //                   .titleSmall!
                  //                   .copyWith(
                  //                       color: Colors.black,
                  //                       fontWeight: FontWeight.w500)),
                  //         ),
                  //         Text('2017',
                  //             textAlign: TextAlign.center,
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .labelLarge!
                  //                 .copyWith(
                  //                     color: Colors.grey.shade500,
                  //                     fontWeight: FontWeight.w500))
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  GestureDetector(
                    onTap: () async {
                      var image = await ImagePicker().pickImage(
                          source: ImageSource.gallery, imageQuality: 40);
                      if (image != null) {
                        setState(() {
                          imagpath = image.path;
                        });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.28 / 1,
                        decoration: BoxDecoration(
                            color:
                                MainTheme.primaryColor.shade50.withOpacity(0.6),
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
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Car Name',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06 / 1,
                decoration: BoxDecoration(
                  // color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: carName,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 0.4, color: Colors.grey.shade200)),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    hintText: ' Toyota Yaris',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Number Plate',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.06 / 1,
                decoration: BoxDecoration(
                  // color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: plateno,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            width: 0.4, color: Colors.grey.shade200)),
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    hintText: ' KSF102HS07',
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Date of  Purchase',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  showDateF();
                },
                child: Container(
                    width: MediaQuery.of(context).size.width * 0.9 / 1,
                    height: MediaQuery.of(context).size.height * 0.06 / 1,
                    decoration: BoxDecoration(
                        // color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: Center(
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              "${dateValue.isEmpty ? 'Choose' : dateValue}",
                              style: const TextStyle(),
                            ),
                          ),
                        ],
                      ),
                    )),
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: MediaQuery.of(context).size.height * 0.06 / 1,
            //     decoration: BoxDecoration(
            //       // color: Colors.grey.shade200,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: TextField(
            //       controller: buydate,
            //       decoration: InputDecoration(
            //         border: OutlineInputBorder(
            //             borderRadius: BorderRadius.circular(10),
            //             borderSide: BorderSide(
            //                 width: 0.4, color: Colors.grey.shade200)),
            //         contentPadding:
            //             const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            //         hintText: ' 25 - January - 1890',
            //         hintStyle: TextStyle(color: Colors.grey.shade400),
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            MainButton(
                width: 0.9,
                radius: 8,
                onclick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Step3InsurancePage(
                        type: widget.type,
                        model: widget.model,
                        year: widget.year,
                        charges: widget.charges,
                        fname: widget.fname,
                        lname: widget.lname,
                        homeAddress: widget.homeAddress,
                        dateofBirth: widget.dateofBirth,
                        carName: carName.text,
                        plateno: plateno.text,
                        buydate: dateValue,
                      ),
                    ),
                  );
                },
                label: 'Conitinue'.toUpperCase())
          ],
        ),
      ),
    );
  }

  showDateF() async {
    final datePickerVal = await showDatePicker(
        context: context, firstDate: DateTime.now(), lastDate: DateTime(2030));
    if (datePickerVal != null) {
      final formateDate = formatDateF(datePickerVal);
      setState(() {
        dateValue = formateDate.toString();
      });
    }
  }

  formatDateF(DateTime date) {
    return "${date.year}-${date.month}-${date.day}";
  }
}
