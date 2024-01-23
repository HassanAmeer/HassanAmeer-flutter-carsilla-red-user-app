import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'screens/carinsurance/carinsurance.dart';
import 'screens/auth/loginPage.dart';
import 'screens/auth/loginbyphone.dart';
import 'screens/auth/signup.dart';
import 'screens/auth/verified.dart';
import 'screens/auth/verify.dart';
import 'screens/homepage.dart';
import 'screens/intro.dart';
import 'res/theme.dart';
import 'screens/profile/changepass.dart';
import 'screens/profile/editemail.dart';
import 'screens/profile/editprofilename.dart';
import 'screens/profile/profile.dart';
import 'screens/roadsideassis/roadassispage.dart';
import 'screens/roadsideassis/roadsideassis.dart';
import 'screens/workshopservices/workshopservices.dart';
import 'screens/spareparts/sparepartssearch.dart';
import 'screens/splash/splash.dart';
import 'vm/carlistingvm.dart';
import 'vm/chooseCarModelYearVm.dart';
import 'vm/insuranceVM.dart';
import 'vm/invoicesVm.dart';
import 'vm/profilevm.dart';
import 'vm/roadsideassis.dart';
import 'vm/sparepartsVm.dart';
import 'vm/vhicleTransHomeAssisVm.dart';
import 'vm/workshopvm.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ProfileVmC>(create: (_) => ProfileVmC()),
    ChangeNotifierProvider<WorkShopVmC>(create: (_) => WorkShopVmC()),
    ChangeNotifierProvider<RoadSideAssisVmC>(create: (_) => RoadSideAssisVmC()),
    ChangeNotifierProvider<InvoicesVmC>(create: (_) => InvoicesVmC()),
    ChangeNotifierProvider<CarListingVmC>(create: (_) => CarListingVmC()),
    ChangeNotifierProvider<SparePartsVmC>(create: (_) => SparePartsVmC()),
    ChangeNotifierProvider<ChooseCarModelYearVmC>(
        create: (_) => ChooseCarModelYearVmC()),
    ChangeNotifierProvider<InsuranceVmC>(create: (_) => InsuranceVmC()),
    ChangeNotifierProvider<VhicleTranspHomeAssisVmC>(
        create: (_) => VhicleTranspHomeAssisVmC()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Carsilla',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: MainTheme.primaryColor),
          dialogBackgroundColor: Colors.white,
          dialogTheme: const DialogTheme(backgroundColor: Colors.white),
          useMaterial3: true),
      initialRoute: '/SplahPage',
      routes: {
        '/SplahPage': (context) => const SplahPage(),
        '/HomePage': (context) => const HomePage(),
        '/ProfilePage': (context) => const ProfilePage(),
        '/ChangePassPage': (context) => const ChangePassPage(),
        '/EditProfileNamePage': (context) => const EditProfileNamePage(),
        '/EditEmailPage': (context) => const EditEmailPage(),
        '/IntroPage': (context) => const IntroPage(),
        '/LoginByPhone': (context) => const LoginByPhone(),
        '/LoginPage': (context) => const LoginPage(),
        '/SignUpPage': (context) => const SignUpPage(),
        '/VerifyPage': (context) => const VerifyPage(),
        '/VerifiedPage': (context) => const VerifiedPage(),
        '/WorkShopServicesPage': (context) => const WorkShopServicesPage(),
        '/RoadSideAssisPage': (context) => const RoadSideAssisPage(),
        '/SparePartSearchPage': (context) => const SparePartSearchPage(),
        '/CarInsurancePage': (context) => const CarInsurancePage(),
        '/RoadAssisPage': (context) => const RoadAssisPage(),
      },
      home: const HomePage(),
    );
  }
}


//  <uses-permission android:name="android.permission.FOREGROUND_SERVICE" />
//     <uses-permission android:name="android.permission.ACCESS_BACKGROUND_LOCATION"/>
