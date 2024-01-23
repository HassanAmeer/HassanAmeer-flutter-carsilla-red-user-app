import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';

import '../../res/theme.dart';
import 'homeassis2page.dart';

class HomeAssisPageInTransportation extends StatelessWidget {
  const HomeAssisPageInTransportation({super.key});

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Home Assistance',
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Row(
              children: [
                Text(
                  "Car Lift",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MainTheme.primaryColor),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "We are searching nearby carriers",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.grey.shade900),
                ),
              ],
            ),
            const SizedBox(
              height: 18,
            ),
            Image.asset(ImageAssets.map3_1),
            const SizedBox(
              height: 18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "URGENT LEVEL",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.grey.shade900),
                ),
                Text(
                  "Distance",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: Colors.grey.shade500),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "HIGH",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MainTheme.primaryColor),
                ),
                Text(
                  "2.32 KM",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: Colors.grey.shade900),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9 / 1,
              child: MainButton(
                onclick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeAssis2Page(),
                    ),
                  );
                },
                label: 'Next',
              ),
            )
          ],
        ),
      ),
    );
  }
}
