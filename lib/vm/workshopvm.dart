import 'package:flutter/material.dart';

import '../repo/workshoprep.dart';
import '../services/toast.dart';

class WorkShopVmC with ChangeNotifier {
  /////////////////////
  addWorkShopDataVmF(data, context) async {
    final resdata = await WorkShopRepC.addDataWorkShopRepC(data, context);
    if (resdata['status'].toString() == 'true') {
      showtoastF(context, 'Thank You For Your Order');
    } else {
      // showtoastF(context, 'Try Later');
    }
  }
}
