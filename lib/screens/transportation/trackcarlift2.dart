import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';
import '../../widgets/btn.dart';
import 'mytransaction.dart';

class TrackCarLift2Page extends StatelessWidget {
  const TrackCarLift2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Header(
      title: 'Track Car Lift',
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            ListTile(
              title: Text('Congratulations',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.grey.shade900)),
              subtitle: Text('Your car has reached it’s destination',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.grey.shade800)),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.005 / 1),
            SizedBox(
                width: MediaQuery.of(context).size.width * 0.9 / 1,
                child: Image.asset(ImageAssets.map5)),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03 / 1),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9 / 1,
              child: MainButton(
                  onclick: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyTransactionPage(),
                      ),
                    );
                  },
                  label: 'Pay Now'),
            ),
          ],
        ),
      ),
    );
  }
}
