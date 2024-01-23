import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';

import 'step2insurance.dart';

class Step1InsurancePage extends StatefulWidget {
  final String? type;
  final String? model;
  final String? year;
  final String? charges;
  const Step1InsurancePage(
      {super.key,
      this.type = '',
      this.model = '',
      this.year = '',
      this.charges = ''});

  @override
  State<Step1InsurancePage> createState() => _Step1InsurancePageState();
}

class _Step1InsurancePageState extends State<Step1InsurancePage> {
  TextEditingController fnameContr = TextEditingController();
  TextEditingController lNameContr = TextEditingController();
  TextEditingController homeAddressController = TextEditingController();
  String dateValue = '';
  @override
  Widget build(BuildContext context) {
    // dateContr.text = '25 - January - 1890';
    return Header(
      title: 'Welcome Back',
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
              child: Image.asset(ImageAssets.dotsteper1),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    'First Name',
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
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: fnameContr,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    hintText: ' Damola',
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
                    'Last Name',
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
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  controller: lNameContr,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    hintText: ' Benson-Okoh',
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
                    'Home Address',
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Colors.black, fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: homeAddressController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide:
                          BorderSide(width: 0.4, color: Colors.grey.shade200)),
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  hintText: ' Home Address',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 11.0),
                  child: Text(
                    'Date of  Birth',
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
                    )
                    // child: TextField(
                    //   controller: dateContr,
                    //   onTap: () async {
                    //     await showDateF();
                    //   },
                    //   decoration: InputDecoration(
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(10),
                    //         borderSide: BorderSide(
                    //             width: 0.4, color: Colors.grey.shade200)),
                    //     contentPadding:
                    //         const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                    //     hintText: ' 25 - January - 1890',
                    //     hintStyle: TextStyle(color: Colors.grey.shade400),
                    //   ),
                    // ),
                    ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            MainButton(
                width: 0.9,
                radius: 8,
                onclick: () {
// fnameContr = TextEditingController();
//   TextEditingController lNameContr = TextEditingController();
//   TextEditingController homeAddressController = TextEditingController();
//   String dateValue = '';

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Step2InsurancePage(
                        type: widget.type,
                        model: widget.model,
                        year: widget.year,
                        charges: widget.charges,
                        fname: fnameContr.text,
                        lname: lNameContr.text,
                        homeAddress: homeAddressController.text,
                        dateofBirth: dateValue,
                      ),
                    ),
                  );
                },
                label: 'FIND INSURANCE COMPANIES')
          ],
        ),
      ),
    );
  }

  ////////////////
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
