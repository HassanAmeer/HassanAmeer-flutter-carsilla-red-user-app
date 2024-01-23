import 'package:carsilla/res/assets.dart';
import 'package:carsilla/screens/homepage.dart';
import 'package:flutter/material.dart';

import '../chat.dart';
import '../screens/auth/loginbyphone.dart';
import '../screens/profile/profile.dart';

class NavBarWidget extends StatelessWidget {
  const NavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      // margin: EdgeInsets.only(top: 816.v),
      padding: const EdgeInsets.symmetric(
        horizontal: 37,
        vertical: 15,
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          border:
              Border(top: BorderSide(width: 1, color: Colors.grey.shade100))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
              );
            },
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.05 / 1,
                child: Icon(Icons.home_outlined,
                    size: 30, color: Colors.grey.shade400)),
            // child: SizedBox(
            //     width: MediaQuery.of(context).size.width * 0.05 / 1,
            //     child: Image.asset(IconAssets.nvaicon1)),
          ),
          // GestureDetector(
          //   onTap: () {
          //     // Navigator.push(
          //     //   context,
          //     //   MaterialPageRoute(
          //     //     builder: (context) => ChatPage(),
          //     //   ),
          //     // );
          //   },
          //   child: SizedBox(
          //       width: MediaQuery.of(context).size.width * 0.05 / 1,
          //       child: Image.asset(IconAssets.nvaicon2)),
          // ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChatPage(),
                ),
              );
            },
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.05 / 1,
                child: Image.asset(IconAssets.nvaicon3)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.05 / 1,
                child: Image.asset(IconAssets.nvaicon4)),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoginByPhone(),
                ),
              );
            },
            child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.05 / 1,
                child: Icon(Icons.exit_to_app_outlined,
                    color: Colors.grey.shade400)),
          ),
        ],
      ),
    );
  }
}
