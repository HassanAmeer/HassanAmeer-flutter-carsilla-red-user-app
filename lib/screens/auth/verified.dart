import 'package:carsilla/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/theme.dart';
import '../../services/userstorage.dart';
import '../../vm/profilevm.dart';
import '../../widgets/btn.dart';
import '../profile/profile.dart';

class VerifiedPage extends StatefulWidget {
  final String? phoneNumber;
  const VerifiedPage({super.key, this.phoneNumber = ''});

  @override
  State<VerifiedPage> createState() => _VerifiedPageState();
}

class _VerifiedPageState extends State<VerifiedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        leading: const Text(''),
      ),
      extendBodyBehindAppBar: true,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85 / 1,
          decoration: BoxDecoration(
              color: Colors.grey.shade200.withOpacity(0.9),
              // border: Border.all(
              //     width: 1, color: Colors.grey.shade400.withOpacity(0.7)),
              borderRadius: BorderRadius.circular(20)),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03 / 1,
            ),
            CircleAvatar(
                radius: 75,
                backgroundColor: Colors.grey.shade50,
                child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Image.asset(IconAssets.chek),
                )),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.065 / 1,
            ),
            Text(
              'Verified!!',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01 / 1,
            ),
            Text(
              """
Hurrah!! You have successfully 
Verified the account""",
              textAlign: TextAlign.center,
              style: textTheme.labelLarge,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05 / 1,
            ),
            MainButton(
              onclick: () {
                StorageClass.set(1, widget.phoneNumber);
                Provider.of<ProfileVmC>(context, listen: false)
                    .checkProfileVmF(context, widget.phoneNumber);
                // Navigator.pushNamed(context, "/HomePage");
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
              label: "Browse Home",
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02 / 1,
            ),
          ]),
        ),
      ),
    );
  }
}
