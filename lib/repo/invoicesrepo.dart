import 'package:flutter/material.dart';
import '../resources/urls.dart';
import '../services/NetworkApiService.dart';

class InvoicesRepC {
  static getInvoicesRepC(context) async {
    try {
      final checkrepsonse =
          await ApiClass().getApiData(ApiUrls.baseUrl + ApiUrls.getInvoices);
      return checkrepsonse;
    } catch (e) {
      debugPrint(
          '$e-------- 🎈 try catch when getInvoicesRepC api in repo ------------------------------');
    }
  }
}
