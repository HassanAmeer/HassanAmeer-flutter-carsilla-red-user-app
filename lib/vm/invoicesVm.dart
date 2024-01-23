import 'package:flutter/material.dart';

import '../repo/invoicesrepo.dart';

class InvoicesVmC with ChangeNotifier {
  List invoicesListOfAssis = [];
  getInvoiceDataVmF(context) async {
    final response = await InvoicesRepC.getInvoicesRepC(context);
    if (response['status'].toString() == 'true') {
      invoicesListOfAssis = response['data'];
    }
    notifyListeners();
  }
}
