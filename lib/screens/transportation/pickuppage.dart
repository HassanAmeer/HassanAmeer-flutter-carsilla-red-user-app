import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:carsilla/widgets/headerwithimg.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../res/theme.dart';
import '../../widgets/btn.dart';
import '../../widgets/textfeild.dart';
import 'homeassispage.dart';

class PickupPage extends StatefulWidget {
  const PickupPage({super.key});

  @override
  State<PickupPage> createState() => _PickupPageState();
}

class _PickupPageState extends State<PickupPage> {
  TextEditingController pickupcontroller = TextEditingController();

  TextEditingController timecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    pickupcontroller.text = 'Thu, 17 Feb';
    timecontroller.text = '10:00 AM';
    return Header(
      title: 'Pick Up Vehicle',
      body: Padding(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(ImageAssets.pickupcars),
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
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4 / 1,
                  child: CustomTextFormField(
                    // controller: whenToPickUpController,
                    hintText: "Pickup",
                    controller: pickupcontroller,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.45 / 1,
                  child: CustomTextFormField(
                    // controller: whenToPickUpController,
                    hintText: "Time",
                    controller: timecontroller,
                  ),
                ),
              ],
            ),
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
            const CustomTextFormField(
              // controller: whenToPickUpController,
              hintText: "Your Address",
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
            CustomTextFormField(
              // controller: whenToPickUpController,
              hintText: "Choose Your Category",
              suffix: Transform.rotate(
                  angle: 4.65,
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.grey.shade400.withOpacity(0.7),
                  )),
            ),
            const SizedBox(
              height: 18,
            ),
            MainButton(
              onclick: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeAssisPageInTransportation(),
                  ),
                );
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
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    controller: ScrollController(),
                    itemCount: 2,
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
                                  "Change The Handbreak & Break oil...",
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
                                    "Locate the handbrake cable under \nyour vehicle,which connects to the rear brakes.",
                                    trimLines: 2,
                                    colorClickableText: MainTheme.primaryColor,
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
                                width:
                                    MediaQuery.of(context).size.width * 0.8 / 1,
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
                                              text: "04/11/2023",
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
                                            "Paid",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(
                                                    color:
                                                        MainTheme.primaryColor),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 4.0),
                                            child: Text(
                                              "\$550",
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
                    })),
            ///////////////// end slider
          ],
        ),
      ),
    );
  }
}
