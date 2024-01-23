import 'package:carsilla/services/userstorage.dart';
import 'package:flutter/material.dart';

import '../repo/carlistingrep.dart';
import '../services/toast.dart';

class CarListingVmC with ChangeNotifier {
  List carListingFavId = [];
  List carListingDataList = [];
  List carDealersDataList = [];
  getCarListingDataVmF(context) async {
    final response = await CarListingRepC.getCarListingDataRepF(context);
    if (response['status'].toString() == 'true') {
      carListingDataList = response['data'];
    }
    notifyListeners();
  }

  ///////////
  getDealersDataVmF(context) async {
    final response = await CarListingRepC.getDealersDataRepF(context);
    if (response['status'].toString() == 'true') {
      carDealersDataList = response['data'];
    }
    notifyListeners();
  }

  ////////////
  addCarListingDataVmF(context,
      {String? user_id,
      String? listing_type,
      String? listing_year,
      String? listing_model,
      String? listing_desc,
      String? listing_title,
      List? imagesList,
      String? listing_price,
      String? features_gear,
      String? features_speed,
      String? features_seats,
      String? features_fuel_type,
      String? features_door,
      String? features_climate_zone,
      String? features_cylinders,
      List? features_others,
      String? features_bluetooth}) async {
    final response = await CarListingRepC().addCarListingDataRepF(context,
        user_id: user_id,
        listing_type: listing_type,
        listing_model: listing_model,
        listing_year: listing_year,
        listing_title: listing_title,
        listing_desc: listing_desc,
        imagesList: imagesList,
        listing_price: listing_price,
        features_gear: features_gear,
        features_speed: features_speed,
        features_seats: features_seats,
        features_door: features_door,
        features_fuel_type: features_fuel_type,
        features_climate_zone: features_climate_zone,
        features_cylinders: features_cylinders,
        features_bluetooth: features_bluetooth,
        features_others: features_others);
    if (response['status'].toString() == 'true') {
      showtoastF(context, 'Listing Added');
    } else {
      showtoastF(context, 'Try Later');
    }
    notifyListeners();
  }
  ///////////////

  addCarListingFav(String id) async {
    await StorageClass.addCarListingFav(id);
    getCarListingFav();
  }

  getCarListingFav() async {
    carListingFavId = await StorageClass.getCarListingFav();
    notifyListeners();
  }
  ///////////////
}
