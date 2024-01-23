import 'package:carsilla/res/assets.dart';
import 'package:carsilla/resources/urls.dart';
import 'package:carsilla/screens/auth/loginbyphone.dart';
import 'package:carsilla/screens/carinsurance/carinsurance.dart';
import 'package:carsilla/screens/roadsideassis/roadsideassis.dart';
import 'package:carsilla/screens/spareparts/sparepartssearch.dart';
import 'package:carsilla/screens/transportation/vehicletransportaionpage.dart';
import 'package:carsilla/screens/workshopservices/workshopservices.dart';
import 'package:carsilla/vm/profilevm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';

import '../res/theme.dart';
import '../screens/profile/profile.dart';

class DrawerWidget extends StatefulWidget {
  final Widget? body;

  const DrawerWidget({super.key, this.body});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainTheme.primaryColor.shade900,
      body: ZoomDrawer(
        controller: ZoomDrawerController(),
        menuScreen: const MenuDrawer(),
        mainScreen: widget.body!,
        borderRadius: 24.0,
        showShadow: true,
        angle: 0.0,
        drawerShadowsBackgroundColor: MainTheme.primaryColor.shade200,
        slideWidth: MediaQuery.of(context).size.width * 0.75,
      ),
    );
  }
}

///////////////////

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  String tabedmenu = '';
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MainTheme.primaryColor.shade900,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.08 / 1,
          ),
          Consumer<ProfileVmC>(builder: (context, profileVmVal, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer<ProfileVmC>(builder: (context, profileVmVal, chil) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ProfilePage(),
                        ),
                      );
                    },
                    child: Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(width: 2, color: Colors.red.shade100),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.redAccent.withOpacity(0.5),
                                offset: const Offset(1, 1),
                                blurRadius: 10)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: CircleAvatar(
                              backgroundColor: Colors.grey.shade100,
                              radius: 32,
                              child: Image.network(
                                  ApiUrls.imageUrl +
                                      profileVmVal.prfiledata[0]['image'],
                                  fit: BoxFit.cover,
                                  height: double.infinity,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                return Image.asset(ImageAssets.profile2);
                              })),
                        ),
                      ),
                    ),
                  );
                }),
                Text(
                  profileVmVal.prfiledata[0]['fname'].toString(),
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
              ],
            );
          }),
          // const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.7 / 1,
            child: ListView(
              controller: ScrollController(),
              physics: const BouncingScrollPhysics(),
              children: [
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const WorkShopServicesPage(),
                      ),
                    );
                  },
                  leading: ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      child: Transform.scale(
                          scale: 2,
                          child: Image.asset(IconAssets.menu1,
                              width: 25, height: 25))),
                  // leading: Icon(Icons.car_crash, color: Colors.grey.shade200),
                  title: Text(
                    'Workshop',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.grey.shade200),
                  ),
                ),
                Divider(
                  thickness: 0.3,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RoadSideAssisPage(),
                      ),
                    );
                  },
                  leading: ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                    child: Transform.scale(
                      scale: 2,
                      child: Image.asset(
                        IconAssets.menu2,
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ),
                  title: Text(
                    'Roadside A..',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.grey.shade200),
                  ),
                ),
                Divider(
                  thickness: 0.3,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CarInsurancePage(),
                      ),
                    );
                  },
                  leading: ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      child: Transform.scale(
                          scale: 2,
                          child: Image.asset(IconAssets.menu3,
                              width: 25, height: 25))),
                  title: Text(
                    'Car Insurance',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.grey.shade200),
                  ),
                ),
                Divider(
                  thickness: 0.3,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SparePartSearchPage(),
                      ),
                    );
                  },
                  leading: ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      child: Transform.scale(
                          scale: 2,
                          child: Image.asset(IconAssets.menu4,
                              width: 25, height: 25))),
                  title: Text(
                    'Spare Parts',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.grey.shade200),
                  ),
                ),
                Divider(
                  thickness: 0.3,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VehicleTransportaionPage(),
                      ),
                    );
                  },
                  leading: ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      child: Transform.scale(
                          scale: 1.7,
                          child: Image.asset(IconAssets.menu5,
                              width: 25, height: 25))),
                  title: Text(
                    'Vehicle Trans',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.grey.shade200),
                  ),
                ),
                Divider(
                  thickness: 0.3,
                  color: Colors.grey.shade300,
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const VehicleTransportaionPage(),
                      ),
                    );
                  },
                  leading: ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      child: Transform.scale(
                          scale: 1.7,
                          child: Image.asset(IconAssets.menu6,
                              width: 25, height: 25))),
                  title: Text(
                    'Car Listing',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.grey.shade200),
                  ),
                ),
                Divider(
                  thickness: 0.3,
                  color: Colors.grey.shade300,
                ),
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.04 / 1,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9 / 1,
              child: Column(
                children: [
                  const SizedBox(height: 1, child: Divider()),
                  TextButton.icon(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginByPhone(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.exit_to_app_outlined,
                        color: Colors.white,
                      ),
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Logout',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Colors.white),
                        ),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
