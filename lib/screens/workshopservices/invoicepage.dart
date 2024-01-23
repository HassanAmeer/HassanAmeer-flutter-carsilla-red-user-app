import 'package:carsilla/res/theme.dart';
import 'package:carsilla/services/userstorage.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/assets.dart';
import '../../vm/profilevm.dart';
import '../../vm/workshopvm.dart';
import 'orderreceived.dart';

class InvoicePage extends StatefulWidget {
  final String? wherefrompickup;
  final String? whentopickup;
  final String? timeonpickup;
  final String? carname;
  final String? serviceis;
  final String? address;
  final dynamic total;
  const InvoicePage(
      {super.key,
      this.carname = '',
      this.serviceis,
      this.total,
      this.address = '',
      this.wherefrompickup,
      this.whentopickup,
      this.timeonpickup});

  @override
  State<InvoicePage> createState() => _InvoicePageState();
}

class _InvoicePageState extends State<InvoicePage> {
  // TextEditingController passwordcontroller = TextEditingController();
  String userName = 'Morose';
  @override
  void initState() {
    ProfileVmC vmvalueval = Provider.of<ProfileVmC>(context, listen: false);
    if (vmvalueval.prfiledata.isNotEmpty)
      userName = vmvalueval.prfiledata![0]['fname'].toString() ?? 'Morose';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Invoice',
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 1),
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.grey.shade800)),
                title: Center(
                  child: Text('Invoice                  ',
                      style: textTheme.titleLarge!.copyWith(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
              ListTile(
                title: Text('Your Invoice Details',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey.shade900)),
              ),

              //////////////////
              CupertinoListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('Name',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.grey.shade600)),
                ),
                trailing: Text(userName.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.black)),
              ),
              SizedBox(
                height: 1,
                child: Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.5,
                  endIndent: 20,
                  indent: 25,
                ),
              ),
              CupertinoListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text('Home',
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.grey.shade600)),
                ),
                trailing: Text(widget.address!,
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.black)),
              ),
              SizedBox(
                height: 1,
                child: Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.5,
                  endIndent: 20,
                  indent: 25,
                ),
              ),
              CupertinoListTile(
                title: Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: Text(widget.serviceis.toString(),
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.grey.shade600)),
                ),
                trailing: Text('\$${widget.total}',
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: Colors.black)),
              ),
              SizedBox(
                height: 1,
                child: Divider(
                  color: Colors.grey.shade400,
                  thickness: 0.5,
                  endIndent: 20,
                  indent: 25,
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),

              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9 / 1,
                  child: MainButton(
                      onclick: () async {
                        final userid = await StorageClass.getuseridf();
                        final data = {
                          "user_id": userid,
                          // "user_name": '',
                          "when_pickup_date": widget.whentopickup,
                          "where_pickup_address": widget.wherefrompickup,
                          "time": widget.timeonpickup,
                          "car_name": widget.carname,
                          "repair_or_addnewparts": widget.serviceis,
                          "wich_repaired": widget.serviceis,
                          "is_pay": 'no',
                          "pay_by": 'by hand',
                          "total_pay": widget.total,
                        };
                        await context
                            .read<WorkShopVmC>()
                            .addWorkShopDataVmF(data, context);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const OrderReceivedPage()));
                      },
                      label: 'Pay Now')),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 15.0),
                    child: Text(
                      'Payment Methods',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              const PaymentMethodsRow(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              const VisaCard(),
            ],
          ),
        ));
  }
}

///////////////////////////////

class PaymentMethodsRow extends StatefulWidget {
  const PaymentMethodsRow({super.key});

  @override
  _PaymentMethodsRowState createState() => _PaymentMethodsRowState();
}

class _PaymentMethodsRowState extends State<PaymentMethodsRow> {
  late String selectedPaymentMethod = 'Credit Card';

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Opacity(
          opacity: selectedPaymentMethod == 'Credit Card' ? 1 : 0.4,
          child: Radio(
            value: 'Credit Card',
            groupValue: selectedPaymentMethod,
            focusColor: Colors.grey,
            overlayColor: MaterialStateProperty.all(Colors.grey),
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),
        ),
        const Text('Credit Card'),
        Opacity(
          opacity: selectedPaymentMethod == 'PayPal' ? 1 : 0.4,
          child: Radio(
            value: 'PayPal',
            groupValue: selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),
        ),
        const Text('PayPal'),
        Opacity(
          opacity: selectedPaymentMethod == 'Cash' ? 1 : 0.4,
          child: Radio(
            value: 'Cash',
            groupValue: selectedPaymentMethod,
            onChanged: (value) {
              setState(() {
                selectedPaymentMethod = value!;
              });
            },
          ),
        ),
        const Text('Cash'),
      ],
    );
  }
}

//////////////////

class VisaCard extends StatelessWidget {
  const VisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          // Background Image
          Image.asset(
            ImageAssets.visacard,
            width: MediaQuery.of(context).size.width * 0.9 / 1,
            height: MediaQuery.of(context).size.height * 0.2 / 1,
            fit: BoxFit.fill,
          ),

          // Card Information
          Positioned(
            top: 18.0,
            left: 20.0,
            right: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'Visa',
                //   style: TextStyle(
                //     color: Colors.white,
                //     fontSize: 28.0,
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // SizedBox(height: 20.0),
                const Text(
                  'CREDIT CARD NUMBER',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                  ),
                ),
                const Text(
                  '3423 5656 7678 5634',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 21.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'OWNER NAME',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                          ),
                        ),
                        Text(
                          'Mike Dunn'.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'VALID TILL',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13.0,
                          ),
                        ),
                        Text(
                          '03 / 2022',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CVV CODE',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          '345',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
