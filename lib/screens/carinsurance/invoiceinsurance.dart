import 'package:carsilla/services/userstorage.dart';
import 'package:carsilla/vm/insuranceVM.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../res/assets.dart';
import '../../res/theme.dart';
import 'finalplan.dart';

class InvoiceInsurancePage extends StatefulWidget {
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
  const InvoiceInsurancePage(
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
  State<InvoiceInsurancePage> createState() => _InvoiceInsurancePageState();
}

class _InvoiceInsurancePageState extends State<InvoiceInsurancePage> {
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'Invoice',
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: IconButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0.08),
                      shadowColor: MaterialStateProperty.all(
                          Colors.grey.shade50.withOpacity(0.2)),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.grey.shade800)),
                title: Center(
                  child: Text('Invoice             ',
                      style: textTheme.titleLarge!.copyWith(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),

              ListTile(
                title: Text('Your Invoice Details',
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.grey.shade900)),
              ),
              // SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(2),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 7,
                          offset: const Offset(6, 6)),
                      BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 7,
                          offset: const Offset(-6, -6)),
                    ],
                  ),
                  child: Column(
                    children: [
                      CupertinoListTile(
                        title: Text('Name',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey)),
                        trailing: Text(widget.fname.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey.shade900)),
                      ),
                      SizedBox(
                          height: 1,
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 0.5,
                          )),
                      CupertinoListTile(
                        title: Text('Home',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey)),
                        trailing: Text(widget.homeAddress.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey.shade900)),
                      ),
                      SizedBox(
                          height: 1,
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 0.5,
                          )),
                      CupertinoListTile(
                        title: Text('Start Date',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey)),
                        trailing: Text(DateTime.now().toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey.shade900)),
                      ),
                      SizedBox(
                          height: 1,
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 0.5,
                          )),
                      CupertinoListTile(
                        title: Text('End Date',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey)),
                        trailing: Text(
                            (DateTime.now().add(Duration(days: 30))).toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey.shade900)),
                      ),
                      SizedBox(
                          height: 1,
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 0.5,
                          )),
                      CupertinoListTile(
                        title: Text('Insurance Amount',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey)),
                        trailing: Text('AED ${widget.charges}',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey.shade900)),
                      ),
                      SizedBox(
                          height:
                              MediaQuery.of(context).size.height * 0.002 / 1),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9 / 1,
                        child: MainButton(
                          onclick: () async {
                            final userid = await StorageClass.getuseridf();

                            final data = {
                              "user_id": userid,
                              "type": widget.type,
                              "model": widget.model,
                              "year": widget.year,
                              "insu_fees": widget.charges,
                              "first_name": widget.fname,
                              "last_name": widget.lname,
                              "address": widget.homeAddress,
                              "date_of_birth": widget.dateofBirth,
                              "car_name": widget.carName,
                              "number_plate": widget.plateno,
                              "date_of_purchase": widget.buydate,
                            };
                            await InsuranceVmC().addInsuranceVmF(data, context);
                            ///////// do this with image when done from admin panel and according to the condition

                            ///// if condition true then move to the page
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const FinalPlanePage(),
                              ),
                            );
                          },
                          label: 'Pay Now',
                        ),
                      ),
                    ],
                  ),
                ),
              ),

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
