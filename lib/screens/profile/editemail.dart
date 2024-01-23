import 'package:carsilla/services/userstorage.dart';
import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/assets.dart';
import '../../res/theme.dart';
import '../../vm/profilevm.dart';
import '../../widgets/profiletextfield.dart';

class EditEmailPage extends StatefulWidget {
  const EditEmailPage({super.key});

  @override
  State<EditEmailPage> createState() => _EditEmailPageState();
}

class _EditEmailPageState extends State<EditEmailPage> {
  TextEditingController emailController1 = TextEditingController();
  TextEditingController emailController2 = TextEditingController();

  bool isHideFieldText = true;

  @override
  void initState() {
    super.initState();
    callinitialfunction();
  }

  callinitialfunction() {
    ProfileVmC vmvalueval = Provider.of<ProfileVmC>(context, listen: false);
    emailController1.text = vmvalueval.prfiledata[0]['email'].toString();
    emailController2.text = vmvalueval.prfiledata[0]['email'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileVmC>(builder: (context, vmValue, child) {
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
                        child: Icon(Icons.arrow_back,
                            color: Colors.grey.shade800))),
                title: Center(
                  child: Text('Edit Email       ',
                      style: textTheme.titleLarge!.copyWith(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.16 / 1),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.86 / 1,
                height: MediaQuery.of(context).size.height * 0.07 / 1,
                child: ProfileFieldWidget(
                    label: 'Email Address',
                    hint: '',
                    controller: emailController1,
                    prefix: const Icon(Icons.email_outlined)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.86 / 1,
                height: MediaQuery.of(context).size.height * 0.07 / 1,
                child: ProfileFieldWidget(
                    label: 'Confirm Email Address',
                    hint: '',
                    controller: emailController2,
                    prefix: const Icon(Icons.email_outlined)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.18 / 1),
              MainButton(
                onclick: () async {
                  if (emailController1.text != emailController2.text) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('PLease Enter Same Email'),
                        duration: const Duration(seconds: 3),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {},
                        ),
                      ),
                    );
                  } else if (emailController1.text.isEmpty ||
                      emailController2.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('PLease Enter Email'),
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
                      "email": emailController2.text,
                    };
                    await vmValue.updateEmailVmF(data, context);
                    // if (resp['status'].toString() == 'true') {
                    _showBottomSheet(context);
                    // }
                  }
                },
                label: 'Save Changes',
              )
            ],
          ),
        ),
      );
    });
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
              'Email Changed!',
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
                  color: Colors.grey.shade500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16.0),

            MainButton(
              onclick: () {},
              label: 'Confirm',
            )
          ],
        ),
      );
    },
  );
}
