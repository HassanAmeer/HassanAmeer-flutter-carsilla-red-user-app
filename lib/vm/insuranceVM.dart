import 'package:flutter/material.dart';

import '../repo/insurancerepo.dart';
import '../services/toast.dart';

class InsuranceVmC with ChangeNotifier {
  List insuranceList = [];
  List insuranceCompaniesList = [];
  getInsuranceVmF(context) async {
    final response = await InsuranceRepC.getInsuranceRepC(context);
    if (response['status'].toString() == 'true') {
      insuranceList = response['data'];
    }
    notifyListeners();
  }

  getInsuranceCompaniesVmF(context) async {
    final response = await InsuranceRepC.getInsuranceCompaniesRepC(context);
    if (response['status'].toString() == 'true') {
      // insuranceCompaniesList.clear();
      insuranceCompaniesList = response['data'];
    }
    notifyListeners();
  }

  ////////////
  addInsuranceVmF(data, context) async {
    final resdata = await InsuranceRepC.addInsuranceRepC(data, context);
    if (resdata['status'].toString() == 'true') {
      showtoastF(context, 'Request submitted');
    } else {
      showtoastF(context, 'Try Later');
    }
  }
}
