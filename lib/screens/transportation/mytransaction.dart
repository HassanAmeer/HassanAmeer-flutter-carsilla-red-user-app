import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../res/assets.dart';
import 'orderdetails.dart';

class MyTransactionPage extends StatefulWidget {
  const MyTransactionPage({super.key});

  @override
  State<MyTransactionPage> createState() => _MyTransactionPageState();
}

class _MyTransactionPageState extends State<MyTransactionPage> {
  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Header(
        title: 'My Transactions',
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),

              Padding(
                padding: const EdgeInsets.only(left: 17.0),
                child: Row(
                  children: [
                    Text('Your Request For Pickup',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .copyWith(color: Colors.grey.shade800)),
                  ],
                ),
              ),
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
                        title: Text('Car',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey)),
                        trailing: Text('Toyota Yaris',
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
                        title: Text('Car Lift',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey)),
                        trailing: Text('\$250',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: Colors.grey.shade900)),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.1 / 1),
                      SizedBox(
                          height: 1,
                          child: Divider(
                            color: Colors.grey.shade400,
                            thickness: 0.5,
                          )),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 17),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Amount',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.grey)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.all(1.0),
                                  child: Badge(),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Badge(
                                    backgroundColor: Colors.grey.shade300,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(1.0),
                                  child: Badge(
                                    backgroundColor: Colors.grey.shade300,
                                  ),
                                ),
                              ],
                            ),
                            Text('\$250.00',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.grey.shade900)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9 / 1,
                child: MainButton(
                  onclick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const OrderDetailsPage(),
                      ),
                    );
                  },
                  label: 'Pay Now',
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
