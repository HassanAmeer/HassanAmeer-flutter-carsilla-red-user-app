import 'package:carsilla/chat.dart';
import 'package:carsilla/res/assets.dart';
import 'package:carsilla/res/theme.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';

import 'trackcarlift.dart';

class HomeAssis2Page extends StatelessWidget {
  const HomeAssis2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Home Assistance',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5, right: 8.0),
                            child: Text('\$24,00',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(
                                        color: Colors.grey.shade900,
                                        fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 26,
                          child: Image.asset(ImageAssets.profile2),
                        ),
                        title: Text('William Edward',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Colors.grey.shade900,
                                    fontWeight: FontWeight.w300)),
                        subtitle: Text('Basic level',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.grey.shade500)),
                        trailing: Text('2,4 km',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(color: Colors.grey.shade500)),
                      ),
                      Divider(
                        thickness: 0.7,
                        color: Colors.grey.shade400.withOpacity(0.7),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text('Change Carrier',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(color: MainTheme.primaryColor)))
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03 / 1),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(left: 20, top: 0, bottom: 0),
              leading: Image.asset(IconAssets.circlered),
              title: Text(
                'Pickup point',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey.shade500),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Cibadak, Sukabumi',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            SizedBox(
              height: 1,
              child: Divider(
                color: Colors.grey.shade400,
                thickness: 0.4,
                indent: 40,
                endIndent: 15,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            ListTile(
              contentPadding:
                  const EdgeInsets.only(left: 15, top: 0, bottom: 0),
              leading: Image.asset(IconAssets.markred),
              title: Text(
                'Drop off Point',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: Colors.grey.shade500),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  'Cisaat selatan, Sukabumi',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.grey.shade900, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04 / 1),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85 / 1,
              child: MainButton(
                onclick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrackCarLiftPage(),
                    ),
                  );
                },
                label: 'Track Car',
                btnColor: Colors.grey.shade900,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01 / 1),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.85 / 1,
              child: MainButton(
                onclick: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChatPage(),
                    ),
                  );
                },
                label: 'Message Now',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
