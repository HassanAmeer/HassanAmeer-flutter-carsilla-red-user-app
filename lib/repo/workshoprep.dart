import 'package:flutter/material.dart';

import '../resources/urls.dart';
import '../services/NetworkApiService.dart';

class WorkShopRepC {
  static addDataWorkShopRepC(data, context) async {
    try {
      final checkrepsonse = await ApiClass()
          .postApiData(ApiUrls.baseUrl + ApiUrls.addworkshop, data);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when addDataWorkShopRepC api in repo ------------------------------');
    }
  }
}
