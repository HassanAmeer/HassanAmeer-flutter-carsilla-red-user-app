import 'package:carsilla/services/userstorage.dart';
import 'package:flutter/material.dart';
import '../resources/urls.dart';
import '../services/NetworkApiService.dart';

class InsuranceRepC {
  static getInsuranceRepC(context) async {
    final userid = await StorageClass.getuseridf();
    try {
      final checkrepsonse = await ApiClass().getApiData(
          ApiUrls.baseUrl + ApiUrls.getinsuranceordersbyuserid + userid);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when getInsuranceRepC api in repo ------------------------------');
    }
  }

  static getInsuranceCompaniesRepC(context) async {
    final userid = await StorageClass.getuseridf();
    try {
      final checkrepsonse = await ApiClass()
          .getApiData(ApiUrls.baseUrl + ApiUrls.getinsurancecompanies);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when getInsuranceCompaniesRepC api in repo ------------------------------');
    }
  }

  //////////////
  static addInsuranceRepC(context, data) async {
    // final userid = await StorageClass.getuseridf();
    try {
      final checkrepsonse = await ApiClass()
          .postApiData(ApiUrls.baseUrl + ApiUrls.addinsranceorder, data);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when addInsuranceRepC api in repo ------------------------------');
    }
  }
  //////////////
}
