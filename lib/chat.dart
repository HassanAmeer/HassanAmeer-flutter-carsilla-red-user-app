import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:carsilla/res/assets.dart';
import 'package:carsilla/services/userstorage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'res/theme.dart';
import 'resources/urls.dart';
import 'screens/profile/profile.dart';
import 'vm/profilevm.dart';
import 'widgets/bottomnavbar.dart';
import 'widgets/textfeild.dart';
import 'package:http/http.dart' as http;

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController chatController = TextEditingController();

  List chatList = [
    {
      'from': 'Pellentesque non ornare neque, eujusto sollicitudin.',
      'to': 'Mauris porta suscipit dolor in pretium.'
    },
    {
      'from': 'Donec ullamcorper diam isodales, vitae ullamcorper.',
      'to': 'Donec ultricies lacus nulla, et fringilla nibh cursus sit amet. '
    },
    {
      'from': 'Curabitur consequat nunc ve  blandit.',
      'to': 'Pellentesque non ornare neque, eu…'
    },
    {'from': 'Sed mi erat, egestas vel condimentum luctus orci.', 'to': ''},
  ];

  void initState() {
    super.initState();
    fetchData();
    // Provider.of<ProfileVmC>(context, listen: false).checkProfileVmF(context);
    getlocf();
  }

  String imagpath = '';
  String locName = "DUBAI, UAE";
  double currentLat = 31.511900543125236;
  double currentLon = 74.43805270740967;

  ScrollController chatScroll = ScrollController();

  ///// get locatiion
  getlocf() async {
    Position currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentLat = currentLocation.latitude;
    currentLon = currentLocation.longitude;
    List<Placemark> placemarks = await placemarkFromCoordinates(
      currentLat,
      currentLon,
    );

    if (placemarks.isNotEmpty) {
      setState(() {
        dynamic cityName = placemarks[0].locality ?? "Unknown";
        dynamic street = placemarks[0].street ?? "Unknown";
        locName = '$cityName, $street';
      });
    }
  }

/////////////////////////
  final StreamController<List<dynamic>> _controller =
      StreamController<List<dynamic>>();

  Future<void> fetchData() async {
    final userid = await StorageClass.getuseridf();
    try {
      final response = await http
          .get(Uri.parse(ApiUrls.baseUrl + ApiUrls.getchatsbyid + userid));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(data['data'].toString()),
        //     duration: const Duration(seconds: 5),
        //     action: SnackBarAction(
        //       label: 'Undo',
        //       onPressed: () {},
        //     ),
        //   ),
        // );
        _controller.add(data['data']);
      } else {
        throw Exception('👉 Failed to load data');
      }
    } catch (e) {
      debugPrint('👉 Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: MainTheme.primaryColor,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: (() {
              Scaffold.of(context).openDrawer();
            }),
          );
        }),
        title: Text(
          "Messages",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          // CircleAvatar(
          //   child: Image.asset(ImageAssets.profile),
          // ),
          Consumer<ProfileVmC>(builder: (context, profileVmVal, chil) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()));
                },
                child: CircleAvatar(
                    backgroundColor: Colors.grey.shade100,
                    radius: 22,
                    backgroundImage: NetworkImage(ApiUrls.imageUrl +
                        profileVmVal.prfiledata[0]['image'])));
          }),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      // extendBodyBehindAppBar: true,
      bottomNavigationBar: const NavBarWidget(),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: SingleChildScrollView(
                controller: chatScroll,
                child: Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                            height:
                                MediaQuery.of(context).size.height * 0.115 / 1,
                            color: Theme.of(context).colorScheme.primary),
                        Transform.translate(
                          offset: Offset(
                              0, -MediaQuery.of(context).size.height * 0.1 / 1),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 7),
                              child: SingleChildScrollView(
                                controller: ScrollController(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Consumer<ProfileVmC>(
                                        builder: (context, profileVmVal, chil) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0, right: 10),
                                                  child: GestureDetector(
                                                    onTap: () {
                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              const ProfilePage(),
                                                        ),
                                                      );
                                                    },
                                                    child: CircleAvatar(
                                                        backgroundColor: Colors
                                                            .grey.shade100,
                                                        radius: 22,
                                                        backgroundImage:
                                                            NetworkImage(ApiUrls
                                                                    .imageUrl +
                                                                profileVmVal
                                                                        .prfiledata[
                                                                    0]['image'])
                                                        // child: const Icon(
                                                        //   Icons.person_4_rounded,
                                                        //   size: 30,
                                                        //   color: MainTheme.primaryColor,
                                                        // ),
                                                        ),
                                                  )

                                                  // child: CircleAvatar(
                                                  //   child: Image.asset(ImageAssets.profile),
                                                  // ),
                                                  ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 8),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        profileVmVal
                                                            .prfiledata[0]
                                                                ['fname']
                                                            .toString(),
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .labelMedium!
                                                            .copyWith(
                                                                color: Colors
                                                                    .black)),
                                                    const SizedBox(height: 6),
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          size: 15,
                                                          color: Colors
                                                              .grey.shade400,
                                                        ),
                                                        Text(
                                                          locName,
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .labelSmall!
                                                              .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 38,
                                            width: 85,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                // Image.asset(
                                                // ImageConstant.img86,
                                                //   height: 24.adaptSize,
                                                //   width: 24.adaptSize,
                                                //   alignment: Alignment.centerLeft,
                                                //   margin: EdgeInsets.only(left: 8),
                                                // ),
                                                // CustomImageView(
                                                //   imagePath:
                                                //       ImageConstant.imgIconPrimary38x85,
                                                //   height: 38.v,
                                                //   width: 85.h,
                                                //   alignment: Alignment.center,
                                                // ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      );
                                    }),
                                    /////////////////////////////
                                    SingleChildScrollView(
                                      controller: ScrollController(),
                                      child: StreamBuilder(
                                          stream: _controller.stream,
                                          builder: (context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.hasError) {
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            }
                                            if (!snapshot.hasData) {
                                              return Text(
                                                  'No Chats Available ${snapshot}');
                                            }
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              return const Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                            return ListView.builder(
                                              shrinkWrap: true,
                                              controller: ScrollController(),
                                              // reverse: true,
                                              itemCount: snapshot.data!.length,
                                              // separatorBuilder: (context, index) {
                                              //   if (snapshot.data[index]['from']
                                              //           .toString()
                                              //           .toLowerCase() ==
                                              //       'user') {
                                              //     return Align(
                                              //       alignment: Alignment.centerRight,
                                              //       child: Padding(
                                              //         padding: const EdgeInsets.symmetric(
                                              //             vertical: 8.0),
                                              //         child: Container(
                                              //           width: MediaQuery.of(context)
                                              //                   .size
                                              //                   .width *
                                              //               0.7 /
                                              //               1,
                                              //           decoration: BoxDecoration(
                                              //               color: Colors.grey.shade800,
                                              //               borderRadius:
                                              //                   BorderRadius.circular(10)),
                                              //           child: Padding(
                                              //             padding: const EdgeInsets.all(12.0),
                                              //             child: Text(
                                              //               snapshot.data[index]['msg']
                                              //                   .toString(),
                                              //               style: Theme.of(context)
                                              //                   .textTheme
                                              //                   .titleMedium!
                                              //                   .copyWith(
                                              //                       color:
                                              //                           Colors.grey.shade200),
                                              //             ),
                                              //           ),
                                              //         ),
                                              //       ),
                                              //     );
                                              //   } else {
                                              //     return SizedBox(height: 0);
                                              //   }
                                              // },
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                if (snapshot.data[index]['from']
                                                        .toString()
                                                        .toLowerCase() ==
                                                    'admin') {
                                                  return Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 7.0),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.7 /
                                                                1,
                                                            decoration: BoxDecoration(
                                                                color: const Color
                                                                    .fromARGB(
                                                                    255,
                                                                    181,
                                                                    216,
                                                                    233),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      12.0),
                                                              child: Text(
                                                                snapshot
                                                                    .data[index]
                                                                        ['msg']
                                                                    .toString(),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium!
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade700),
                                                              ),
                                                            ),
                                                          ),
                                                          snapshot.data[index]
                                                                      ['doc'] !=
                                                                  0
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              8.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child: Image.network(
                                                                        ApiUrls.imageUrl +
                                                                            snapshot.data[index][
                                                                                'doc'],
                                                                        width:
                                                                            200,
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                child) =>
                                                                            SizedBox(height: 0)),
                                                                  ),
                                                                )
                                                              : SizedBox(
                                                                  height: 0),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 8.0),
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.7 /
                                                                1,
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .grey
                                                                    .shade800,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(
                                                                      12.0),
                                                              child: Text(
                                                                snapshot
                                                                    .data[index]
                                                                        ['msg']
                                                                    .toString(),
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .titleMedium!
                                                                    .copyWith(
                                                                        color: Colors
                                                                            .grey
                                                                            .shade200),
                                                              ),
                                                            ),
                                                          ),
                                                          snapshot.data[index]
                                                                      ['doc'] !=
                                                                  0
                                                              ? Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              8.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child: Image.network(
                                                                        ApiUrls.imageUrl +
                                                                            snapshot.data[index][
                                                                                'doc'],
                                                                        width:
                                                                            200,
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        errorBuilder: (context,
                                                                                error,
                                                                                child) =>
                                                                            SizedBox(height: 0)),
                                                                  ),
                                                                )
                                                              : SizedBox(
                                                                  height: 0),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                }
                                              },
                                            );
                                          }),
                                    ),
                                    const SizedBox(height: 5)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /////////// end container rounded
                    // Positioned(
                    //   bottom: 0,
                    //   child: Align(
                    //     alignment: Alignment.bottomCenter,
                    //     child: Padding(
                    //       padding: const EdgeInsets.symmetric(
                    //           horizontal: 14, vertical: 9.0),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         crossAxisAlignment: CrossAxisAlignment.center,
                    //         children: [
                    //           SizedBox(
                    //             width: MediaQuery.of(context).size.width * 0.75 / 1,
                    //             child: CustomTextFormField(
                    //               // controller: whenToPickUpController,
                    //               hintText: "Write Your Message",
                    //               suffix: GestureDetector(
                    //                   onTap: () async {
                    //                     try {
                    //                       const String apiUrl =
                    //                           ApiUrls.baseUrl + ApiUrls.addchats;
                    //                       var request = http.MultipartRequest(
                    //                           'POST', Uri.parse(apiUrl));
                    //                       if (imagpath.isNotEmpty) {
                    //                         request.files.add(
                    //                             await http.MultipartFile.fromPath(
                    //                                 'doc', imagpath));
                    //                       }
                    //                       request.fields['from'] = 'user';
                    //                       request.fields['user_id'] =
                    //                           await StorageClass.getuseridf();
                    //                       request.fields['msg'] =
                    //                           chatController.text;
                    //                       var response = await request.send();
                    //                       if (response.statusCode == 200) {
                    //                         imagpath = '';
                    //                         chatController.clear();
                    //                         setState(() {});
                    //                         // var responseData =
                    //                         //     await response.stream.toBytes();
                    //                         // var responseString =
                    //                         //     String.fromCharCodes(responseData);
                    //                         // var bodydata =
                    //                         //     jsonDecode(responseString);
                    //                         // ScaffoldMessenger.of(context)
                    //                         //     .showSnackBar(
                    //                         //   SnackBar(
                    //                         //       content:
                    //                         //           Text(bodydata['message'])),
                    //                         // );
                    //                       } else {
                    //                         debugPrint(
                    //                             'Error uploading image: 👉 ${response.statusCode}');
                    //                       }
                    //                     } catch (e) {
                    //                       print(
                    //                           '👉 when send message ${e.toString()}----try catch----');
                    //                     }
                    //                   },
                    //                   child: Image.asset(IconAssets.send)),
                    //             ),
                    //           ),
                    //           Padding(
                    //               padding: const EdgeInsets.only(left: 14.0),
                    //               child: GestureDetector(
                    //                   onTap: () async {
                    //                     var image = await ImagePicker().pickImage(
                    //                         source: ImageSource.gallery,
                    //                         imageQuality: 40);
                    //                     if (image != null) {
                    //                       setState(() {
                    //                         imagpath = image.path;
                    //                       });
                    //                     }
                    //                   },
                    //                   child: imagpath.isNotEmpty
                    //                       ? ClipRRect(
                    //                           borderRadius:
                    //                               BorderRadius.circular(10),
                    //                           child: Image.file(
                    //                             File(imagpath),
                    //                             width: 45,
                    //                             height: 45,
                    //                             fit: BoxFit.cover,
                    //                           ),
                    //                         )
                    //                       : Image.asset(IconAssets.attachment,
                    //                           width: 40)))
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 9.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.065 / 1,
                      width: MediaQuery.of(context).size.width * 0.75 / 1,
                      child: CustomTextFormField(
                        controller: chatController,
                        hintText: "Write Your Message",
                        suffix: GestureDetector(
                            onTap: () async {
                              if (chatController.text.trim().isNotEmpty) {
                                try {
                                  const String apiUrl =
                                      ApiUrls.baseUrl + ApiUrls.addchats;
                                  var request = http.MultipartRequest(
                                      'POST', Uri.parse(apiUrl));
                                  if (imagpath.isNotEmpty) {
                                    request.files.add(
                                        await http.MultipartFile.fromPath(
                                            'doc', imagpath));
                                  }
                                  request.fields['from'] = 'user';
                                  request.fields['user_id'] =
                                      await StorageClass.getuseridf();
                                  request.fields['msg'] = chatController.text;
                                  var response = await request.send();
                                  if (response.statusCode == 200) {
                                    imagpath = '';
                                    chatController.clear();
                                    fetchData();
                                    // chatScroll.initialScrollOffset;
                                    setState(() {});
                                    // var responseData =
                                    //     await response.stream.toBytes();
                                    // var responseString =
                                    //     String.fromCharCodes(responseData);
                                    // var bodydata =
                                    //     jsonDecode(responseString);
                                    // ScaffoldMessenger.of(context)
                                    //     .showSnackBar(
                                    //   SnackBar(
                                    //       content:
                                    //           Text(bodydata['message'])),
                                    // );
                                  } else {
                                    debugPrint(
                                        'Error uploading image: 👉 ${response.statusCode}');
                                  }
                                } catch (e) {
                                  print(
                                      '👉 when send message ${e.toString()}----try catch----');
                                }
                              }
                            },
                            child: Image.asset(IconAssets.send)),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 14.0),
                        child: GestureDetector(
                            onTap: () async {
                              var image = await ImagePicker().pickImage(
                                  source: ImageSource.gallery,
                                  imageQuality: 40);
                              if (image != null) {
                                setState(() {
                                  imagpath = image.path;
                                });
                              }
                            },
                            child: imagpath.isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      File(imagpath),
                                      width: 45,
                                      height: 45,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Image.asset(IconAssets.attachment,
                                    width: 40)))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
