import 'package:flutter/material.dart';
import '../repo/sparepartsrepo.dart';
import '../services/toast.dart';

class SparePartsVmC with ChangeNotifier {
  int maxSparePartsToShow = 4;
  bool allSparePartsToShow = false;
  List sparePartsList = [];
  List sparePartsShopsList = [];
  List repairingCarsList = [];

  changeMaxSparePartsToShowVmF() {
    allSparePartsToShow = !allSparePartsToShow;
    notifyListeners();
  }

  ///////////////////// add spare parts function
  addSparePartsVmF(data, context) async {
    final resdata = await SparePartsRepC.addRepairingCarRepF(data, context);
    if (resdata['status'].toString() == 'true') {
      showtoastF(context, resdata['data'].toString());
    } else {
      showtoastF(context, 'Try Later');
    }
  }

  ///////////////////// getSparePartsVmF
  getSparePartsVmF(context) async {
    final resdata = await SparePartsRepC.getSparePartsRepoF(context);
    if (resdata['status'].toString() == 'true') {
      sparePartsList = resdata['data'];
    } else {
      showtoastF(context, 'Try Later');
    }
    notifyListeners();
  }

  ///////////////////// getSparePartsShopsVmF
  getSparePartsShopsVmF(context) async {
    final resdata = await SparePartsRepC.getSparePartsShopsepoF(context);
    if (resdata['status'].toString() == 'true') {
      sparePartsShopsList = resdata['data'];
    } else {
      showtoastF(context, 'Try Later');
    }
    notifyListeners();
  }

  ///////////////////// getSparePartsVmF
  getRepairingVmF(context) async {
    final resdata = await SparePartsRepC.getRepairingCarsRepoF(context);
    if (resdata['status'].toString() == 'true') {
      repairingCarsList = resdata['data'];
      // ScaffoldMessenger.of(context).showSnackBar(
      //   SnackBar(
      //     content: Text(resdata['data'].toString()),
      //     duration: const Duration(seconds: 5),
      //     action: SnackBarAction(
      //       label: 'Undo',
      //       onPressed: () {},
      //     ),
      //   ),
      // );
    } else {
      showtoastF(context, 'Try Later');
    }
    notifyListeners();
  }
}
