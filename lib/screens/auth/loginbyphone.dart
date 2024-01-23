import 'package:carsilla/res/assets.dart';
import 'package:carsilla/screens/auth/verify.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../res/theme.dart';
import '../../services/userstorage.dart';
import '../../vm/profilevm.dart';
import '../../widgets/btn.dart';
import '../../widgets/textfeild.dart';
import '../profile/profile.dart';

class LoginByPhone extends StatefulWidget {
  const LoginByPhone({super.key});

  @override
  State<LoginByPhone> createState() => _LoginByPhoneState();
}

class _LoginByPhoneState extends State<LoginByPhone> {
  TextEditingController phoneController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Text(''),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          controller: ScrollController(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Welcome Back !',
                style: textTheme.headlineLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65 / 1,
                child: Text(
                  'Stay signed in with your account to make searching easier',
                  style: textTheme.titleLarge!
                      .copyWith(color: Colors.grey.shade800),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03 / 1,
              ),
              const ListTile(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                title: Text('Phone'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.23 / 1,
                      decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey.shade400,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                              height: 45,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 4.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      IconAssets.uae,
                                      fit: BoxFit.fill,
                                      height: 17,
                                      width: 30,
                                    ),
                                    Positioned(
                                      bottom: 10,
                                      child: Text(
                                        'UAE',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .copyWith(
                                                color: Colors.grey.shade500),
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 4.0),
                            child: Text(
                              "+971 ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.grey.shade500),
                            ),
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65 / 1,
                        child: CustomTextFormField(
                          hintText: 'Phone Number',
                          controller: phoneController,
                          textInputType: TextInputType.phone,
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04 / 1,
              ),
              MainButton(
                width: 0.9,
                onclick: () async {
                  // Navigator.push(context, MaterialPageRoute(builder: (context)=> VerifyPage(verificationId:''.toString())));

                  if (phoneController.text.length < 4) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Enter Valid Phone Number'),
                        duration: Duration(seconds: 2)));
                  } else {
                    setState(() {
                      isLoading = true;
                    });
                    await _verifyPhoneNumber(phoneController.text.toString());
                  }
                },
                label: 'Confirm',
                isLoading: isLoading,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3 / 1,
              ),
              // Center(
              //   child: GestureDetector(
              //     onTap: () {
              //       // Navigator.pushNamed(context, "/LoginPage");
              //     },
              //     child: RichText(
              //       text: TextSpan(
              //         children: [
              //           TextSpan(
              //             text: "Already have an account ?",
              //             style: textTheme.labelMedium!
              //                 .copyWith(color: Colors.grey.shade700),
              //           ),
              //           const TextSpan(
              //             text: " ",
              //           ),
              //           TextSpan(
              //             text: "Login",
              //             style: textTheme.labelMedium!.copyWith(
              //                 color: MainTheme.primaryColor,
              //                 fontWeight: FontWeight.bold),
              //           ),
              //         ],
              //       ),
              //       textAlign: TextAlign.left,
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.02 / 1,
              // ),
              // Center(
              //   child: GestureDetector(
              //     onTap: () async {
              //       await StorageClass.set(1, '0301234567');

              //       Provider.of<ProfileVmC>(context, listen: false)
              //           .checkProfileVmF(context, '0301234567');
              //       // Navigator.pushNamed(context, "/HomePage");
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //           builder: (context) => const ProfilePage(),
              //         ),
              //       );
              //     },
              //     child: RichText(
              //       text: TextSpan(
              //         children: [
              //           TextSpan(
              //             text: "Temprory!",
              //             style: textTheme.labelMedium!
              //                 .copyWith(color: Colors.grey.shade700),
              //           ),
              //           const TextSpan(
              //             text: " ",
              //           ),
              //           TextSpan(
              //             text: "Login as a Guest",
              //             style: textTheme.labelMedium!.copyWith(
              //                 color: MainTheme.primaryColor,
              //                 fontWeight: FontWeight.bold),
              //           ),
              //         ],
              //       ),
              //       textAlign: TextAlign.left,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  //////////////// phone otp f
  Future<void> _verifyPhoneNumber(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        // Automatically handle verification if using a physical device
        await _auth.signInWithCredential(credential);
        print(
            '👉Phone number automatically verified and signed in ------------------------');
      },
      verificationFailed: (FirebaseAuthException e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Limit Exeeded. to many Requests!'),
            duration: Duration(seconds: 2)));
        debugPrint(
            '💥Phone number verification failed: $e -------------------------');
      },
      codeSent: (String verificationId, int? resendToken) async {
        debugPrint('🔐 token id: $resendToken');
        debugPrint('🔐 verification id: $verificationId');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => VerifyPage(
                    verificationId: verificationId.toString(),
                    phoneNumber: phoneNumber)));
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('OTP Sent'), duration: Duration(seconds: 2)));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text('Time Out'), duration: Duration(seconds: 2)));
        print('Auto retrieval timeout ---------------$verificationId---------');
      },
    );
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }
}
