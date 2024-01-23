import 'package:carsilla/res/assets.dart';
import 'package:carsilla/res/theme.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/userstorage.dart';
import '../../vm/profilevm.dart';
import '../../widgets/profiletextfield.dart';

class ChangePassPage extends StatefulWidget {
  const ChangePassPage({super.key});

  @override
  State<ChangePassPage> createState() => _ChangePassPageState();
}

class _ChangePassPageState extends State<ChangePassPage> {
  TextEditingController passwordcontrollerold = TextEditingController();
  TextEditingController passwordcontroller1 = TextEditingController();
  TextEditingController passwordcontroller2 = TextEditingController();

  bool isHideFieldText = false;
  @override
  void initState() {
    super.initState();
    callinitialfunction();
  }

  callinitialfunction() {
    ProfileVmC vmvalueval = Provider.of<ProfileVmC>(context, listen: false);
    passwordcontroller1.text = vmvalueval.prfiledata[0]['password'].toString();
    passwordcontroller2.text = vmvalueval.prfiledata[0]['password'].toString();
  }

  @override
  Widget build(BuildContext context) {
    passwordcontrollerold.text = '●●●●●●●●●●●';
    return Header(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ListTile(
              leading: IconButton(
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.08),
                    shadowColor: MaterialStateProperty.all(
                        Colors.grey.shade50.withOpacity(0.2)),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child:
                          Icon(Icons.arrow_back, color: Colors.grey.shade800))),
              title: Center(
                child: Text('change password       ',
                    style: textTheme.titleLarge!.copyWith(
                        color: Colors.grey.shade900,
                        fontWeight: FontWeight.w500)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.04 / 1),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.86 / 1,
              height: MediaQuery.of(context).size.height * 0.07 / 1,
              child: ProfileFieldWidget(
                label: 'Enter Current Password',
                hint: '●●●●●●●●●●●',
                controller: passwordcontrollerold,
                prefix: const Icon(Icons.lock_outline),
                suffix: IconButton(
                  onPressed: () {
                    setState(() {
                      isHideFieldText = !isHideFieldText;
                    });
                  },
                  icon:
                      const Icon(Icons.visibility_outlined, color: Colors.grey),
                ),
                hidetext: isHideFieldText,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.86 / 1,
              height: MediaQuery.of(context).size.height * 0.07 / 1,
              child: ProfileFieldWidget(
                  label: 'Enter New Password',
                  hint: '',
                  controller: passwordcontroller1,
                  prefix: const Icon(Icons.lock_outline),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isHideFieldText = !isHideFieldText;
                      });
                    },
                    icon: const Icon(Icons.visibility_outlined,
                        color: Colors.grey),
                  ),
                  hidetext: isHideFieldText),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.86 / 1,
              height: MediaQuery.of(context).size.height * 0.07 / 1,
              child: ProfileFieldWidget(
                  label: 'Confirm New Password',
                  hint: '',
                  controller: passwordcontroller2,
                  prefix: const Icon(Icons.lock_outline),
                  suffix: IconButton(
                    onPressed: () {
                      setState(() {
                        isHideFieldText = !isHideFieldText;
                      });
                    },
                    icon: const Icon(Icons.visibility_outlined,
                        color: Colors.grey),
                  ),
                  hidetext: isHideFieldText),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
            SizedBox(
                height: 1,
                child: Divider(
                  indent: 15,
                  endIndent: 15,
                  color: Colors.grey.shade300,
                )),
            const ListTile(
              leading: Icon(
                Icons.info_outlined,
                color: Colors.red,
              ),
              subtitle: Text(
                  'Please make sure you remember and login with your new password you just created. Changes are reflected real-time after you changed your password.'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.16 / 1),
            MainButton(
              onclick: () async {
                if (passwordcontroller1.text != passwordcontroller2.text) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('PLease Enter Same Password'),
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ),
                    ),
                  );
                } else if (passwordcontroller1.text.isEmpty ||
                    passwordcontroller2.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: const Text('PLease Enter Password'),
                      duration: const Duration(seconds: 3),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ),
                    ),
                  );
                } else {
                  String userid = await StorageClass.getuseridf();
                  Map data = {
                    "id": userid.toString(),
                    "password": passwordcontroller2.text,
                  };
                  await Provider.of<ProfileVmC>(context, listen: false)
                      .updatePasswordVmF(data, context);
                  // if (resp['status'].toString() == 'true') {
                  _showBottomSheet(context);
                  // }
                }
              },
              label: 'change Password',
              btnColor: Colors.grey.shade300,
            )
          ],
        ),
      ),
    );
  }
}

void _showBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: Offset(
                  0,
                  -MediaQuery.of(context).size.height * 0.1 / 1,
                ),
                child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.close, color: Colors.grey.shade700)),
              ),
            ),

            // Top Section with Image
            Image.asset(
              IconAssets.greencheck, // Replace with your image asset path
              // height: 100.0, // Adjust the height as needed
              width: MediaQuery.of(context).size.width * 0.3 / 1,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 16.0),

            // Title with Large Heading
            Text(
              'Password Changed!',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade800,
              ),
            ),
            const SizedBox(height: 8.0),

            // Subtitle
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.78 / 1,
              child: Text(
                'Your account password has been updated, you can already login with your new password.',
                style: TextStyle(
                  fontSize: 13.0,
                  color: Colors.blueGrey.shade500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0),

            MainButton(
              onclick: () async {},
              label: 'Confirm',
            )
          ],
        ),
      );
    },
  );
}
