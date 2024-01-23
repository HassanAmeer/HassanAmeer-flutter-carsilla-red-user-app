import 'package:carsilla/res/assets.dart';
import 'package:carsilla/screens/auth/verified.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../res/theme.dart';
import '../../widgets/btn.dart';
import '../../widgets/otpfeild.dart';

class VerifyPage extends StatefulWidget {
  final String? verificationId;
  final String? phoneNumber;

  const VerifyPage({super.key, this.verificationId, this.phoneNumber = ''});

  @override
  State<VerifyPage> createState() => _VerifyPageState();
}

class _VerifyPageState extends State<VerifyPage> {
  dynamic codeis = '';
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Text(''),
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.11 / 1),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.85 / 1,
              decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.grey.shade400.withOpacity(0.7)),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03 / 1,
                ),
                Text(
                  'Enter Your 4 digit code',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03 / 1,
                ),
                Image.asset(IconAssets.mailbox),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05 / 1,
                ),
                OTPField(
                  onFilled: (value) {
                    setState(() {
                      codeis = value;
                    });
                    debugPrint('🔐 ${value.toString()}');
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08 / 1,
                ),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Did you don’t get code?",
                            style: textTheme.labelMedium!
                                .copyWith(color: Colors.grey.shade700),
                          ),
                          const TextSpan(
                            text: " ",
                          ),
                          TextSpan(
                            text: "Resend",
                            style: textTheme.labelMedium!.copyWith(
                                color: MainTheme.primaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03 / 1,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8 / 1,
                  child: MainButton(
                      onclick: () {
                        if (codeis.length < 5) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Fill OTP Fields'),
                                  duration: Duration(seconds: 1)));
                        } else {
                          confirmotp(codeis);
                        }
                      },
                      label: 'Verify'),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02 / 1,
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  /////////verify f
  confirmotp(otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: widget.verificationId!, smsCode: otp);
      await _auth
          .signInWithCredential(credential)
          .then((value) =>
              // Navigator.pushNamed(context, "/VerifiedPage")
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          VerifiedPage(phoneNumber: widget.phoneNumber))))
          .onError((error, stackTrace) => ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(
                  content: Text('Error: Verify The Limit'),
                  duration: Duration(seconds: 2))));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Errors: Verify The Limit'),
          duration: Duration(seconds: 2)));
    }
  }
  /////////verify f
}
