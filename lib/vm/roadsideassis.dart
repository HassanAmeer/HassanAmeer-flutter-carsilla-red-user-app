import 'package:flutter/material.dart';

import '../repo/roadsideAssisRep.dart';
import '../services/toast.dart';

class RoadSideAssisVmC with ChangeNotifier {
  /////////////////////
  sendHomeAssisVmF(data, context) async {
    final resdata = await RoadSideAssisRepC.sendHomeAssisRepC(data, context);
    if (resdata['status'].toString() == 'true') {
      showtoastF(context, 'Order Requested');
    } else {
      // showtoastF(context, 'Try Later');
    }
  }

  /////////////////////
  sendRoadAssisVmF(data, context) async {
    final resdata = await RoadSideAssisRepC.sendRoadAssisRepC(data, context);
    if (resdata['status'].toString() == 'true') {
      showtoastF(context, 'Order Requested');
    } else {
      // showtoastF(context, 'Try Later');
    }
  }
}
