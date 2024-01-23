// import 'package:flutter/material.dart';
// import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

// import '../homepage.dart';
// import '../res/theme.dart';

// class ZoomDrawerPage extends StatefulWidget {
//   const ZoomDrawerPage({super.key});

//   @override
//   State<ZoomDrawerPage> createState() => _ZoomDrawerPageState();
// }

// class _ZoomDrawerPageState extends State<ZoomDrawerPage> {
//   final ZoomDrawerController zoomDrawerCont = ZoomDrawerController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: MainTheme.primaryColor,
//       body: ZoomDrawer(
//         controller: zoomDrawerCont,
//         menuScreen: const MenuDrawer(),
//         mainScreen: const HomePage(),
//         borderRadius: 24.0,
//         showShadow: true,
//         angle: 0.0,
//         drawerShadowsBackgroundColor: MainTheme.primaryColor.shade300,
//         slideWidth: MediaQuery.of(context).size.width * 0.75,
//       ),
//     );
//   }
// }
