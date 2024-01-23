import 'package:carsilla/res/assets.dart';
import 'package:carsilla/screens/intro.dart';
import 'package:carsilla/screens/profile/editemail.dart';
import 'package:carsilla/screens/profile/editprofilename.dart';
import 'package:carsilla/services/userstorage.dart';
import 'package:carsilla/widgets/header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../res/theme.dart';
import '../../resources/urls.dart';
import '../../vm/profilevm.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({
    super.key,
  });

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    callinitf();
    // Provider.of<ProfileVmC>(context, listen: false).checkProfileVmF(context);
  }

  callinitf() async {
    ProfileVmC vmvalueval = Provider.of<ProfileVmC>(context, listen: false);
    if (vmvalueval.prfiledata.isEmpty) {
      await vmvalueval.checkProfileVmF(context, '0301234567');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Header(
      body: Consumer<ProfileVmC>(builder: (context, vmValue, child) {
        return vmValue.prfiledata.isNotEmpty
            ? Column(
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03 / 1),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EditProfileNamePage(),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Stack(
                        children: [
                          CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.grey.shade800,
                              child: Image.network(
                                '${ApiUrls.imageUrl}${vmValue.prfiledata[0]['image']}',
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    Image.asset(
                                  ImageAssets.profile,
                                  fit: BoxFit.cover,
                                ),
                              )),
                          Positioned(
                              bottom: 2,
                              right: 2,
                              child: CircleAvatar(
                                  backgroundColor:
                                      Colors.deepPurpleAccent.shade200,
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
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02 / 1),
                  Text(
                    vmValue.prfiledata[0]['isHaveAccount'].toString() == 'false'
                        ? 'Please Complete a Profile'
                        : vmValue.prfiledata[0]['fname'].toString(),
                    style: textTheme.headlineLarge!.copyWith(
                        color: Colors.grey.shade900,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01 / 1),
                  ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(const StadiumBorder()),
                        backgroundColor:
                            MaterialStateProperty.all(MainTheme.primaryColor),
                      ),
                      onPressed: () async {
                        // final userid = await StorageClass.getuseridf();
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text(userid.toString()),
                        //     duration: const Duration(seconds: 5),
                        //     action: SnackBarAction(
                        //       label: 'Undo',
                        //       onPressed: () {},
                        //     ),
                        //   ),
                        // );
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EditEmailPage(),
                          ),
                        );
                      },
                      child: Text(
                        vmValue.prfiledata[0]['isHaveAccount'].toString() ==
                                'false'
                            ? 'Enter Email'
                            : vmValue.prfiledata[0]['email'].toString(),
                        style: textTheme.titleMedium!
                            .copyWith(color: Colors.white),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02 / 1,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.04 / 1,
                    ),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 10,
                                  offset: const Offset(0, 2))
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/EditProfileNamePage");
                                },
                                leading: Icon(
                                  Icons.edit_outlined,
                                  color: Colors.grey.shade700,
                                ),
                                title: const Text('Edit Profile Name'),
                                trailing: const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                  height: 1,
                                  child: Divider(
                                    indent: 15,
                                    endIndent: 15,
                                    color: Colors.grey.shade300,
                                  )),
                              ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/ChangePassPage");
                                },
                                leading: Icon(
                                  Icons.lock_outlined,
                                  color: Colors.grey.shade700,
                                ),
                                title: const Text('Change Password'),
                                trailing: const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                  height: 1,
                                  child: Divider(
                                    indent: 15,
                                    endIndent: 15,
                                    color: Colors.grey.shade300,
                                  )),
                              ListTile(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, "/EditEmailPage");
                                },
                                leading: Icon(
                                  Icons.email_outlined,
                                  color: Colors.grey.shade700,
                                ),
                                title: const Text('Change Email Address'),
                                trailing: const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                  height: 1,
                                  child: Divider(
                                    indent: 15,
                                    endIndent: 15,
                                    color: Colors.grey.shade300,
                                  )),
                              ListTile(
                                leading: Icon(
                                  Icons.settings_outlined,
                                  color: Colors.grey.shade700,
                                ),
                                title: const Text('Settings'),
                                trailing: const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.grey,
                                ),
                              ),
                              SizedBox(
                                  height: 1,
                                  child: Divider(
                                    indent: 15,
                                    endIndent: 15,
                                    color: Colors.grey.shade300,
                                  )),
                              ListTile(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const IntroPage(),
                                    ),
                                  );
                                },
                                leading: const Icon(
                                  Icons.exit_to_app_outlined,
                                  color: MainTheme.primaryColor,
                                ),
                                title: const Text('Logout'),
                                trailing: const Icon(
                                  Icons.arrow_forward_outlined,
                                  color: MainTheme.primaryColor,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )),
                  )
                ],
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}
