import 'package:flutter/material.dart';

import '../resources/urls.dart';
import '../services/NetworkApiService.dart';

class RoadSideAssisRepC {
  static sendHomeAssisRepC(data, context) async {
    try {
      final checkrepsonse = await ApiClass()
          .postApiData(ApiUrls.baseUrl + ApiUrls.addDataToHomeAssis, data);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when addDataToHomeAssis api in repo ------------------------------');
    }
  }

  static sendRoadAssisRepC(data, context) async {
    try {
      final checkrepsonse = await ApiClass()
          .postApiData(ApiUrls.baseUrl + ApiUrls.addDataToRoadAssis, data);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when sendRoadAssisRepC api in repo ------------------------------');
    }
  }
}
