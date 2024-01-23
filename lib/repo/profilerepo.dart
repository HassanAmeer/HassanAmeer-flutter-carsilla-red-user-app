import 'package:flutter/material.dart';
import '../resources/urls.dart';
import '../services/NetworkApiService.dart';

class ProfileRepo {
  /////////////
  static checkProfileF(context, phone) async {
    try {
      final checkrepsonse = await ApiClass().getApiData(
          ApiUrls.baseUrl + ApiUrls.checkuserbyphone + phone.toString());

      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- try catch when check profile api in repo ------------------------------');
    }
  }

  //////////////
  // static getProfileF(context) async {
  //   try {
  //     final checkrepsonse =
  //         await ApiClass().getApiData(ApiUrls.baseUrl + ApiUrls.getprofile);
  //     return checkrepsonse;
  //   } catch (e) {
  //     debugPrint(
  //         '$e-------- try catch when get profile api in repo ------------------------------');
  //   }
  // }

/////////////////////
  static updateProfileF(data, withImage, context) async {
    try {
      final checkrepsonse = await ApiClass().postImageWithData(
          ApiUrls.baseUrl + ApiUrls.updateprofile, data, withImage);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- try catch when update profile api in repo ------------------------------');
    }
  }

  ///////////////////
  static updateEmailF(data, context) async {
    try {
      final checkrepsonse = await ApiClass()
          .postApiData(ApiUrls.baseUrl + ApiUrls.emailupdate, data);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- try catch when update email api in repo ------------------------------');
    }
  }

  ///////////////////
  static updatePasswordF(data, context) async {
    try {
      final checkrepsonse = await ApiClass()
          .postApiData(ApiUrls.baseUrl + ApiUrls.passwordupdate, data);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- try catch when update password api in repo ------------------------------');
    }
  }
}
