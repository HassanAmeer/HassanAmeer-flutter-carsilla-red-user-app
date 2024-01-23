import 'package:carsilla/services/userstorage.dart';
import 'package:flutter/material.dart';
import '../repo/profilerepo.dart';
import '../services/toast.dart';

class ProfileVmC with ChangeNotifier {
  List prfiledata = [];
  checkProfileVmF(context, phone) async {
    final resdata = await ProfileRepo.checkProfileF(context, phone);
    if (resdata['status'].toString() == 'true' &&
        resdata['isHaveAccount'].toString() == 'true') {
      if (prfiledata.isNotEmpty) {
        prfiledata.clear();
      }
      prfiledata.add(resdata['data']);
    } else if (resdata['status'].toString() == 'true' &&
        resdata['isHaveAccount'].toString() == 'false') {
      if (prfiledata.isNotEmpty) {
        prfiledata.clear();
      }
      prfiledata.add({
        {
          "id": 1,
          "usertype": "fromuserapp",
          "image": "icons/profile.png",
          "fname": "First Name",
          "lname": "Last Name",
          "phone": "0301234567",
          "email": "user@gmail.com",
          "password": "123456",
          "created_at": null,
          "updated_at": "2023-12-07T22:15:00.000000Z"
        }
      });
    } else {
      showtoastF('Server Config Down', context);
    }
    notifyListeners();
  }

  // checkProfileVmF(context,phone) async {
  //   final resdata = await ProfileRepo.getProfileF(context);
  //   prfiledata = resdata['data'];
  //   if (resdata['status'].toString() == 'true') {
  //   } else {
  //     showtoastF('Server Config Down', context);
  //   }
  //   notifyListeners();
  // }

  /////////////////////
  updateProfileVmF(data, withImage, context) async {
    final resdata = await ProfileRepo.updateProfileF(data, withImage, context);
    if (resdata['status'].toString() == 'true') {
      String userPhone = await StorageClass.getuserphonef();
      checkProfileVmF(context, userPhone);
      showtoastF(context, 'Profile Is Updated');
    } else {
      showtoastF(context, 'Try Later');
    }
  }

  ///////////////////// email update
  updateEmailVmF(data, context) async {
    final resdata = await ProfileRepo.updateEmailF(data, context);
    if (resdata['status'].toString() == 'true') {
      String userPhone = await StorageClass.getuserphonef();
      checkProfileVmF(context, userPhone);
      showtoastF(context, 'Email Is Updated');
    } else {
      showtoastF(context, 'Try Later');
    }
    notifyListeners();
  }

  ///////////////////// email update
  updatePasswordVmF(data, context) async {
    final resdata = await ProfileRepo.updatePasswordF(data, context);
    if (resdata['status'].toString() == 'true') {
      String userPhone = await StorageClass.getuserphonef();
      checkProfileVmF(context, userPhone);
      showtoastF(context, 'Password Is Updated');
    } else {
      showtoastF(context, 'Try Later');
    }
  }
}

// {
//     "status": false,
//     "required fields": [
//         "id",
//         "profile",
//         "fname",
//         "lname",
//         "email"
//     ],
//     "optional fields": [
//         "profile"
//     ],
//     "Message": "Required All Fields"
// }