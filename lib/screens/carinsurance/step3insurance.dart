import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'invoiceinsurance.dart';
import 'step2insurance.dart';

class Step3InsurancePage extends StatefulWidget {
  final String? type;
  final String? model;
  final String? year;
  final String? charges;
  final String? fname;
  final String? lname;
  final String? homeAddress;
  final String? dateofBirth;
  final String? carName;
  final String? plateno;
  final String? buydate;
  const Step3InsurancePage(
      {super.key,
      this.type = '',
      this.model = '',
      this.year = '',
      this.charges = '',
      this.fname = '',
      this.lname = '',
      this.homeAddress = '',
      this.dateofBirth = '',
      this.carName = '',
      this.plateno = '',
      this.buydate = ''});

  @override
  State<Step3InsurancePage> createState() => _Step3InsurancePageState();
}

class _Step3InsurancePageState extends State<Step3InsurancePage> {
  TextEditingController dateContr = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back))),
                SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8 / 1,
                    child: Image.asset(ImageAssets.img_banner5_01_1)),
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
              child: Image.asset(ImageAssets.dotsteper3),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01 / 1),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                          'Car Name - - - - - - - - - - - - - - - - - ${widget.carName}',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey.shade500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                          'Model - - - - - - - - - - - - - - - - - ${widget.model}',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey.shade500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                          'Number Plate - - - - - - - - - - - - - - - - - - - ${widget.plateno}',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey.shade500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                          'Purchase Date - - - - - - - - - - - - - - - - - ${widget.buydate}',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey.shade500)),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                          'Comprehensive Plan - - - - - - - - - - - - - - Monthly',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(color: Colors.grey.shade500)),
                    ),
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01 / 1),
                  ],
                ),
              ),
            ),
            CupertinoListTile(
              title: Text('Total',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.grey.shade600)),
              trailing: Text('AED ${widget.charges}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.grey.shade600)),
            ),
            // SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.download_rounded),
                label: const Text('Download Quote')),
            MainButton(
                width: 0.85,
                radius: 8,
                onclick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InvoiceInsurancePage(
                        type: widget.type,
                        model: widget.model,
                        year: widget.year,
                        charges: widget.charges,
                        fname: widget.fname,
                        lname: widget.lname,
                        homeAddress: widget.homeAddress,
                        dateofBirth: widget.dateofBirth,
                        carName: widget.carName,
                        plateno: widget.plateno,
                        buydate: widget.buydate,
                      ),
                    ),
                  );
                },
                label: 'Proceed to Pay')
          ],
        ),
      ),
    );
  }
}
