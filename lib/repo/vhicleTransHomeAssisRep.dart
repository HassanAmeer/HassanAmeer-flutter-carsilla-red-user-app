import 'package:flutter/material.dart';
import '../resources/urls.dart';
import '../services/NetworkApiService.dart';

class VhicleTransHomeAssisRepC {
  //////////////
  static addVTHomeAssisRepF(context, data) async {
    try {
      final checkrepsonse = await ApiClass()
          .postApiData(ApiUrls.baseUrl + ApiUrls.addvthomeassis, data);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when addVTHomeAssisVmF api in repo ------------------------------');
    }
  }
  //////////////
}
