import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';

class FinalPlanePage extends StatefulWidget {
  const FinalPlanePage({super.key});

  @override
  State<FinalPlanePage> createState() => _FinalPlanePageState();
}

class _FinalPlanePageState extends State<FinalPlanePage> {
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
              children: [
                Padding(
                    padding: const EdgeInsets.only(right: 3.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back))),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04 / 1),
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.03 / 1),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset(ImageAssets.dotsteper3),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05 / 1),
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: Image.asset(IconAssets.success),
            ),
          ],
        ),
      ),
    );
  }
}
