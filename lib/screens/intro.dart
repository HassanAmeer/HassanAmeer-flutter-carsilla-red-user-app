import 'package:carsilla/res/assets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../res/theme.dart';
import '../services/userstorage.dart';
import '../vm/profilevm.dart';
import '../widgets/btn.dart';
import '../widgets/headerwithimg.dart';
import 'profile/profile.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderWithImage(
      showAppBar: false,
      headeimg: ImageAssets.introimg,
      marginbodyfrombottom: 0.07,
      marginToTopHeadeImg: 0.05,
      isScrollable: false,
      body: Padding(
        padding: const EdgeInsets.all(06.0),
        child: Transform.translate(
          offset: Offset(
            0,
            -MediaQuery.of(context).size.height * 0.04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5 / 1,
                  child: Image.asset(IconAssets.logo1)),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02 / 1,
              ),
              Text(
                "Are you looking for \nsomeone to fix your vehicle",
                textAlign: TextAlign.center,
                style: textTheme.titleLarge!
                    .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02 / 1,
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.86 / 1,
                  child: Text(
                    """Carsilla offers complete auto care for your vehicle. Whether it’s time for your next factory recommended maintenance visit, a routine oil change, new tires, or repair services""",
                    textAlign: TextAlign.center,
                    style: textTheme.labelMedium!.copyWith(
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04 / 1,
              ),
              MainButton(
                width: 0.85,
                onclick: () {
                  Navigator.pushNamed(context, "/LoginByPhone");
                },
                label: 'Register as a Customer',
              ),
              const SizedBox(
                height: 10,
              ),
              // MainButton(
              //   width: 0.85,
              //   onclick: () {},
              //   btnColor: const Color.fromARGB(255, 16, 23, 94),
              //   label: 'Register as a Service Provider',
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07 / 1,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                GestureDetector(
                  onTap: () async {
                    await StorageClass.set(1, '0301234567');

                    Provider.of<ProfileVmC>(context, listen: false)
                        .checkProfileVmF(context, '0301234567');
                    // Navigator.pushNamed(context, "/HomePage");
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const ProfilePage(),
                    //   ),
                    // );
                    Navigator.pushNamed(context, "/HomePage");
                  },
                  child: Text(
                    'Skip',
                    style: textTheme.titleMedium!.copyWith(
                        color: MainTheme.primaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.07 / 1),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
