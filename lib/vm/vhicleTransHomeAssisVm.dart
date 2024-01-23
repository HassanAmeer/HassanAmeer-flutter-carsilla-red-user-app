import 'package:flutter/material.dart';
import '../repo/insurancerepo.dart';
import '../repo/vhicleTransHomeAssisRep.dart';
import '../services/toast.dart';
import '../services/userstorage.dart';

class VhicleTranspHomeAssisVmC with ChangeNotifier {
  // List vhicleTransDataList = [];
  // getInsuranceVmF(context) async {
  //   final response = await InsuranceRepC.getInsuranceRepC(context);
  //   if (response['status'].toString() == 'true') {
  //     vhicleTransDataList = response['data'];
  //   }
  //   notifyListeners();
  // }

  ////////////
  addVTHomeAssisVmF(data, context) async {
    final userid = await StorageClass.getuseridf();

    final resdata =
        await VhicleTransHomeAssisRepC.addVTHomeAssisRepF(data, context);
    if (resdata['status'].toString() == 'true') {
      showtoastF(context, 'Request submitted');
    } else {
      showtoastF(context, 'Try Later');
    }
  }
}
