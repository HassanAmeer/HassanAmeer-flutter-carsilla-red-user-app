import 'package:carsilla/res/assets.dart';
import 'package:carsilla/screens/transportation/trackcarlift2.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../res/theme.dart';

class TrackCarLiftPage extends StatelessWidget {
  const TrackCarLiftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Track Car Lift',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            ListTile(
              title: Text('Track Your Car Lift',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey.shade900)),
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.93 / 1,
                child: Image.asset(ImageAssets.map4)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            Container(
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 10,
                    offset: Offset(0, 4))
              ]),
              child: ListTile(
                leading: Image.asset(ImageAssets.profile2),
                title: Text('William Edward'),
                subtitle: Text('Basic level',
                    style: textTheme.labelMedium!.copyWith(
                      color: Colors.grey.shade500,
                      fontWeight: FontWeight.w400,
                    )),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                        width: 30, child: Image.asset(IconAssets.phoneoutline)),
                    const SizedBox(width: 5),
                    SizedBox(
                        width: 30, child: Image.asset(IconAssets.msgoutline)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Estimated Time',
                      style: textTheme.labelMedium!.copyWith(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.w400,
                      )),
                  Text('14m30s',
                      style: textTheme.labelMedium!.copyWith(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w500,
                      )),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9 / 1,
              child: MainButton(
                onclick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrackCarLift2Page(),
                    ),
                  );
                },
                label: 'Next',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
