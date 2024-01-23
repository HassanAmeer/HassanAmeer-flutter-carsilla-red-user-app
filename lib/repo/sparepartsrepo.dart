import 'package:flutter/material.dart';

import '../resources/urls.dart';
import '../services/NetworkApiService.dart';

class SparePartsRepC {
  static addRepairingCarRepF(data, context) async {
    try {
      final checkrepsonse = await ApiClass()
          .postApiData(ApiUrls.baseUrl + ApiUrls.addrepairingcars, data);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when addRepairingCarRepF api in repo ------------------------------');
    }
  }

///////////
  static getRepairingCarsRepoF(context) async {
    try {
      final checkrepsonse = await ApiClass()
          .getApiData(ApiUrls.baseUrl + ApiUrls.getrepairingcars);

      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when getRepairingCarsRepoF api in repo ------------------------------');
    }
  }

///////////
  static getSparePartsRepoF(context) async {
    try {
      final checkrepsonse =
          await ApiClass().getApiData(ApiUrls.baseUrl + ApiUrls.getspareparts);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when getSparePartsRepoF api in repo ------------------------------');
    }
  }

///////////
  static getSparePartsShopsepoF(context) async {
    try {
      final checkrepsonse = await ApiClass()
          .getApiData(ApiUrls.baseUrl + ApiUrls.getsparepartsshops);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when getSparePartsShopsepoF api in repo ------------------------------');
    }
  }
  /////////
}
