import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../res/theme.dart';
import 'invoicepage.dart';

class OrderDetailsPage extends StatefulWidget {
  final String? wherefrompickup;
  final String? whentopickup;
  final String? timeonpickup;
  const OrderDetailsPage(
      {super.key, this.wherefrompickup, this.whentopickup, this.timeonpickup});

  @override
  State<OrderDetailsPage> createState() => _OrderDetailsPageState();
}

class _OrderDetailsPageState extends State<OrderDetailsPage> {
  TextEditingController carnameController = TextEditingController();
  List repairItemsList = [
    {
      "title": "Seat Repair",
      "price": "100",
    },
    {
      "title": "Brake Repair",
      "price": "150",
    },
    {
      "title": "Lights Repair",
      "price": "150",
    },
  ];

  int selected = 0;
  double total = 100;
  String servicename = 'Seat Repair';
  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Order Details',
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
          ListTile(
            title: Text('Congratulations, \nYour Order has been accepted.',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey.shade900)),
          ),
          ListTile(
            title: Text('Check invoice sent by the XYZ Repairs',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey.shade900)),
          ),
          ListTile(
            title: Text('Your Invoice Details',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.black, fontSize: 18)),
          ),
          ListTile(
            contentPadding: const EdgeInsets.only(left: 30, right: 15),
            title: Text(
              'car',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .copyWith(color: Colors.grey.shade600),
            ),
            trailing: Container(
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              width: MediaQuery.of(context).size.width * 0.35 / 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  controller: carnameController,
                  decoration: const InputDecoration(
                      hintText: 'Car Name', border: InputBorder.none),
                ),
              ),
            ),
            // trailing: Text(
            //   'Toyoto Yaris',
            //   textAlign: TextAlign.right,
            //   style: Theme.of(context)
            //       .textTheme
            //       .labelSmall!
            //       .copyWith(color: Colors.black),
            // ),
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
          //////////////////
          ListView.builder(
            shrinkWrap: true,
            controller: ScrollController(),
            itemCount: repairItemsList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selected = index;
                    total = double.parse(repairItemsList[index]['price']);
                    servicename = repairItemsList[index]['title'].toString();
                  });
                },
                child: CupertinoListTile(
                  onTap: () {
                    setState(() {
                      selected = index;
                      total = double.parse(repairItemsList[index]['price']);
                      servicename = repairItemsList[index]['title'].toString();
                    });
                  },
                  title: Row(
                    children: [
                      selected == index
                          ? SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.035 / 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 2.0),
                                child: Image.asset(IconAssets.checkbox),
                              ))
                          : SizedBox(
                              width:
                                  MediaQuery.of(context).size.width * 0.04 / 1,
                              child: Image.asset(IconAssets.checkboxborder)),
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(repairItemsList[index]['title'],
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.grey.shade600)),
                      )
                    ],
                  ),
                  trailing: Text("\$${repairItemsList[index]['price']}",
                      style: Theme.of(context)
                          .textTheme
                          .labelMedium!
                          .copyWith(color: Colors.black)),
                ),
              );
            },
          ),
          // CupertinoListTile(
          //   title: Row(
          //     children: [
          //       SizedBox(
          //           width: MediaQuery.of(context).size.width * 0.04 / 1,
          //           child: Image.asset(IconAssets.checkboxborder)),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 5.0),
          //         child: Text('New Parts',
          //             style: Theme.of(context)
          //                 .textTheme
          //                 .labelMedium!
          //                 .copyWith(color: Colors.grey.shade600)),
          //       )
          //     ],
          //   ),
          //   trailing: Text('\$150',
          //       style: Theme.of(context)
          //           .textTheme
          //           .labelMedium!
          //           .copyWith(color: Colors.black)),
          // ),
          // CupertinoListTile(
          //   title: Row(
          //     children: [
          //       SizedBox(
          //           width: MediaQuery.of(context).size.width * 0.04 / 1,
          //           child: Image.asset(IconAssets.checkboxborder)),
          //       Padding(
          //         padding: const EdgeInsets.only(left: 5.0),
          //         child: Text('New Parts',
          //             style: Theme.of(context)
          //                 .textTheme
          //                 .labelMedium!
          //                 .copyWith(color: Colors.grey.shade600)),
          //       )
          //     ],
          //   ),
          //   trailing: Text('\$150',
          //       style: Theme.of(context)
          //           .textTheme
          //           .labelMedium!
          //           .copyWith(color: Colors.black)),
          // ),
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
            title: Text('Total Amount',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.grey.shade600)),
            trailing: Text('\$$total',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .copyWith(color: Colors.black)),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03 / 1),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.44 / 1,
                  child: MainButton(
                    onclick: () {
                      if (carnameController.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: const Text('Enter Car Name'),
                            duration: const Duration(seconds: 2),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {},
                            ),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InvoicePage(
                              wherefrompickup: widget.wherefrompickup,
                              whentopickup: widget.whentopickup,
                              timeonpickup: widget.timeonpickup,
                              carname: carnameController.text,
                              serviceis: servicename,
                              total: total,
                              address: widget.wherefrompickup,
                            ),
                          ),
                        );
                      }
                    },
                    btnColor: Colors.green.shade600,
                    label: 'ACCEPT',
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.43 / 1,
                  child: MainButton(
                    onclick: () {
                      Navigator.pop(context);
                    },
                    label: 'REJECT',
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01 / 1,
          ),
          ListTile(
            title: const Text(
              'Notes',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: ReadMoreText(
              "Vestibulum feugiat, orci volutpat pharetra commodo, scelerisque lectus and sapconvallis accumsan ligula.",
              trimLines: 2,
              colorClickableText: MainTheme.primaryColor,
              trimMode: TrimMode.Line,
              trimCollapsedText: "See More",
              moreStyle: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 12),
              lessStyle: Theme.of(context)
                  .textTheme
                  .labelSmall!
                  .copyWith(fontSize: 11),
            ),
          )
        ],
      ),
    );
  }
}
