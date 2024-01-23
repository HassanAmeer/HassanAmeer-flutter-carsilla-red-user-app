import 'dart:io';

import 'package:carsilla/widgets/btn.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../res/assets.dart';
import '../../res/theme.dart';
import '../../resources/urls.dart';
import '../../services/userstorage.dart';
import '../../vm/profilevm.dart';
import '../../widgets/profiletextfield.dart';

class EditProfileNamePage extends StatefulWidget {
  const EditProfileNamePage({super.key});

  @override
  State<EditProfileNamePage> createState() => _EditProfileNamePageState();
}

class _EditProfileNamePageState extends State<EditProfileNamePage> {
  TextEditingController fnamecontroller = TextEditingController();
  TextEditingController lnamecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    callinitialfunction();
  }

  callinitialfunction() async{
    ProfileVmC vmvalueval = Provider.of<ProfileVmC>(context, listen: false);
    if (vmvalueval.prfiledata.isEmpty) {
      await vmvalueval.checkProfileVmF(context, '0301234567');
    }
    fnamecontroller.text = vmvalueval.prfiledata[0]['fname'].toString();
    lnamecontroller.text = vmvalueval.prfiledata[0]['lname'].toString();
    emailcontroller.text = vmvalueval.prfiledata[0]['email'].toString();
  }

  String profilePath = '';
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
                  child: Text('Edit Profile       ',
                      style: textTheme.titleLarge!.copyWith(
                          color: Colors.grey.shade900,
                          fontWeight: FontWeight.w500)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.03 / 1),
              GestureDetector(
                onTap: () async {
                  final image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    setState(() {
                      profilePath = image.path;
                    });
                  }
                },
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey.shade800,
                        // child: Image.asset(ImageAssets.profile),
                        child: profilePath.isNotEmpty
                            ? Image.file(File(profilePath), fit: BoxFit.cover)
                            : Image.network(
                                '${ApiUrls.imageUrl}${vmValue.prfiledata[0]['image']}',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Icon(Icons.person_4_outlined);
                                },
                              ),
                      ),
                    ),
                    Positioned(
                        bottom: 2,
                        right: 2,
                        child: CircleAvatar(
                            backgroundColor: Colors.deepPurpleAccent.shade200,
                            radius: 17,
                            child: const Padding(
                              padding: EdgeInsets.all(6.0),
                              child: Icon(
                                Icons.edit_outlined,
                                color: Colors.white,
                                size: 17,
                              ),
                            )))
                  ],
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.86 / 1,
                height: MediaQuery.of(context).size.height * 0.07 / 1,
                child: ProfileFieldWidget(
                    label: 'First Name',
                    hint: 'Name',
                    controller: fnamecontroller,
                    prefix: const Icon(Icons.person_outline_outlined)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.86 / 1,
                height: MediaQuery.of(context).size.height * 0.07 / 1,
                child: ProfileFieldWidget(
                    label: 'Last Name',
                    hint: 'Name',
                    controller: lnamecontroller,
                    prefix: const Icon(Icons.person_outline_outlined)),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02 / 1),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.86 / 1,
                height: MediaQuery.of(context).size.height * 0.07 / 1,
                child: ProfileFieldWidget(
                  label: 'Email Address',
                  hint: '@gmail.com',
                  controller: emailcontroller,
                  prefix: const Icon(Icons.email_outlined),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.18 / 1),
              MainButton(
                onclick: () async {
                  final userid = await StorageClass.getuseridf();
                  if (profilePath.isEmpty) {
                    Map data = {
                      "id": userid.toString(),
                      "fname": fnamecontroller.text,
                      "lname": lnamecontroller.text,
                      "email": emailcontroller.text
                    };
                    await vmValue.updateProfileVmF(data, false, context);
                    _showBottomSheet(context);
                  } else {
                    Map data = {
                      "id": userid.toString(),
                      "profile": profilePath,
                      "fname": fnamecontroller.text,
                      "lname": lnamecontroller.text,
                      "email": emailcontroller.text
                    };
                    await vmValue.updateProfileVmF(data, true, context);
                    _showBottomSheet(context);
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
              'Profile Updated!',
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
                'Your profile has been successfully updated, changes are reflected real time.',
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
