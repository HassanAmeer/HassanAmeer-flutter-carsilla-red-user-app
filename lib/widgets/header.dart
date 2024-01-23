import 'package:carsilla/res/assets.dart';
import 'package:carsilla/res/theme.dart';
import 'package:carsilla/screens/profile/profile.dart';
import 'package:carsilla/vm/profilevm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:provider/provider.dart';
import '../resources/urls.dart';
import 'bottomnavbar.dart';
import 'drawer.dart';

class Header extends StatelessWidget {
  final String? title;
  final String? profile;
  final String? headeimg;
  final Widget? body;
  final bool? showAppBar;
  final double? marginbodyfrombottom;
  final double? bodyheight;
  final bool? isScrollable;
  final Widget? navbar;
  const Header({
    super.key,
    this.title = '',
    this.profile = ImageAssets.profile,
    this.headeimg = ImageAssets.notfound,
    this.body = const Text('add List'),
    this.showAppBar = true,
    this.marginbodyfrombottom = 0.05,
    this.bodyheight = 0.6,
    this.isScrollable = true,
    this.navbar,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerWidget(
      body: Scaffold(
        backgroundColor: Colors.white,
        appBar: showAppBar! == true
            ? AppBar(
                backgroundColor: MainTheme.primaryColor,
                leading: Builder(
                  builder: (context) {
                    return IconButton(
                      icon: const Icon(Icons.menu, color: Colors.white),
                      onPressed: () {
                        ZoomDrawer.of(context)!.toggle();
                      },
                    );
                  },
                ),
                title: Text(title!,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white)),
                centerTitle: true,
                actions: [
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
                            border: Border.all(
                                width: 1,
                                color: Colors.red.shade100.withOpacity(0.4)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.redAccent.withOpacity(0.5),
                                  offset: const Offset(1, 1),
                                  blurRadius: 10)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: CircleAvatar(
                                backgroundColor: Colors.grey.shade100,
                                radius: 22,
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
                  // CircleAvatar(
                  //   child: Image.asset(
                  //     profile!,
                  //   ),
                  // ),
                  const SizedBox(width: 15)
                ],
              )
            : AppBar(
                backgroundColor: Colors.transparent, leading: const Text('')),
        extendBodyBehindAppBar: showAppBar == true ? false : true,
        bottomNavigationBar: navbar ?? const NavBarWidget(),
        // const SizedBox(
        //   height: 0,
        // ),
        body: SingleChildScrollView(
          controller: ScrollController(),
          physics: isScrollable == true
              ? const ScrollPhysics()
              : const NeverScrollableScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.06 / 1,
                decoration: const BoxDecoration(color: MainTheme.primaryColor),
              ),
              Transform.translate(
                offset: Offset(
                    0,
                    -MediaQuery.of(context).size.height *
                        marginbodyfrombottom! /
                        1),
                child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: ConstrainedBox(
                        constraints: BoxConstraints(
                            minHeight: MediaQuery.of(context).size.height *
                                bodyheight! /
                                1),
                        child: body)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
