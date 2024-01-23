import 'package:carsilla/res/assets.dart';
import 'package:carsilla/widgets/headerwithimg.dart';
import 'package:flutter/material.dart';
import '../../res/theme.dart';
import '../../widgets/bottomnavbar.dart';
import 'pickuppage.dart';

class VehicleTransportaionPage extends StatelessWidget {
  const VehicleTransportaionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderWithImage(
      title: 'Vehicle Transportation',
      marginToTopHeadeImg: 0.02,
      marginbodyfrombottom: 0.08,
      headeimg: ImageAssets.roadassistance1,
      navbar: const NavBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 6,
            ),

            Row(
              children: [
                Text(
                  "Choose Type of Assistance",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: MainTheme.primaryColor),
                ),
              ],
            ),
            const SizedBox(height: 06),

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width * 43.9 / 100,
                    height: MediaQuery.of(context).size.height * 13 / 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 148, 3, 3),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          overlayColor: MaterialStateProperty.all(
                              Colors.blueGrey.shade900),
                          splashFactory: InkRipple.splashFactory),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => HomeAssisPage(),
                        //   ),
                        // );
                        // underWorkAlert(context);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PickupPage(),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/home 1.png'),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Home Assistance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )),
                const Spacer(),
                Container(
                    width: MediaQuery.of(context).size.width * 43.9 / 100,
                    height: MediaQuery.of(context).size.height * 13 / 100,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 148, 3, 3),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(0)),
                          overlayColor: MaterialStateProperty.all(
                              Colors.blueGrey.shade900),
                          splashFactory: InkRipple.splashFactory),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => RoadAssisPage(),
                        //   ),
                        // );
                        // underWorkAlert(context);
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => const RoadAssisPage(),
                        //   ),
                        // );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/icons/Shape.png'),
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0),
                            child: Text(
                              'Road Assistance',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                children: [
                  Text(
                    "Your current Location",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: MainTheme.primaryColor,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 3,
            ),

            Container(
              height: 160,
              width: MediaQuery.of(context).size.width * 0.92 / 1,
              // height: 150,
              child: Image.asset(
                'assets/images/map.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 243, 240, 240),
              ),
              title: Text(
                'Toyota Yaris',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('432W 43 TH Street New York NY 2121-9877'),
            ),

            ///////////////// end slider
          ],
        ),
      ),
    );
  }
}
